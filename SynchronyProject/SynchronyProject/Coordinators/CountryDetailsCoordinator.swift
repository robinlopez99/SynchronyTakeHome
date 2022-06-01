//
//  CountryDetailsCoordinator.swift
//  SynchronyProject
//
//  Created by Robin Lopez Ordonez on 1/24/21.
//

import UIKit

protocol CountryDetailsCoordinatorDelegate {
    func backPressed(coordinator: Coordinator)
}

class CountryDetailsCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var countryData: CountriesModel
    var delegate: CountryDetailsCoordinatorDelegate?
    
    init(navigationController: UINavigationController, countryData: CountriesModel) {
        self.navigationController = navigationController
        self.countryData = countryData
    }
    
    func start() {
        let viewModel = CountryDetailsViewControllerViewModel(navigationTitleFontSize: 25.0,
                                                              tableViewSeparatorStyle: .singleLine ,
                                                              countryData: countryData,
                                                              backgroundColor: .white)
        let vc = CountryDetailsViewController.instantiate()
        vc.delegate = self
        vc.viewModel = viewModel
        navigationController.pushViewController(vc, animated: true)
    }
}

extension CountryDetailsCoordinator: CountryDetailsViewControllerDelegate {
    func backPressed() {
        childCoordinators.removeAll()
        delegate?.backPressed(coordinator: self)
    }
    
    
}
