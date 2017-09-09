//
//  DetailViewController.swift
//  VirtusApp
//
//  Created by Tiago Leite Da Nóbrega on 02/09/17.
//  Copyright © 2017 Virtus. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var eventItem: EventItem?
    var index: Int?
    
    @IBOutlet weak var eventTitle: UILabel!
    @IBOutlet weak var eventDescription: UITextView!
    @IBOutlet weak var eventDate: UILabel!
    @IBOutlet weak var headerLine: UIView!
    @IBOutlet weak var eventLocal: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        eventDate.text = eventItem?.date?.toString ?? "---"
        eventDescription.text = eventItem?.description
        eventTitle.text = eventItem?.title
        eventLocal.text = eventItem?.place
        
        headerLine.layer.masksToBounds = false;
        headerLine.layer.shadowOffset = CGSize(width: 0, height: 3)
        headerLine.layer.shadowOpacity = 0.30;
        
//        eventImage.sd_setImage(with: URL(string: "http://lorempixel.com/500/500/business/\(index ?? 0)"), placeholderImage: UIImage(named: "virtus"))
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
