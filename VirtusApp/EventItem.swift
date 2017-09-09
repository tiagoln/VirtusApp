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
    let place: String?
    
    init(json: [String: Any]) {
        title = json["Title"] as? String ?? "Sem título"
        description = json["Description"] as? String ?? "Não há conteúdo"
        imageURL = json["ImageURL"] as? String ?? ""
        place = json["Place"] as? String ?? "Local não informado"
        date = Formatter.iso8601.date(from: json["Date"] as? String ?? "")
    }
}
