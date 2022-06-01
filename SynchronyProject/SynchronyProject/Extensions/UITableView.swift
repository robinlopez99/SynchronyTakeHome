//
//  UITableView.swift
//  SynchronyProject
//
//  Created by Robin Lopez Ordonez on 1/24/21.
//

import UIKit

extension UITableViewDataSource {
    
    func configure(cell: UITableViewCell, viewModel: CellViewModel){
        switch (cell, viewModel) {
        case let (cell as TitleTableViewCell, viewModel as TitleTableViewCellViewModel):
            cell.configure(viewModel: viewModel)
        case let (cell as ImageTableViewCell, viewModel as ImageTableViewCellViewModel):
            cell.configure(viewModel: viewModel)
        case let (cell as TitleDetailTableViewCell, viewModel as TitleDetailTableViewCellViewModel):
            cell.configure(viewModel: viewModel)
        case let (cell as CountryTableViewCell, viewModel as CountryTableViewCellViewModel):
            cell.configure(viewModel: viewModel)
        case let (cell as FieldsTableViewCell, viewModel as FieldsTableViewCellViewModel):
            cell.configure(viewModel: viewModel)
        default:
            fatalError()
        }
    }
    
    func identify(viewModel: CellViewModel) -> String {
        switch viewModel {
        case is TitleTableViewCellViewModel:
            return "TitleTableViewCell"
        case is ImageTableViewCellViewModel:
            return "ImageTableViewCell"
        case is TitleDetailTableViewCellViewModel:
            return "TitleDetailTableViewCell"
        case is CountryTableViewCellViewModel:
            return "CountryTableViewCell"
        case is FieldsTableViewCellViewModel:
            return "FieldsTableViewCell"
        default:
            fatalError()
        }
        
    }
}
