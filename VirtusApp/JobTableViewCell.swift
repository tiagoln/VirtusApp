//
//  JobTableViewCell.swift
//  VirtusApp
//
//  Created by Tiago Leite Da Nóbrega on 04/09/17.
//  Copyright © 2017 Virtus. All rights reserved.
//

import UIKit

class JobTableViewCell: UITableViewCell {

    @IBOutlet weak var jobContainer: UIView!
    @IBOutlet weak var jobInfoContainer: UIView!
    @IBOutlet weak var jobTitle: UILabel!
    @IBOutlet weak var jobProject: UILabel!
    @IBOutlet weak var jobSkills: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        jobContainer.layer.cornerRadius = 2
        jobInfoContainer.layer.cornerRadius = 2
        jobContainer.layer.masksToBounds = false;
        jobContainer.layer.shadowOffset = CGSize(width: 1.5, height: 1)
        jobContainer.layer.shadowRadius = 2;
        jobContainer.layer.shadowOpacity = 0.3;
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
