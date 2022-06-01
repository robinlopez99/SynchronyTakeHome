//
//  AppCoordinator.swift
//  SynchronyProject
//
//  Created by Robin Lopez Ordonez on 1/23/21.
//

import UIKit

class AppCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var countriesService = CountriesService()
    var countriesData: [CountriesModel]
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.countriesData = countriesService.getCountries()
    }
    
    func start() {
        let viewModel = WelcomeViewControllerViewModel(navigationTitle: "Welcome!",
                                                       navigationTitleFontSize: 25.0)
        let vc = WelcomeViewController.instantiate()
        vc.delegate = self
        vc.viewModel = viewModel
        navigationController.pushViewController(vc, animated: true)
    }
}

extension AppCoordinator: WelcomeViewControllerDelegate {
    func profileButtonPressed() {
        let profileCoord = ProfileCoordinator(navigationController: navigationController)
        profileCoord.delegate = self
        childCoordinators.append(profileCoord)
        profileCoord.start()
    }
    
    func dataButtonPressed() {
        let countriesCoord = CountriesCoordinator(navigationController: navigationController,
                                                  countryData: countriesData)
        countriesCoord.delegate = self
        childCoordinators.append(countriesCoord)
        countriesCoord.start()
    }
}

extension AppCoordinator: CountriesCoordinatorDelegate, ProfileCoordinatorDelegate {
    func backPressed(coordinator: Coordinator) {
        dismiss(coordinator: coordinator)
    }
}
