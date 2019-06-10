//
//  ViewController.swift
//  ExpandingCell
//
//  Created by woong on 30/05/2019.
//  Copyright © 2019 woong. All rights reserved.
//

import UIKit

class ExpandingViewController: UICollectionViewController {
    
    let cellId = "cell"
    let inspirations = Inspiration.allInspirations()
    let colors = UIColor.palette()
    
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
        
        if let patternImage = UIImage(named: "Pattern") {
            view.backgroundColor = UIColor(patternImage: patternImage)
        }
        collectionView.register(InspirationCell.self, forCellWithReuseIdentifier: cellId)
    
    }
}

extension ExpandingViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return inspirations.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: InspirationCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? InspirationCell else { fatalError() }
        
//        cell.contentView.backgroundColor = colors[indexPath.item]
        
        cell.inspiration = inspirations[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    
}
