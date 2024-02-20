//
//  DishDetailViewController.swift
//  YatayMenu
//
//  Created by Ahmet Karamanoğlu on 20.02.2024.
//

import UIKit

class DishDetailViewController: UIViewController {

    var dish: Dish?
    
    @IBOutlet weak var dishImageView: UIImageView!
    
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var caloriesLbl: UILabel!
    
    @IBOutlet weak var descriptionLbl: UILabel!
    
    @IBOutlet weak var nameField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    @IBAction func placeOrderBtnClicked(_ sender: Any) {
    }
    
    private func setup(_ dish: Dish?) {
        dishImageView.kf.setImage(with: dish?.image?.asUrl)
        titleLbl.text = dish?.name
        caloriesLbl.text = dish?.formattedCalories
        descriptionLbl.text = dish?.description
    }
}
