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
    
    
    // MARK: - Properties and Variables
    
    var cellId = "cellId"
    var numOfDaysInMonth = [31,28,31,30,31,30,31,31,30,31,30,31]
    var currentMonthIndex = 0
    var currentYear = 0
    var presentMonthIndex = 0
    var presentYear = 0
    var todaysDate = 0
    var firstWeekDayOfMonth = 0   //(Sunday-Saturday 1-7)
    var daysCount = 0
    var dateRowCount = 5
    
    
    // MARK: - LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initializeView()
    }
    
    // MARK: - functions
    
    func initializeView() {
        currentMonthIndex = Calendar.current.component(.month, from: Date())
        currentYear = Calendar.current.component(.year, from: Date())
        todaysDate = Calendar.current.component(.day, from: Date())
        firstWeekDayOfMonth = getFirstWeekDay()
        
        //for leap years, make february month of 29 days
        if currentMonthIndex == 2 && currentYear % 4 == 0 {
            numOfDaysInMonth[currentMonthIndex-1] = 29
        }
        
        firstWeekDayOfMonth = getFirstWeekDay()
        
        daysCount = firstWeekDayOfMonth + numOfDaysInMonth[currentMonthIndex-1] - 1
        daysCount > 35 ? (dateRowCount = 6) : (dateRowCount = 5)
        
        setupViews()
        
        calendarCollectionView.register(DateCVCell.self, forCellWithReuseIdentifier: cellId)
        calendarCollectionView.delegate = self
        calendarCollectionView.dataSource = self

    }
    
    func setupViews() {
        
        self.addSubview(monthView)
        monthView.anchor(top: self.safeAreaLayoutGuide.topAnchor, leading: self.safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: .init(), size: CGSize(width: 0, height: 50))
        monthView.delegate = self
        
        self.addSubview(weekdaysView)
        weekdaysView.anchor(top: monthView.bottomAnchor, leading: safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: safeAreaLayoutGuide.trailingAnchor, padding: .init(), size: CGSize(width: 0, height: 50))
        
        self.addSubview(calendarCollectionView)
        calendarCollectionView.backgroundColor = UIColor.white
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
    
    // MARK: - Views
    
    let monthView: MonthView = {
        let view = MonthView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    let weekdaysView: WeekdaysView = {
        let view = WeekdaysView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let calendarCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRect.init(), collectionViewLayout: layout)
        
        return collectionView
    }()
}

extension CalendarView: MonthViewDelegate {
    func didChangeMonth(monthIndex: Int, year: Int) {
        currentMonthIndex = monthIndex + 1
        currentYear = year
        
        //for leap years, make february month of 29 days
        if monthIndex == 1 {
            if currentYear % 4 == 0 {
                numOfDaysInMonth[monthIndex] = 29
            } else {
                numOfDaysInMonth[monthIndex] = 28
            }
        }
        
        firstWeekDayOfMonth = getFirstWeekDay()
        daysCount = firstWeekDayOfMonth + numOfDaysInMonth[currentMonthIndex-1] - 1
        daysCount > 35 ? (dateRowCount = 6) : (dateRowCount = 5)
        
        calendarCollectionView.reloadData()
        
        
        monthView.btnLeft.isEnabled = !(currentMonthIndex == presentMonthIndex && currentYear == presentYear)
    }
}

extension CalendarView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7 * dateRowCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? DateCVCell else { return UICollectionViewCell() }
        
        let presentDay = indexPath.item - firstWeekDayOfMonth + 2
        if presentDay <= 0 {
            cell.dateLabel.text = String(numOfDaysInMonth[currentMonthIndex-1] + presentDay)
            cell.dateLabel.textColor = .gray
        } else if presentDay > numOfDaysInMonth[currentMonthIndex-1] {
            cell.dateLabel.text = String(presentDay - numOfDaysInMonth[currentMonthIndex-1])
            cell.dateLabel.textColor = .gray
        } else {
            cell.dateLabel.text = String(presentDay)
            cell.dateLabel.textColor = .black
        }

        
        return cell
    }
    
    
}

extension CalendarView: UICollectionViewDelegate {
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let cell = collectionView.cellForItem(at: indexPath)
//
//        cell?.backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
//        guard let lbl = cell?.subviews[1] as? UILabel else {fatalError()}
//        lbl.textColor = .white
//    }
//
//    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
//        let cell = collectionView.cellForItem(at: indexPath)
//
//        cell?.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//        guard let lbl = cell?.subviews[1] as? UILabel else {fatalError()}
//        lbl.textColor = .black
//    }
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
