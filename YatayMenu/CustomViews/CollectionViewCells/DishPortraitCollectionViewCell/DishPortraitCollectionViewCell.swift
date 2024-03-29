//
//  DishPortraitCollectionViewCell.swift
//  YatayMenu
//
//  Created by Ahmet Karamanoğlu on 19.02.2024.
//

import UIKit
import Kingfisher

class DishPortraitCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: DishPortraitCollectionViewCell.self)
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var dishImageView: UIImageView!
    
    @IBOutlet weak var caloriesLbl: UILabel!
    
    @IBOutlet weak var descriptionLbl: UILabel!
    
    func setup(dish: Dish){
        titleLbl.text = dish.name
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        caloriesLbl.text = dish.formattedCalories
        descriptionLbl.text = dish.description
        
    }
}
