//
//  FieldsTableViewCell.swift
//  SynchronyProject
//
//  Created by Robin Lopez Ordonez on 1/24/21.
//

import UIKit

protocol CellViewModel {
    var cellHeight: CGFloat {get set}
}

struct FieldsTableViewCellViewModel: CellViewModel {
    var cellHeight: CGFloat
    let keyLabelText: String
    let valueLabelText: String
    let backgroundColor: UIColor
}

class FieldsTableViewCell: UITableViewCell {

    @IBOutlet weak var fieldKeyLabel: UILabel!
    @IBOutlet weak var fieldValueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "FieldsTableViewCell", bundle: nil)
    }
    
    func configure(viewModel: FieldsTableViewCellViewModel) {
        self.backgroundColor = viewModel.backgroundColor
        
        fieldKeyLabel.text = viewModel.keyLabelText
        fieldKeyLabel.font = UIFont.systemFont(ofSize: 20.0)
        fieldKeyLabel.backgroundColor = .clear
        
        fieldValueLabel.text = viewModel.valueLabelText
        fieldValueLabel.font = UIFont.systemFont(ofSize: 16.0)
        fieldValueLabel.textAlignment = .right
        fieldValueLabel.backgroundColor = .clear
    }
    
}
