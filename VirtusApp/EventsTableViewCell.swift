//
//  EventsTableViewCell.swift
//  VirtusApp
//
//  Created by Tiago Leite Da Nóbrega on 04/09/17.
//  Copyright © 2017 Virtus. All rights reserved.
//

import UIKit

class EventsTableViewCell: UITableViewCell {

    @IBOutlet weak var eventView: UIView!
    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var eventTitle: UILabel!
    @IBOutlet weak var eventDescription: UILabel!
    @IBOutlet weak var eventDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        eventView.layer.cornerRadius = 2
        eventView.layer.masksToBounds = false;
        eventView.layer.shadowOffset = CGSize(width: 1.5, height: 1)
        eventView.layer.shadowRadius = 2;
        eventView.layer.shadowOpacity = 0.3;
        
        eventTitle.adjustsFontSizeToFitWidth = false;
        eventTitle.lineBreakMode = .byTruncatingTail;
        eventDescription.adjustsFontSizeToFitWidth = false;
        eventDescription.lineBreakMode = .byTruncatingTail;
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }


}
