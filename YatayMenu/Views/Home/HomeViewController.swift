//
//  HomeViewController.swift
//  YatayMenu
//
//  Created by Ahmet Karamanoğlu on 19.02.2024.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    @IBOutlet weak var popularCollectionView: UICollectionView!
    //data sourcemiz burasi.
    var categories: [DishCategory] = [
        .init(id: "id1", name: "Africa Dish", image: "https://picsum.photos/100/200"),
        .init(id: "id2", name: "Africa Dish 2", image: "https://picsum.photos/100/200"),
        .init(id: "id3", name: "Africa Dish 3", image: "https://picsum.photos/100/200"),
        .init(id: "id4", name: "Africa Dish 4", image: "https://picsum.photos/100/200"),
        .init(id: "id5", name: "Africa Dish 5", image: "https://picsum.photos/100/200"),
        .init(id: "id6", name: "Africa Dish 6", image: "https://picsum.photos/100/200"),
    ]
    var populars: [Dish] = [
        .init(id: "id1", name: "Pizza", description: "This is the best I've ever tasted", image: "https://picsum.photos/100/200", calories: 532),
        .init(id: "id2", name: "Burger", description: "This is the best I've ever tasted", image: "https://picsum.photos/100/200", calories: 3212),
        .init(id: "id3", name: "Manti", description: "This is the best I've ever tasted", image: "https://picsum.photos/100/200", calories: 421),
    ]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        registerCells()
        
    }
    
    //XIB dosyasi olarak olusturdugumuz icin cell'i tanimlamamiz gerekiyor.
    private func registerCells() {
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        popularCollectionView.register(UINib(nibName: DishPortraitCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishPortraitCollectionViewCell.identifier)
    }


}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case categoryCollectionView:
            return categories.count
        case popularCollectionView:
            return populars.count
        default: return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case categoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
            cell.setup(category: categories[indexPath.row])
            return cell
        case popularCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishPortraitCollectionViewCell.identifier, for: indexPath) as! DishPortraitCollectionViewCell
            cell.setup(dish: populars[indexPath.row])
            return cell
        default: return UICollectionViewCell()
        }
       
    }
}
