//
//  CountriesViewController.swift
//  SynchronyProject
//
//  Created by Robin Lopez Ordonez on 1/24/21.
//

import UIKit

struct CountriesViewControllerViewModel {
    let navigationTitle: String
    let navigationTitleFontSize: CGFloat
    let tableViewSeparatorStyle: UITableViewCell.SeparatorStyle
    let countriesData: [CountriesModel]
}

protocol CountriesViewControllerDelegate {
    func countrySelected(countryData: CountriesModel)
    func backPressed()
}

class CountriesViewController: UIViewController, Storyboarded {

    @IBOutlet weak var tableView: UITableView!
    
    var dataSource = [CellViewModel]()
    var delegate: CountriesViewControllerDelegate?
    var viewModel: CountriesViewControllerViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDataSource()
        setupTableView()
        setupNavBar()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.separatorStyle = viewModel?.tableViewSeparatorStyle ?? .none
        
        tableView.register(CountryTableViewCell.nib(), forCellReuseIdentifier: "CountryTableViewCell")
    }
    
    private func setupNavBar() {
        navigationItem.title = viewModel?.navigationTitle
        navigationController?.navigationBar.barTintColor = UIColor.synchGray
        let titleFont = UIFont.systemFont(ofSize: viewModel?.navigationTitleFontSize ?? 25.0)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: titleFont]
        
        let backButton = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(backPressed))
        navigationItem.leftBarButtonItem = backButton
    }
    
    @objc private func backPressed() {
        delegate?.backPressed()
    }
}

extension CountriesViewController {
    func setupDataSource() {
        guard let countriesData = viewModel?.countriesData else { return }
        
        for country in countriesData {
            dataSource.append(CountryTableViewCellViewModel(cellHeight: 60.0,
                                                            countryCode: country.alpha2Code,
                                                            countryName: country.name,
                                                            countryNameFontSize: 30.0,
                                                            backgroundColor: .white))
        }
    }
}

extension CountriesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellViewModel = dataSource[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: identify(viewModel: cellViewModel), for: indexPath)
        configure(cell: cell, viewModel: cellViewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return dataSource[indexPath.row].cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let countriesData = viewModel?.countriesData else { return }
        delegate?.countrySelected(countryData: countriesData[indexPath.row])
    }
    
}
