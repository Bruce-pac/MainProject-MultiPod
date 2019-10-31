//
//  ListCoordinator.swift
//  ListPod
//
//  Created by 顾鑫烨 on 2019/10/31.
//

import Foundation
import XDCoordinator

@objcMembers public class ListCoordinator: NavigationCoordinator {
    public override func start() {
        let list = ListViewController()
        list.delegate = self
        list.viewModel = ListViewModel()
        self.rootVC?.pushViewController(list, animated: true)
        
    }
}
 
//写这个是因为无法在oc里调用泛型类，所以曲线救国。即使ListCoordinator明明是继承的oc的泛型类。。。
@objcMembers public class ListCoordinatorFactory: NSObject{
    public func makeCoordinator(with rootNav: UINavigationController) -> Coordinator {
        let list = ListCoordinator(rootVC: rootNav)
        return list
    }
}
