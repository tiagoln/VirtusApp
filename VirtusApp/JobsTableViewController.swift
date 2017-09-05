//
//  JobsTableViewController.swift
//  VirtusApp
//
//  Created by Tiago Leite Da Nóbrega on 04/09/17.
//  Copyright © 2017 Virtus. All rights reserved.
//

import UIKit

class JobsTableViewController: UITableViewController {

    var allJobs:Array<JobItem>! = []
    var jobs: Array<JobItem>! = []
    var lastIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        AppManager.sharedInstance.getJobs {
            self.allJobs = AppManager.sharedInstance.JobCollection
            self.jobs = []
            for i in 0 ..< 4 {
                self.jobs.append(self.allJobs[i])
            }
            self.lastIndex = self.jobs.count - 1
            self.tableView.reloadData()
            self.refreshControl?.endRefreshing()
        }
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
        return jobs.count
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == lastIndex && jobs.count < allJobs.count {
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
            jobs.append(contentsOf: allJobs[lastIndex + 1...lastIndex + 4])
            lastIndex = jobs.count - 1
            tableView.reloadData()
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "jobCell", for: indexPath) as! JobTableViewCell
        let jobItem = jobs[indexPath.row]
        
        cell.jobTitle.text = jobItem.title
        cell.jobProject.text = jobItem.project
        cell.jobSkills.text = jobItem.skills
        
        return cell
    }



    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
