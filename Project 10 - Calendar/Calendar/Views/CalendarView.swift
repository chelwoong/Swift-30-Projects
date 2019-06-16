//
//  CalendarView.swift
//  Calendar
//
//  Created by woong on 14/06/2019.
//  Copyright © 2019 woong. All rights reserved.
//

import UIKit

class CalendarView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var cellId = "cellId"
    
    var numberOfDaysInMonth = [31,28,31,30,31,30,31,31,30,31,30,31]
    var currentMonthIndex = 0
    var currentYear = 0
    var presentMonthIndex = 0
    var presentYear = 0
    var todaysDate = 0
    var firstWeekDayOfMonth = 0   //(Sunday-Saturday 1-7)
    var daysCount = 0
    var dateRowCount = 5
    
    let calendarCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect.init(), collectionViewLayout: layout)
        
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        currentMonthIndex = Calendar.current.component(.month, from: Date())
        currentYear = Calendar.current.component(.year, from: Date())
        todaysDate = Calendar.current.component(.day, from: Date())
        
        firstWeekDayOfMonth = getFirstWeekDay()

        //for leap years, make february month of 29 days
        if currentMonthIndex == 2 && currentYear % 4 == 0 {
            numberOfDaysInMonth[currentMonthIndex-1] = 29
        }
        
        daysCount = firstWeekDayOfMonth + numberOfDaysInMonth[currentMonthIndex-1] - 1
        daysCount > 35 ? (dateRowCount = 6) : (dateRowCount = 5)
        
        let weekdaysView = WeekdaysView()
        self.addSubview(weekdaysView)
        weekdaysView.anchor(top: self.safeAreaLayoutGuide.topAnchor, leading: safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: safeAreaLayoutGuide.trailingAnchor, padding: .init(), size: CGSize(width: 0, height: 50))
        weekdaysView.backgroundColor = UIColor.red
        
        self.addSubview(calendarCollectionView)
        calendarCollectionView.backgroundColor = UIColor.white
        calendarCollectionView.register(DateCVCell.self, forCellWithReuseIdentifier: cellId)
        calendarCollectionView.delegate = self
        calendarCollectionView.dataSource = self
        calendarCollectionView.anchor(top: weekdaysView.bottomAnchor, leading: safeAreaLayoutGuide.leadingAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, trailing: safeAreaLayoutGuide.trailingAnchor)
        
        
        
        
        
        
    }
    
    func getFirstWeekDay() -> Int {
        guard let day = ("\(currentYear)-\(currentMonthIndex)-01".date?.firstDayOfTheMonth.weekday) else {
            fatalError()
        }

        return day
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CalendarView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7 * dateRowCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? DateCVCell else { return UICollectionViewCell() }
        
        let day = indexPath.item + 1
        let presentDay = day - firstWeekDayOfMonth + 1
        
        if day < firstWeekDayOfMonth || presentDay >= numberOfDaysInMonth[currentMonthIndex] {
            cell.isHidden = true
        }
        
        cell.dateLabel.text = String(presentDay)
        cell.backgroundColor = UIColor.orange
        return cell
    }
    
    
}

extension CalendarView: UICollectionViewDelegate {

}

extension CalendarView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = calendarCollectionView.frame.width/7
        let height: CGFloat = calendarCollectionView.frame.height / CGFloat(dateRowCount)
        return CGSize(width: width, height: height)
    }
}
