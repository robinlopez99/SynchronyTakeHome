//
//  CountryDetailsViewController.swift
//  SynchronyProject
//
//  Created by Robin Lopez Ordonez on 1/24/21.
//

import UIKit

struct CountryDetailsViewControllerViewModel {
    let navigationTitleFontSize: CGFloat
    let tableViewSeparatorStyle: UITableViewCell.SeparatorStyle
    let countryData: CountriesModel
    let backgroundColor: UIColor
}

protocol CountryDetailsViewControllerDelegate {
    func backPressed()
}

class CountryDetailsViewController: UIViewController, Storyboarded {

    @IBOutlet weak var tableView: UITableView!
    
    var dataSource = [CellViewModel]()
    var viewModel: CountryDetailsViewControllerViewModel?
    var delegate: CountryDetailsViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupDataSource()
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.separatorStyle = viewModel?.tableViewSeparatorStyle ?? .singleLine
        
        tableView.register(FieldsTableViewCell.nib(), forCellReuseIdentifier: "FieldsTableViewCell")
        tableView.register(TitleTableViewCell.nib(), forCellReuseIdentifier: "TitleTableViewCell")
        
    }
    
    private func setupNavBar() {
        navigationItem.title = viewModel?.countryData.name
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

extension CountryDetailsViewController {
    private func setupDataSource() {
        
        dataSource.append(TitleTableViewCellViewModel(cellHeight: 100.0,
                                                      text: convertCodeToFlag(code: viewModel?.countryData.alpha2Code ?? ""),
                                                      textAlign: .center,
                                                      textColor: .black,
                                                      textFontSize: 100.0,
                                                      backgroundColor: .white))
        
        dataSource.append(contentsOf: [ FieldsTableViewCellViewModel(cellHeight: 80.0,
                                                                     keyLabelText: "Population",
                                                                     valueLabelText: String(viewModel?.countryData.population ?? 0),
                                                                     backgroundColor: .white),
                                        FieldsTableViewCellViewModel(cellHeight: 80.0,
                                                                     keyLabelText: "Capital",
                                                                     valueLabelText: viewModel?.countryData.capital ?? "",
                                                                     backgroundColor: .white),
                                        FieldsTableViewCellViewModel(cellHeight: 80.0,
                                                                     keyLabelText: "Region",
                                                                     valueLabelText: viewModel?.countryData.region ?? "",
                                                                     backgroundColor: .white),
                                        FieldsTableViewCellViewModel(cellHeight: 80.0,
                                                                     keyLabelText: "Native Name",
                                                                     valueLabelText: viewModel?.countryData.nativeName ?? "",
                                                                     backgroundColor: .white),
                                        FieldsTableViewCellViewModel(cellHeight: 80.0,
                                                                     keyLabelText: "Language",
                                                                     valueLabelText: viewModel?.countryData.languages[0].name ?? "",
                                                                     backgroundColor: .white),
                                        FieldsTableViewCellViewModel(cellHeight: 80.0,
                                                                     keyLabelText: "Currency",
                                                                     valueLabelText: viewModel?.countryData.currencies[0].name ?? "",
                                                                     backgroundColor: .white),
        ])
    }
    
    private func convertCodeToFlag(code: String) -> String {
        let base : UInt32 = 127397
        var flag = ""
        for v in code.uppercased().unicodeScalars {
            flag.unicodeScalars.append(UnicodeScalar(base + v.value)!)
        }
        return flag
    }

}

extension CountryDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
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
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
}
