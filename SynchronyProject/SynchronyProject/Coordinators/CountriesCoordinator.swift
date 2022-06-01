//
//  CountriesCoordinator.swift
//  SynchronyProject
//
//  Created by Robin Lopez Ordonez on 1/24/21.
//

import UIKit

protocol CountriesCoordinatorDelegate {
    func backPressed(coordinator: Coordinator)
}

class CountriesCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var countryData: [CountriesModel]
    var delegate: CountriesCoordinatorDelegate?
    
    init(navigationController: UINavigationController, countryData: [CountriesModel]) {
        self.navigationController = navigationController
        self.countryData = countryData
    }
    
    func start() {
        let viewModel = CountriesViewControllerViewModel(navigationTitle: "Countries",
                                                         navigationTitleFontSize: 25.0,
                                                         tableViewSeparatorStyle: .singleLine,
                                                         countriesData: countryData)
        let vc = CountriesViewController.instantiate()
        vc.delegate = self
        vc.viewModel = viewModel
        navigationController.pushViewController(vc, animated: true)
    }
}

extension CountriesCoordinator: CountriesViewControllerDelegate {
    func countrySelected(countryData: CountriesModel) {
        let detailsCoord = CountryDetailsCoordinator(navigationController: navigationController,
                                                     countryData: countryData)
        detailsCoord.delegate = self
        childCoordinators.append(detailsCoord)
        detailsCoord.start()
    }
    
    func backPressed() {
        delegate?.backPressed(coordinator: self)
    }
}

extension CountriesCoordinator: CountryDetailsCoordinatorDelegate {
    func backPressed(coordinator: Coordinator) {
        childCoordinators.removeAll()
        dismiss(coordinator: coordinator)
    }
}
