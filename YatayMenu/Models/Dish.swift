//
//  Dish.swift
//  YatayMenu
//
//  Created by Ahmet Karamanoğlu on 19.02.2024.
//

import Foundation

struct Dish {
    //API cagrilari vs optional olmasi daha iyi.
    let id, name, description, image: String?
    let calories: Int?
   
    //calori label'a veriyi verdigimiz zaman direkt olarak bunu veriyoruz.
    var formattedCalories: String {
        return "\(calories ?? 0) calories"
        
    }
}
