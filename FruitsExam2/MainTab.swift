//
//  MainTab.swift
//  FruitsExam2
//
//  Created by apple on 29/06/21.
//

import UIKit

class MainTab: UITabBarController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        let banana = BananaVC(nibName: "BananaVC", bundle: nil)
        banana.tabBarItem.title = "Banana"
        banana.tabBarItem.image = UIImage(named: "banana-1")
        
        let apple = AppleVC(nibName: "AppleVC", bundle: nil)
        apple.tabBarItem.title = "Apple"
        apple.tabBarItem.image = UIImage(named: "apple-1")
        
        
        tabBar.barTintColor = .yellow
        viewControllers = [banana,apple]
    }
    


}
