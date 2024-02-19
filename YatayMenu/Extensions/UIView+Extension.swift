//
//  UIView+Extensions.swift
//  YatayMenu
//
//  Created by Ahmet Karamanoğlu on 18.02.2024.
//

import UIKit

extension UIView {
    //butonumuza kosesini yumusatmak icin bir ozellik verdik. Artik storyboardda main butona tiklayinca View kisminda bu cornerRadius gozukecek.
   @IBInspectable var cornerRadius: CGFloat {
        get { return cornerRadius}
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
