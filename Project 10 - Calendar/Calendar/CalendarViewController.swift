//
//  ViewController.swift
//  Calendar
//
//  Created by woong on 13/06/2019.
//  Copyright © 2019 woong. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController {
    
    var cellId = "cellId"
    enum DayOfWeek {
        case monday
        case thuesday
        case wednesday
        case thursday
        case friday
        case saturday
        case sunday
    }
    
    var dayCounts = [31, 28, 31 ]
    
    let calendarCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect.init(), collectionViewLayout: layout)
        
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(calendarCollectionView)
        
        calendarCollectionView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor)
        calendarCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        calendarCollectionView.delegate = self
        calendarCollectionView.dataSource = self
        
    }


}

extension CalendarViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        cell.backgroundColor = UIColor.blue
        
        return cell
    }
}

extension CalendarViewController: UICollectionViewDelegate {
    
}
