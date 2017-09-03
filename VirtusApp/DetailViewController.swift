//
//  DetailViewController.swift
//  VirtusApp
//
//  Created by Tiago Leite Da Nóbrega on 02/09/17.
//  Copyright © 2017 Virtus. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var newsItem: NewsItem?
    var index: Int?
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var newsDate: UILabel!
    @IBOutlet weak var newsPlace: UILabel!
    @IBOutlet weak var contentNews: UITextView!
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var dataPanel: UIView!
    @IBOutlet weak var line: UIView!
    @IBOutlet weak var newsTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        newsDate.text = formatter.string(from: (newsItem?.date!)!)
        contentNews.text = newsItem?.description
        newsTitle.text = newsItem?.title
        
        dataPanel.layer.cornerRadius = 2
        dataPanel.layer.masksToBounds = false;
        dataPanel.layer.shadowOffset = CGSize(width: 1.5, height: 1)
        dataPanel.layer.shadowRadius = 2;
        dataPanel.layer.shadowOpacity = 0.3;
        
        line.layer.cornerRadius = 2
        line.layer.masksToBounds = false;
        line.layer.shadowOffset = CGSize(width: 0, height: 3)
        line.layer.shadowOpacity = 0.15;
//        line.roundCorners([.topLeft, .topRight], radius: 2)
        
        newsImage.sd_setImage(with: URL(string: "http://lorempixel.com/500/500/business/\(index ?? 0)"), placeholderImage: UIImage(named: "virtus"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UIView {
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
}
