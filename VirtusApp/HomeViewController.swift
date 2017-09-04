//
//  HomeViewController.swift
//  VirtusApp
//
//  Created by Tiago Leite Da Nóbrega on 12/07/17.
//  Copyright © 2017 Virtus. All rights reserved.
//

import UIKit

class HomeViewController: UIPageViewController {
    
    var timer: Timer?
    private(set) var orderedViewControllers: [UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for showcase in AppManager.sharedInstance.ShowCaseCollection {
            orderedViewControllers.append(newColoredViewController(showcase))
        }
        
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController],
                                    direction: .forward,
                                    animated: true,
                                    completion: nil)
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(HomeViewController.suspendTimer), name:NSNotification.Name.UIApplicationWillResignActive, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(HomeViewController.beginTimer), name:NSNotification.Name.UIApplicationDidBecomeActive, object: nil)
        
        dataSource = self as UIPageViewControllerDataSource
    }
    
    func suspendTimer() {
        timer?.invalidate()
    }
    
    func beginTimer() {
        if timer != nil && timer!.isValid { return }
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(HomeViewController.moveToNextPage), userInfo: nil, repeats: true)
        
    }
    
    func resetTimer() {
        suspendTimer()
        beginTimer()
    }
    
    func moveToNextPage() {
        guard let nextView = nextViewController()
            else
        {
            return
        }
        
        setViewControllers([nextView],
                           direction: .forward,
                           animated: true,
                           completion: nil)
    }
    
    func nextViewController() -> UIViewController? {
        if orderedViewControllers.count == 0 {
            return nil
        }
        
        let currentIndex = orderedViewControllers.index(of: self.viewControllers!.first!)!
        var nextIndex = currentIndex + 1
        if nextIndex == orderedViewControllers.count {
            nextIndex = 0
        }
        
        return orderedViewControllers[nextIndex]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func newColoredViewController(_ showcase: ShowCaseItem) -> UIViewController {
        let controller = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "DescViewController") as! DescriptionViewController
        
        controller.showCaseItem = showcase
        return controller
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension HomeViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        resetTimer()
        
        let previousIndex = currentIndex - 1
        
        // Loop back
        guard previousIndex >= 0 else {
            return orderedViewControllers.last
        }
        
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        
        return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        resetTimer()
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = orderedViewControllers.count
        
        // User is on the last view controller and swiped right to loop to
        // the first view controller.
        guard orderedViewControllersCount != nextIndex else {
            return orderedViewControllers.first
        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        
        return orderedViewControllers[nextIndex]
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return orderedViewControllers.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        guard let firstViewController = viewControllers?.first,
            let firstViewControllerIndex = orderedViewControllers.index(of: firstViewController) else {
                return 0
        }
        
        return firstViewControllerIndex
    }
    
}
