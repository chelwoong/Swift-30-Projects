//
//  MapTabBarController.swift
//  FindMyLocation
//
//  Created by woong on 17/05/2019.
//  Copyright © 2019 woong. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let locationVC = LocationViewController()
        locationVC.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
        
        let mapVC = MapViewController()
        mapVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        
        let tabBarList = [locationVC, mapVC]
        
        viewControllers = tabBarList

        // Do any additional setup after loading the view.
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
