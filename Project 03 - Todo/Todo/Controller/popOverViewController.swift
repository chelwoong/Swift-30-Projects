//
//  popOverViewController.swift
//  Todo
//
//  Created by woong on 02/05/2019.
//  Copyright © 2019 woong. All rights reserved.
//

import UIKit

class popOverViewController: UIViewController {
    
    var emojiList: [[String]] = []
    let sectionTitle: [String] = ["Emoticons", "Dingbats", "Transport and map symbols", "Enclosed Characters"]
    let cellId = "emojiCell"
    
    func fetchEmojis(){
        
        
        
        let emojiRanges = [
            0x1F601...0x1F64F,
            0x2702...0x27B0,
            0x1F680...0x1F6C0,
            0x1F170...0x1F251
        ]
        
        
        for range in emojiRanges {
            var array: [String] = []
            for i in range {
                if let unicodeScalar = UnicodeScalar(i){
                    array.append(String(describing: unicodeScalar))
                }
            }
            
            emojiList.append(array)
        }
        
    }


    override func viewDidLoad() {
        super.viewDidLoad()

         fetchEmojis()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: - extension popOverViewController

extension popOverViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return emojiList[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let defaultCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        
        guard let cell: emojiCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? emojiCollectionViewCell else {return defaultCell}
        
        cell.emojiImageView.image = emojiList[indexPath.section][indexPath.item].image()
        return cell
    }
}

extension popOverViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("emoji")
    }
}

// MARK: - extension String

extension String {
    func image() -> UIImage? {
        let size = CGSize(width: 100, height: 100)
        UIGraphicsBeginImageContextWithOptions(size, false, 0);
        UIColor.clear.set()
        
        let stringBounds = (self as NSString).size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 75)])
        let originX = (size.width - stringBounds.width)/2
        let originY = (size.height - stringBounds.height)/2
        print(stringBounds)
        let rect = CGRect(origin: CGPoint(x: originX, y: originY), size: size)
        UIRectFill(rect)
        
        (self as NSString).draw(in: rect, withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 75)])
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
