//
//  AppManager.swift
//  VirtusApp
//
//  Created by Tiago Leite Da Nóbrega on 14/07/17.
//  Copyright © 2017 Virtus. All rights reserved.
//

import Foundation

class AppManager {
    
    private init() { }
    static let sharedInstance = AppManager()
    
    var ShowCaseCollection: [ShowCaseItem] = []
    var EventCollection: [EventItem] = []
    var JobCollection: [JobItem] = []
    let showCaseSource = "https://raw.githubusercontent.com/tiagoln/VirtusApp/master/ShowCase.json"
    let eventsSource = "https://raw.githubusercontent.com/tiagoln/VirtusApp/master/News.json"
    let jobsSource = "https://raw.githubusercontent.com/tiagoln/VirtusApp/master/Jobs.json"
    
    func getShowcases(_ callback: @escaping () -> Swift.Void) {
        URLSession.shared.dataTask(with:URL(string: showCaseSource)!, completionHandler: {(data, response, error) in
            guard let data = data, error == nil else { return }
            
            do {
                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:AnyObject]
                    else {
                        return
                    }
                let showCaseList = json["ShowCases"] as! NSArray
                
                for showCase in showCaseList {
                    self.ShowCaseCollection.append(ShowCaseItem(json: showCase as! [String: Any]))
                }

                DispatchQueue.main.async() {
                    callback();
                }
            } catch let error as NSError {
                print(error)
            }
        }).resume()
    }
    
    func getEvents(_ callback: @escaping () -> Swift.Void) {
        URLSession.shared.dataTask(with:URL(string: eventsSource)!, completionHandler: {(data, response, error) in
            guard let data = data, error == nil else { return }
            
            do {
                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:AnyObject]
                    else {
                        return
                }
                let showCaseList = json["Events"] as! NSArray
                
                self.EventCollection = []
                for showCase in showCaseList {
                    self.EventCollection.append(EventItem(json: showCase as! [String: Any]))
                }
                
                DispatchQueue.main.async() {
                    callback();
                }
            } catch let error as NSError {
                print(error)
                DispatchQueue.main.async() {
                    callback();
                }
            }
        }).resume()
    }
    
    func getJobs(_ callback: @escaping () -> Swift.Void) {
        URLSession.shared.dataTask(with:URL(string: jobsSource)!, completionHandler: {(data, response, error) in
            guard let data = data, error == nil else { return }
            
            do {
                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:AnyObject]
                    else {
                        return
                }
                let showCaseList = json["Jobs"] as! NSArray
                
                self.JobCollection = []
                for showCase in showCaseList {
                    self.JobCollection.append(JobItem(json: showCase as! [String: Any]))
                }
                
                DispatchQueue.main.async() {
                    callback();
                }
            } catch let error as NSError {
                print(error)
                DispatchQueue.main.async() {
                    callback();
                }
            }
        }).resume()
    }

}
