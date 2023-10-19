//
//  TabBarController.swift
//  MealAppHomework
//
//  Created by Macbook Air on 15.10.2023.
//

import UIKit

class TabBarController: UITabBarController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        let homeNavigationController = UINavigationController(rootViewController: HomeVC())
        
        homeNavigationController.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "house.fill")?.withTintColor(.orange, renderingMode: .alwaysOriginal), tag: 2)
        homeNavigationController.tabBarItem.standardAppearance?.backgroundColor = .orange
        
        
        
        
        let menuNavigationController = UINavigationController(rootViewController: MenuVC())
        
        menuNavigationController.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "square.grid.2x2.fill")?.withTintColor(.orange, renderingMode: .alwaysOriginal), tag: 0)
    
        let offersNavigationController = UINavigationController(rootViewController: OffersVC())
        
        offersNavigationController.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "bag.fill")?.withTintColor(.orange, renderingMode: .alwaysOriginal), tag: 1)
        
        let profileNavigationController = UINavigationController(rootViewController: OffersVC())
        
        profileNavigationController.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "person.fill")?.withTintColor(.orange, renderingMode: .alwaysOriginal), tag: 3)
        
        let moreNavigationController = UINavigationController(rootViewController: OffersVC())
        
        moreNavigationController.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "text.alignright")?.withTintColor(.orange, renderingMode: .alwaysOriginal), tag: 4)
        
        
        setViewControllers([menuNavigationController,offersNavigationController,homeNavigationController,profileNavigationController,moreNavigationController], animated: true)
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
