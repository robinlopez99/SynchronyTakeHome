//
//  WelcomeViewController.swift
//  SynchronyProject
//
//  Created by Robin Lopez Ordonez on 1/23/21.
//

import UIKit

struct WelcomeViewControllerViewModel {
    let navigationTitle: String
    let navigationTitleFontSize: CGFloat
}

protocol WelcomeViewControllerDelegate {
    func profileButtonPressed()
    func dataButtonPressed()
}

class WelcomeViewController: UIViewController, Storyboarded {

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var dataButton: UIButton!
    var delegate: WelcomeViewControllerDelegate?
    var viewModel: WelcomeViewControllerViewModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stackView.backgroundColor = .white
        stackView.spacing = 10.0
        setupButtons()
        setupNavBar()
    }
    
    private func setupNavBar() {
        navigationItem.title = viewModel?.navigationTitle
        navigationItem.backButtonTitle = "Back"
        navigationController?.navigationBar.barTintColor = UIColor.synchGray
        
        let titleFont = UIFont.systemFont(ofSize: viewModel?.navigationTitleFontSize ?? 25.0)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: titleFont]
    }
    
    private func setupButtons() {
        profileButton.backgroundColor = UIColor.synchYellow
        profileButton.setTitleColor(UIColor.synchGray, for: .normal)
        profileButton.layer.borderWidth = 2.0
        profileButton.layer.borderColor = UIColor.synchGray.cgColor
        profileButton.layer.cornerRadius = 15.0
        
        dataButton.backgroundColor = UIColor.synchYellow
        dataButton.setTitleColor(UIColor.synchGray, for: .normal)
        dataButton.layer.borderWidth = 2.0
        dataButton.layer.borderColor = UIColor.synchGray.cgColor
        dataButton.layer.cornerRadius = 15.0
    }

    @IBAction func profileButtonPressed(_ sender: Any) {
        delegate?.profileButtonPressed()
    }
    
    
    @IBAction func dataButtonPressed(_ sender: Any) {
        delegate?.dataButtonPressed()
    }
    
}
