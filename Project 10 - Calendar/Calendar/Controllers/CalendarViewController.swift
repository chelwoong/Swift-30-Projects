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
    
    var currentMonthIndex = 0
    var currentYear = 0
    var todaysDate = 0
    
    let calendarCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect.init(), collectionViewLayout: layout)
        
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white

        let weekdaysView = WeekdaysView()
        view.addSubview(weekdaysView)

        weekdaysView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor, size: CGSize(width: 0, height: 50))

        view.addSubview(calendarCollectionView)
        calendarCollectionView.anchor(top: weekdaysView.bottomAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.safeAreaLayoutGuide.trailingAnchor)
        calendarCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        calendarCollectionView.delegate = self
        calendarCollectionView.dataSource = self
        
        
        
        currentMonthIndex = Calendar.current.component(.month, from: Date())
        currentYear = Calendar.current.component(.year, from: Date())
        todaysDate = Calendar.current.component(.day, from: Date())
        
        print(currentMonthIndex, currentYear, todaysDate)
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
