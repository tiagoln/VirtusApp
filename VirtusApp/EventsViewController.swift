//
//  EventsViewController.swift
//  VirtusApp
//
//  Created by Tiago Leite Da Nóbrega on 31/08/17.
//  Copyright © 2017 Virtus. All rights reserved.
//

import UIKit

class EventsViewController: UITableViewController {
    
    var events: [EventItem]! = []
    var willLoadMore = true;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        
        self.refreshControl?.addTarget(self, action: #selector(refresh(sender:)), for: .valueChanged)
        self.refreshControl?.beginRefreshingManually()
        self.refresh(sender: self)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func refresh(sender:AnyObject)
    {
        AppManager.sharedInstance.getEvents(from: 0, take: 4) { loadedEvents in
            guard loadedEvents != nil && (loadedEvents?.count)! > 0 else {
                self.refreshControl?.endRefreshing()
                self.willLoadMore = false
                return
            }
            
            self.willLoadMore = true
            self.events = []
            self.events.append(contentsOf: loadedEvents!)
            self.tableView.reloadData()
            self.refreshControl?.endRefreshing()
            
        }
    }
    
    func scrollTop() {
        self.tableView.setContentOffset(CGPoint.init(x: 0, y: -20), animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Hide the navigation bar on this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tableView.tableFooterView = nil
        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == events.count - 1 && willLoadMore {
            self.showBottomSpinner()
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
            AppManager.sharedInstance.getEvents(from: events.count, take: 4) { loadedEvents in
                guard loadedEvents != nil && (loadedEvents?.count)! > 0 else {
                    self.hideBottomSpinner()
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                    self.willLoadMore = false
                    return
                }
                
                self.events.append(contentsOf: loadedEvents!)
                self.tableView.reloadData()
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                self.hideBottomSpinner()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToDetail", sender: indexPath)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as! EventsTableViewCell
        let eventItem = events[indexPath.row]
        
        cell.eventTitle.text = eventItem.title
        cell.eventDescription.text = eventItem.description
        cell.eventDate.text = eventItem.date?.toString ?? "---"
        
        cell.eventImage?.sd_setImage(with: URL(string: "http://lorempixel.com/500/500/business/\(indexPath.row)"), placeholderImage: UIImage(named: "virtus"))
        
        return cell
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? DetailViewController {
            let indexPath = sender as! IndexPath
            vc.eventItem = events[indexPath.row]
            vc.index = indexPath.row
        }
    }
}

extension UITableViewController {
    func showBottomSpinner() {
        if self.tableView.tableFooterView == nil {
            let spinner = UIActivityIndicatorView(activityIndicatorStyle: .gray)
            spinner.startAnimating()
            spinner.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: tableView.bounds.width, height: CGFloat(44))
            self.tableView.tableFooterView = spinner
        } else {
            self.tableView.tableFooterView?.isHidden = false
        }
    }

    func hideBottomSpinner() {
        self.tableView.tableFooterView?.isHidden = true
    }
}

extension UIRefreshControl {
    func beginRefreshingManually() {
        if let scrollView = superview as? UIScrollView {
            scrollView.setContentOffset(CGPoint(x: 0, y: scrollView.contentOffset.y - frame.height), animated: true)
        }
        beginRefreshing()
    }
}
