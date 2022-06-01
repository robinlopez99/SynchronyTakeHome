//
//  Coordinator.swift
//  SynchronyProject
//
//  Created by Robin Lopez Ordonez on 1/23/21.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] {get set}
    var navigationController: UINavigationController {get set}
    
    func start()
    func dismiss(coordinator: Coordinator)
}

extension Coordinator {
    func dismiss(coordinator: Coordinator) {
        navigationController.popViewController(animated: true)
        for (index, coord) in childCoordinators.enumerated() {
            if coordinator === coord {
                childCoordinators.remove(at: index)
                return
            }
        }
    }
}


