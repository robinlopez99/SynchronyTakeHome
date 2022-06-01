//
//  TitleDetailTableViewCell.swift
//  SynchronyProject
//
//  Created by Robin Lopez Ordonez on 1/23/21.
//

import UIKit

struct TitleDetailTableViewCellViewModel: CellViewModel {
    var cellHeight: CGFloat
    let title: String
    let titleFontSize: CGFloat
    let detailLine1: String
    let detailLine2: String
    let detailLine3: String
    let detailLineFontSize: CGFloat
    let backgroundColor: UIColor
}

class TitleDetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLine1: UILabel!
    @IBOutlet weak var detailLine2: UILabel!
    @IBOutlet weak var detailLine3: UILabel!
    
    
    static func nib() -> UINib {
        return UINib(nibName: "TitleDetailTableViewCell", bundle: nil)
    }

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(viewModel: TitleDetailTableViewCellViewModel) {
        self.backgroundColor = viewModel.backgroundColor
        
        titleLabel.text = viewModel.title
        titleLabel.font = UIFont.boldSystemFont(ofSize: viewModel.titleFontSize)
        titleLabel.backgroundColor = .clear
        
        detailLine1.text = viewModel.detailLine1
        detailLine1.font = UIFont.systemFont(ofSize: viewModel.detailLineFontSize)
        
        detailLine2.text = viewModel.detailLine2
        detailLine2.font = UIFont.systemFont(ofSize: viewModel.detailLineFontSize)
        
        detailLine3.text = viewModel.detailLine3
        detailLine3.font = UIFont.systemFont(ofSize: viewModel.detailLineFontSize)
        
        
    }

    
}
