//
//  CategoryCollectionViewCell.swift
//  YatayMenu
//
//  Created by Ahmet Karamanoğlu on 18.02.2024.
//

import UIKit
import Kingfisher

class CategoryCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: CategoryCollectionViewCell.self)
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var categoryImageView: UIImageView!
    
    @IBOutlet weak var categoryTitleLabel: UILabel!
    
    //yemek kategorisi olacak.
    func setup(category: DishCategory) {
        categoryTitleLabel.text = category.name
        categoryImageView.kf.setImage(with: category.image?.asUrl)
    }
}
