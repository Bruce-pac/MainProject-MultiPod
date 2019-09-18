//
//  ListPodCoordinatorType.swift
//  ListPod
//
//  Created by gxy on 2019/9/14.
//

import Foundation

@objc public protocol ListPodCoordinatorType: AnyObject {
    func jumpPayPage(based vc: UIViewController, with data: Any)
}
