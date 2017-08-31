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
    let showCaseURL = "https://raw.githubusercontent.com/tiagoln/VirtusApp/master/ShowCase.json"
    
    func getShowcases(_ callback: @escaping () -> Swift.Void) {
        URLSession.shared.dataTask(with:URL(string: showCaseURL)!, completionHandler: {(data, response, error) in
            guard let data = data, error == nil else { return }
            
            do {
                guard let json = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String:AnyObject]
                    else {
                        return
                    }
                let showCaseList = json["ShowCases"] as! NSArray
                
                for showCase in showCaseList {
                    let dict = showCase as! NSDictionary
                    let item = ShowCaseItem.init(title: dict["Title"] as? String,
                                                 description: dict["Description"] as? String,
                                                 imageURL: dict["ImageURL"] as? String)
                    
                    self.ShowCaseCollection.append(item)
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
