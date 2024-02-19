//
//  OnboardingViewController.swift
//  YatayMenu
//
//  Created by Ahmet Karamanoğlu on 18.02.2024.
//

import UIKit

class OnboardingViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    //butonun ismi degisecegi icin outletini de tanimladik.
    
    @IBOutlet weak var nextBtn: UIButton!
    
    //didset - bu degerin ne zaman degistigini bilmek icin bu ozelligi kullandik.
    var currentPage = 0 {
        didSet{
            pageControl.currentPage = currentPage
            if currentPage == slides.count - 1 {
                nextBtn.setTitle("Get Started", for: .normal)
            }else{
                nextBtn.setTitle("Next", for: .normal)
            }
        }
    }
    var slides: [OnboardingSlide] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slides = [
            OnboardingSlide(title: "Delicious Dishes", description: "Experience a variety", image: UIImage(named: "slide1")!),
            OnboardingSlide(title: "World-Class Chefs", description: "Our dishes a variety", image: UIImage(named: "slide2")!),
            OnboardingSlide(title: "Instant World-Wide", description: "Your orders", image: UIImage(named: "slide3")!)
        ]
        //pageControl'de olmasi gereken bosluk sayisi resim sayimizla esit olmali.
        pageControl.numberOfPages = slides.count
        
        collectionView.delegate = self
        collectionView.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextBtnClicked(_ sender: UIButton) {
        if currentPage == slides.count - 1{
            let controller = storyboard?.instantiateViewController(identifier: "HomeNC") as! UINavigationController
            controller.modalPresentationStyle = .fullScreen //ekrani fulluyor yukarida bosluk yok
            controller.modalTransitionStyle = .flipHorizontal //gecis stilini ayarliyor.
            present(controller, animated: true, completion: nil)
        }else{
            currentPage += 1
            let indexPath = IndexPath(item: currentPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    

}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCollectionViewCell.identifier, for: indexPath) as! OnboardingCollectionViewCell
        //burada cell.slideTitleLbl.text = slides[0].title gibi degerler verip de dondurebilirdin. ama gordugun gibi tek bir setup fonksiyonu ile slide nesneni veriyorsun ve o direkt arka tarafta hallediyor. 
        cell.setup(slides[indexPath.row])
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
}
