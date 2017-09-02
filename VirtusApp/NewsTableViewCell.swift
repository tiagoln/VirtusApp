//
//  newsTableViewCell.swift
//  VirtusApp
//
//  Created by Tiago Leite Da Nóbrega on 02/09/17.
//  Copyright © 2017 Virtus. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {


    @IBOutlet weak var newsItemView: UIView!
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var newsContent: UILabel!
    @IBOutlet weak var newsDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        newsItemView.layer.cornerRadius = 2
        newsItemView.layer.masksToBounds = false;
        newsItemView.layer.shadowOffset = CGSize(width: 1, height: 1)
        newsItemView.layer.shadowRadius = 2;
        newsItemView.layer.shadowOpacity = 0.3;
        
        newsImage.contentMode = .scaleAspectFill
        newsImage.clipsToBounds = true
        titleLable.adjustsFontSizeToFitWidth = false;
        titleLable.lineBreakMode = .byTruncatingTail;
        newsContent.adjustsFontSizeToFitWidth = false;
        newsContent.lineBreakMode = .byTruncatingTail;        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
