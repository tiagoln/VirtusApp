
//
//  ViewController.swift
//  VirtusApp
//
//  Created by Tiago Leite Da Nóbrega on 01/09/17.
//  Copyright © 2017 Virtus. All rights reserved.
//

import UIKit

class TabViewController: UITabBarController, UITabBarControllerDelegate {

    var previousIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        delegate = self as UITabBarControllerDelegate
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

        if let vcNav = viewController as? UINavigationController {
            for vc in vcNav.viewControllers {
                if let eventsView = vc as? EventsViewController {
                    if(eventsView.isVisible && previousIndex == selectedIndex){
                        eventsView.scrollTop()
                    }
                }
                if let jobsView = vc as? JobsTableViewController {
                    if(jobsView.isVisible && previousIndex == selectedIndex){
                        jobsView.scrollTop()
                    }
                }
            }
        }
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        guard self.viewControllers != nil else {
            return
        }
        
        previousIndex = selectedIndex
    }

    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//         print("Navegou")
//    }
}
