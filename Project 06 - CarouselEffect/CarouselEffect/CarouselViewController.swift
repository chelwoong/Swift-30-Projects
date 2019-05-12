//
//  ViewController.swift
//  CarouselEffect
//
//  Created by woong on 11/05/2019.
//  Copyright © 2019 woong. All rights reserved.
//

import UIKit

class CarouselViewController: UIViewController {
    
    var cellId = "cellId"
    var cardTexts = ["Woongs", "iOS", "Success", "3S", ":D"]
    let carouselCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 20
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
        let collectionView = UICollectionView(frame: .init(x: 0, y: 0, width: 100, height: 100), collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor.clear
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupGradient(view)
        setupCarouselCollectionView()
    }

    func setupCarouselCollectionView() {
        carouselCollectionView.register(CarouselCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        carouselCollectionView.dataSource = self
        carouselCollectionView.delegate = self
        
        NSLayoutConstraint.activate([
            carouselCollectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            carouselCollectionView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1.2/1.0, constant: -40),
            
            carouselCollectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 0),
            carouselCollectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: 0),
            
            ])
    }
    
    func setupShadow(_ view: UIView) {
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 5
        view.layer.shadowPath = UIBezierPath(rect: view.bounds).cgPath
    }
    
    func setupGradient(_ view: UIView) {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [
            UIColor(hexString: "#ff9a9e").cgColor,
            UIColor(hexString: "#fad0c4").cgColor,
        ]
        
        view.layer.addSublayer(gradient)
        view.addSubview(carouselCollectionView)
        view.backgroundColor = UIColor.white
    }

}


extension CarouselViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let defaultCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        guard let cell: CarouselCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? CarouselCollectionViewCell else {
            return defaultCell
        }
        
        setupShadow(cell)
        cell.cellTextLabel.text = cardTexts[indexPath.item]
        
        return cell
    }
}

extension CarouselViewController: UICollectionViewDelegate {
    
}

extension CarouselViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width-80, height: carouselCollectionView.frame.height)
    }
}

extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}
