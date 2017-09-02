
//
//  ViewController.swift
//  VirtusApp
//
//  Created by Tiago Leite Da Nóbrega on 01/09/17.
//  Copyright © 2017 Virtus. All rights reserved.
//

import UIKit

class TabViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        delegate = self as UITabBarControllerDelegate
        //tabBar.delegate = self as UITabBarController
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if let vc = viewController as? LocationViewController {
            guard vc.initialLocation != nil else {
                return
            }
            
            vc.centerMapOnLocation(location: vc.initialLocation!)
        }
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        guard self.viewControllers != nil else {
            return
        }
        
        
        if let vc = self.viewControllers![selectedIndex] as? LocationViewController {
            guard vc.initialLocation != nil else{
                return
            }
            
            vc.centerMapOnLocation(location: vc.initialLocation!)
        }
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//         print("Navegou")
//    }
}
