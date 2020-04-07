//
//  ListPodCoordinatorType.swift
//  ListPod
//
//  Created by gxy on 2019/9/14.
//

import Foundation
import XDCoordinator

@objc public protocol ListModuleCoordinatorDelegate: AnyObject {
    func listCoordinator(_ coordinator: ListCoordinator, jumpPayPageWith data: ListItemOC)
}
