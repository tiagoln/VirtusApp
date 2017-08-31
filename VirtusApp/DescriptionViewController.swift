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

    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    var snap: UISnapBehavior!
    var previousTouchPoint: CGPoint!
    var viewDragging = false
    var viewPinned = false
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var showcaseText: UITextView!
    @IBOutlet weak var showcaseTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        animator = UIDynamicAnimator(referenceView: self.view)
//        gravity = UIGravityBehavior()
//        
//        animator.addBehavior(gravity)
//        gravity.magnitude = 4

        if(showCaseItem != nil && showCaseItem?.imageURL != nil) {
            let imageURL = URL(string: (showCaseItem?.imageURL)!)
            imageView.sd_setImage(with: imageURL, placeholderImage: UIImage(named: "second"))
            showcaseText.text = showCaseItem?.description
            showcaseTitle.text = showCaseItem?.title
        }
//         Do any additional setup after loading the view.
    }
    
    func addViewController (atOffset offset:CGFloat, dataForVC data: AnyObject?) -> UIView? {
        let frameForView = self.view.bounds.offsetBy(dx: 0, dy: self.view.bounds.size.height - offset)
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let stackElementVC = sb.instantiateViewController(withIdentifier: "StackElement") as! StackViewController
        
        if let view = stackElementVC.view {
            view.frame = frameForView
            view.layer.cornerRadius = 5
            view.layer.shadowOffset = CGSize(width: 2, height: 2)
            view.layer.shadowColor = UIColor.black.cgColor
            view.layer.shadowRadius = 3
            view.layer.shadowOpacity = 0.5
            
        }
        
        return nil
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
