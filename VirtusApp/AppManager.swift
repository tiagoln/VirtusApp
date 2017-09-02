//
//  AppManager.swift
//  VirtusApp
//
//  Created by Tiago Leite Da Nóbrega on 14/07/17.
//  Copyright © 2017 Virtus. All rights reserved.
//

import Foundation

class AppManager {
    
    static let sharedInstance = AppManager()
    
    var ShowCaseCollection: [ShowCaseItem] = []
    var NewsCollection: [NewsItem] = []
    let showCaseURL = "https://raw.githubusercontent.com/tiagoln/VirtusApp/master/ShowCase.json"
    let newsURL = "https://raw.githubusercontent.com/tiagoln/VirtusApp/master/News.json"
    
    func getShowcases(_ callback: @escaping () -> Swift.Void) {
        URLSession.shared.dataTask(with:URL(string: showCaseURL)!, completionHandler: {(data, response, error) in
            guard let data = data, error == nil else { return }
            
            do {
                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:AnyObject]
                    else {
                        return
                    }
                let showCaseList = json["ShowCases"] as! NSArray
                
                for showCase in showCaseList {
                    let dict = showCase as! [String: Any]
                    self.ShowCaseCollection.append(ShowCaseItem(json: dict))
                }

                DispatchQueue.main.async() {
                    callback();
                }
            } catch let error as NSError {
                print(error)
            }
        }).resume()
    }
    
    func getNews(_ callback: @escaping () -> Swift.Void) {
        URLSession.shared.dataTask(with:URL(string: newsURL)!, completionHandler: {(data, response, error) in
            guard let data = data, error == nil else { return }
            
            do {
                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:AnyObject]
                    else {
                        return
                }
                let showCaseList = json["News"] as! NSArray
                
                for showCase in showCaseList {
                    let dict = showCase as! [String: Any]
                    self.NewsCollection.append(NewsItem(json: dict))
                }
                
                DispatchQueue.main.async() {
                    callback();
                }
            } catch let error as NSError {
                print(error)
            }
        }).resume()
    }
}
