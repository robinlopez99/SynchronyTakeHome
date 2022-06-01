//
//  ProfileCoordinator.swift
//  SynchronyProject
//
//  Created by Robin Lopez Ordonez on 1/23/21.
//

import UIKit

protocol ProfileCoordinatorDelegate {
    func backPressed(coordinator: Coordinator)
}

class ProfileCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var delegate: ProfileCoordinatorDelegate?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = ProfileViewControllerViewModel(navigationTitle: "Profile",
                                                       navigationTitleFontSize: 25.0,
                                                       tableViewSeparatorStyle: .none)
        let vc = ProfileViewController.instantiate()
        vc.delegate = self
        vc.viewModel = viewModel
        navigationController.pushViewController(vc, animated: true)
    }
}

extension ProfileCoordinator: ProfileViewControllerDelegate {
    func backPressed() {
        childCoordinators.removeAll()
        delegate?.backPressed(coordinator: self)
    }
}
