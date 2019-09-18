//
//  DependencyManager.swift
//  ListPod
//
//  Created by gxy on 2019/9/15.
//

import Foundation

@objcMembers public class Dependency: NSObject {
    let coordinator: ListPodCoordinatorType

    public init(coordinator: ListPodCoordinatorType) {
        self.coordinator = coordinator
    }
}

@objcMembers public class ModuleManager: NSObject {
    public static let shared = ModuleManager()

    private override init() {}

    private(set) var dependency: Dependency?

    public func injectDependency(_ dependency: Dependency) {
        self.dependency = dependency
    }

}
