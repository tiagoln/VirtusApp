//
//  DescriptionViewController.swift
//  VirtusApp
//
//  Created by Tiago Leite Da Nóbrega on 12/07/17.
//  Copyright © 2017 Virtus. All rights reserved.
//

import UIKit
import SDWebImage

class DescriptionViewController: UIViewController {
    var showCaseItem: ShowCaseItem?

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var showcaseText: UITextView!
    @IBOutlet weak var showcaseTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if(showCaseItem != nil && showCaseItem?.imageURL != nil) {
            let imageURL = URL(string: (showCaseItem?.imageURL)!)
            imageView.sd_setImage(with: imageURL, placeholderImage: UIImage(named: "second"))
            showcaseText.text = showCaseItem?.description
            showcaseTitle.text = showCaseItem?.title
        }
        
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
