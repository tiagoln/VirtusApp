//
//  NewsItem.swift
//  VirtusApp
//
//  Created by Tiago Leite Da Nóbrega on 31/08/17.
//  Copyright © 2017 Virtus. All rights reserved.
//

import Foundation

struct EventItem {
    let title: String?
    let description: String?
    let imageURL: String?
    let date: Date?
    
    init(json: [String: Any]) {
        title = json["Title"] as? String ?? ""
        description = json["Description"] as? String ?? ""
        imageURL = json["ImageURL"] as? String ?? ""
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm" //Your date format
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT-3:00") //Current time zone
        date = dateFormatter.date(from: json["Date"] as? String ?? "") //according to date format your date string
    }
}
