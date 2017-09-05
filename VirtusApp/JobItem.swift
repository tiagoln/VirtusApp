//
//  JobItem.swift
//  VirtusApp
//
//  Created by Tiago Leite Da Nóbrega on 04/09/17.
//  Copyright © 2017 Virtus. All rights reserved.
//

import Foundation

struct JobItem {
    let title: String?
    let project: String?
    let skills: String?
    
    init(json: [String: Any]) {
        title = json["Title"] as? String ?? ""
        project = json["Project"] as? String ?? ""
        skills = json["Skills"] as? String ?? ""
    }
}
