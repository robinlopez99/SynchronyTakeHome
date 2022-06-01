//
//  TitleTableViewCell.swift
//  SynchronyProject
//
//  Created by Robin Lopez Ordonez on 1/23/21.
//

import UIKit

struct TitleTableViewCellViewModel: CellViewModel {
    var cellHeight: CGFloat
    let text: String
    let textAlign: NSTextAlignment
    let textColor: UIColor
    let textFontSize: CGFloat
    let backgroundColor: UIColor
}

class TitleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    
    static func nib() -> UINib {
        return UINib(nibName: "TitleTableViewCell", bundle: nil)
    }
    
    func configure(viewModel: TitleTableViewCellViewModel) {
        self.backgroundColor = viewModel.backgroundColor
        label.text = viewModel.text
        label.textColor = viewModel.textColor
        label.textAlignment = viewModel.textAlign
        label.font = UIFont.systemFont(ofSize: viewModel.textFontSize)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
