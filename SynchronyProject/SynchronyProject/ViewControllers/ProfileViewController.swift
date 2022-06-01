//
//  ProfileViewController.swift
//  SynchronyProject
//
//  Created by Robin Lopez Ordonez on 1/23/21.
//

import UIKit

struct ProfileViewControllerViewModel {
    let navigationTitle: String
    let navigationTitleFontSize: CGFloat
    let tableViewSeparatorStyle: UITableViewCell.SeparatorStyle
}

protocol ProfileViewControllerDelegate {
    func backPressed()
}

class ProfileViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: ProfileViewControllerViewModel?
    var delegate: ProfileViewControllerDelegate?
    var dataSource = [CellViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupDataSource()
        setupNavBar()
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.separatorStyle = viewModel?.tableViewSeparatorStyle ?? .none
        
        tableView.register(TitleTableViewCell.nib(), forCellReuseIdentifier: "TitleTableViewCell")
        tableView.register(ImageTableViewCell.nib(), forCellReuseIdentifier: "ImageTableViewCell")
        tableView.register(TitleDetailTableViewCell.nib(), forCellReuseIdentifier: "TitleDetailTableViewCell")
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

// MARK: Data Source
extension ProfileViewController {
    private func setupDataSource() {
        guard let pic = UIImage(named: "photo") else { return }

        dataSource = [TitleTableViewCellViewModel(cellHeight: 50.0,
                                                 text: "Robin Lopez",
                                                 textAlign: .center,
                                                 textColor: .black,
                                                 textFontSize: 28.0,
                                                 backgroundColor: .white),
                      ImageTableViewCellViewModel(cellHeight: 200.0,
                                                  image: pic,
                                                  backgroundColor: .white),
                      TitleTableViewCellViewModel(cellHeight: 80.0,
                                                  text: "Work Experience",
                                                  textAlign: .center,
                                                  textColor: .black,
                                                  textFontSize: 28.0,
                                                  backgroundColor: UIColor.synchYellow),
                      TitleDetailTableViewCellViewModel(cellHeight: 200.0,
                                                        title: "Synchrony : Jan 2020 - present",
                                                        titleFontSize: 20.0,
                                                        detailLine1: "-Use MVVM architecture, Coordinator design pattern, Delegates, and Protocols to easily add new features into the app.",
                                                        detailLine2: "-Develop Swift code that is intuitive, scalable, and maintainable.",
                                                        detailLine3: "-Help with expansion and improvement of CareCredit’s accessibility features to make the app more user-friendly.",
                                                        detailLineFontSize: 16.0,
                                                        backgroundColor: .white),
                      TitleDetailTableViewCellViewModel(cellHeight: 200.0,
                                                        title: "CultureTech : Oct 2019 - present",
                                                        titleFontSize: 20.0,
                                                        detailLine1: "-Write and maintain Python scripts to download data from multiple web APIs.",
                                                        detailLine2: "-Develop thorough documentation of scripts so they can be used by anyone in the organization.",
                                                        detailLine3: "-Convert data to the needed file type for ingestion into the company’s own API.",
                                                        detailLineFontSize: 16.0,
                                                        backgroundColor: .white),
                      TitleTableViewCellViewModel(cellHeight: 80.0,
                                                  text: "Education",
                                                  textAlign: .center,
                                                  textColor: .black,
                                                  textFontSize: 28.0,
                                                  backgroundColor: UIColor.synchYellow),
                      TitleDetailTableViewCellViewModel(cellHeight: 100,
                                                        title: "University Of Connecticut",
                                                        titleFontSize: 20.0,
                                                        detailLine1: "Bachelor of Science, Computer Science",
                                                        detailLine2: "GPA: 3.56",
                                                        detailLine3: "Sep 2017 - May 2021",
                                                        detailLineFontSize: 16.0,
                                                        backgroundColor: .white)
        ]
    }
}

// MARK: TableView Items

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
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
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
}
