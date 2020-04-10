//
//  ListCoordinator.swift
//  ListPod
//
//  Created by Bruce on 2019/10/31.
//

import Foundation
import LBCoordinator

@objcMembers public class LBCoordinatorEvent: NSObject {
    public static let detailBToAccount = LBCoordinatorEventName.detailBToAccount
}

public extension LBCoordinatorEventName {
    static var detailBToAccount = LBCoordinatorEventName(rawValue: "detailBToAccount")
}

@objcMembers public class ListCoordinator: LBNavigationCoordinator {
    override public func start() {
        let list = ListViewController()
        list.delegate = self
        list.viewModel = ListViewModel()
        self.rootVC.pushViewController(list, animated: true)
    }

}

extension ListCoordinator: ListViewControllerDelegate{
    func onSelect(item: ListItem) {
        // 模拟A/B测试
        let isiPhoneX = arc4random_uniform(100).isMultiple(of: 2)
        if isiPhoneX {
            let detail = DetailTestAViewController(item: item)
            detail.delegate = self
            self.rootVC.pushViewController(detail, animated: true)
        }else{
            let detail = DetailTestBViewController(item: item)
            self.rootVC.pushViewController(detail, animated: true)
        }
    }

}

extension ListCoordinator: DetailTestAViewControllerDelegate {
    func onTapPay(_ vc: DetailTestAViewController) {
        ModuleManager.shared.dependency?.coordinator.listCoordinator(self, jumpPayPageWith: ListItemOC(item: vc.item))
    }
}

//写这个是因为无法在oc里调用泛型类，所以曲线救国。即使ListCoordinator明明是继承的oc的泛型类。。。
@objcMembers public class ListCoordinatorFactory: NSObject{
    public func makeCoordinator(with rootNav: UINavigationController) -> LBCoordinating {
        let list = ListCoordinator(rootVC: rootNav)
        return list
    }
}
