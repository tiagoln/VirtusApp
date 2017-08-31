//
//  ShowCase.swift
//  VirtusApp
//
//  Created by Tiago Leite Da Nóbrega on 14/07/17.
//  Copyright © 2017 Virtus. All rights reserved.
//

import Foundation

struct ShowCaseItem {
    let title: String?
    let description: String?
    let imageURL: String?
    
    init(json: [String: Any]) {
        title = json["Title"] as? String ?? ""
        description = json["Description"] as? String ?? ""
        imageURL = json["ImageURL"] as? String ?? ""
    }
}
