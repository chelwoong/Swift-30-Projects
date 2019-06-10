//
//  ViewController.swift
//  ExpandingCell
//
//  Created by woong on 30/05/2019.
//  Copyright © 2019 woong. All rights reserved.
//

import UIKit

class ExpandingViewController: UICollectionViewController {
    
    let inspirations = Inspiration.allInspirations()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
        collectionView.backgroundColor = UIColor.clear
        collectionView.decelerationRate = .fast
        
        if let patternImage = UIImage(named: "Pattern") {
            view.backgroundColor = UIColor(patternImage: patternImage)
        }
        collectionView.register(InspirationCell.self, forCellWithReuseIdentifier: InspirationCell.reuseIdentifier)
        
    }
    
}

extension ExpandingViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return inspirations.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: InspirationCell = collectionView.dequeueReusableCell(withReuseIdentifier: InspirationCell.reuseIdentifier, for: indexPath) as? InspirationCell else { return UICollectionViewCell() }
        
        cell.inspiration = inspirations[indexPath.item]
        
        return cell
    }
    
    
}
