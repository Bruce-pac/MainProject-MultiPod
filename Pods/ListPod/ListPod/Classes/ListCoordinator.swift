//
//  ListCoordinator.swift
//  ListPod
//
//  Created by 顾鑫烨 on 2019/10/31.
//

import Foundation
import XDCoordinator

@objcMembers public class ListCoordinator: NavigationCoordinator {
    override public func start() {
        let list = ListViewController()
        list.delegate = self
        list.viewModel = ListViewModel()
        self.rootVC?.pushViewController(list, animated: true)
        
    }
}

extension ListCoordinator: ListViewControllerDelegate{
    func onSelect(item: ListItem) {
        let detail = DetailViewController(item: item)
        detail.delegate = self
        self.rootVC?.pushViewController(detail, animated: true)
    }
    
}

extension ListCoordinator: DetailViewControllerDelegate{
    func onTapPay(_ vc: DetailViewController) {
        ModuleManager.shared.dependency?.coordinator.jumpPayPage(based: vc, with: vc.item)
    }
}

//写这个是因为无法在oc里调用泛型类，所以曲线救国。即使ListCoordinator明明是继承的oc的泛型类。。。
@objcMembers public class ListCoordinatorFactory: NSObject{
    public func makeCoordinator(with rootNav: UINavigationController) -> Coordinator {
        let list = ListCoordinator(rootVC: rootNav)
        return list
    }
}
