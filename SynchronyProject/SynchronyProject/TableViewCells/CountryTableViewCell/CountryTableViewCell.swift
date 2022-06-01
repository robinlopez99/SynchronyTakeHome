//
//  CountryTableViewCell.swift
//  SynchronyProject
//
//  Created by Robin Lopez Ordonez on 1/24/21.
//

import UIKit

struct CountryTableViewCellViewModel: CellViewModel {
    var cellHeight: CGFloat
    let countryCode: String
    let countryName: String
    let countryNameFontSize: CGFloat
    let backgroundColor: UIColor
}

class CountryTableViewCell: UITableViewCell {

    @IBOutlet weak var flagLabel: UILabel!
    @IBOutlet weak var countryNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "CountryTableViewCell", bundle: nil)
    }
    
    func configure(viewModel: CountryTableViewCellViewModel) {
        flagLabel.text = convertCodeToFlag(code: viewModel.countryCode)
        countryNameLabel.text = viewModel.countryName
        countryNameLabel.font = UIFont.systemFont(ofSize: viewModel.countryNameFontSize)
        
        self.backgroundColor = viewModel.backgroundColor
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
