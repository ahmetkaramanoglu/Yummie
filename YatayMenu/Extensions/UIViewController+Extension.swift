//
//  UIViewController+Extension.swift
//  YatayMenu
//
//  Created by Ahmet Karamanoğlu on 20.02.2024.
//

import UIKit

extension UIViewController {
    static private var identifier: String{
        return String(describing: self)
    }
    static func instantiate() -> Self {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(identifier: identifier) as! Self
    }
}


