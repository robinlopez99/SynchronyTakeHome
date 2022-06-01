//
//  ImageTableViewCell.swift
//  SynchronyProject
//
//  Created by Robin Lopez Ordonez on 1/23/21.
//

import UIKit

struct ImageTableViewCellViewModel: CellViewModel {
    var cellHeight: CGFloat
    let image: UIImage
    let backgroundColor: UIColor
}

class ImageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var picture: UIImageView!
    
    static func nib() -> UINib {
        return UINib(nibName: "ImageTableViewCell", bundle: nil)
    }
    
    func configure(viewModel: ImageTableViewCellViewModel) {
        self.picture.image = viewModel.image
        self.backgroundColor = viewModel.backgroundColor
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
