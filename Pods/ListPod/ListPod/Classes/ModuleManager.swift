//
//  DependencyManager.swift
//  ListPod
//
//  Created by gxy on 2019/9/15.
//

import Foundation

public class Dependency {
    let coordinator: ListPodCoordinatorType

    public init(coordinator: ListPodCoordinatorType) {
        self.coordinator = coordinator
    }
}

public class ModuleManager {
    public static let shared = ModuleManager()

    private init() {}

    private(set) var dependency: Dependency?

    public func injectDependency(_ dependency: Dependency) {
        self.dependency = dependency
    }

}
