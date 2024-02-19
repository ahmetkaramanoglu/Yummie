//
//  CardView.swift
//  YatayMenu
//
//  Created by Ahmet Karamanoğlu on 19.02.2024.
//

import UIKit


/*
 Burayo FoodCategory kismindaki seceneklerimize ozellik kazandirmak icin yapiyoruz. Yani burada ozellestiriyoruz diyebiliriz. Ve XIB dosyasinda bu cell'in sinifini burasini yapicaz.
 Ve artik istedigin Cell hucrelerine de bu sinifi verince bu ozelligi kazandirmis oluyorsun.
 */
final class CardView: UIView{
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialSetup()
    }
    
    private func initialSetup(){
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero //aci yok
        layer.cornerRadius = 10
        layer.shadowOpacity = 0.5 //cok karanlik olmasin
        //tum kart gorunumlerin radiusunu veriyoruz burda
        cornerRadius = 10
        
    }
    
}
