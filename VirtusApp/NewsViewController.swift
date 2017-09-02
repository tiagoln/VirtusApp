//
//  NewsViewController.swift
//  VirtusApp
//
//  Created by Tiago Leite Da Nóbrega on 31/08/17.
//  Copyright © 2017 Virtus. All rights reserved.
//

import UIKit

class NewsViewController: UITableViewController {

    var allNews:Array<NewsItem>! = []
    var news: Array<NewsItem>! = []
    var lastIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 50, right: 0)
        self.refreshControl?.addTarget(self, action: #selector(refresh(sender:)), for: .valueChanged)
        
        AppManager.sharedInstance.getNews {
            self.allNews = AppManager.sharedInstance.NewsCollection
            for i in 0 ..< 4 {
                self.news.append(self.allNews[i])
            }
            self.lastIndex = self.news.count - 1
            self.tableView.reloadData()
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func refresh(sender:AnyObject)
    {
        AppManager.sharedInstance.getNews {
            self.allNews = AppManager.sharedInstance.NewsCollection
            self.news = []
            for i in 0 ..< 4 {
                self.news.append(self.allNews[i])
            }
            self.tableView.reloadData()
            self.refreshControl?.endRefreshing()
        }
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        print(indexPath.row)
        print(lastIndex)
        if indexPath.row == lastIndex {
            news.append(contentsOf: allNews[lastIndex...lastIndex + 4])
            lastIndex += news.count - 1
            tableView.reloadData()
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
        return news.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsTableViewCell
        let newsItem = news[indexPath.row]
        
        cell.titleLable.text = newsItem.title
        cell.newsContent.text = newsItem.description
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        cell.newsDate.text = formatter.string(from: newsItem.date!)
        
        cell.newsImage?.sd_setImage(with: URL(string: "http://lorempixel.com/300/110/business/\(indexPath.row)"), placeholderImage: UIImage(named: "virtus"))
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        var car = listed[indexPath.row]
//        car.image = cell.imageView!.image
//        performSegue(withIdentifier: "selectCar", sender: indexPath.row)
    }
    
    @IBAction func unwindToMenu(segue: UIStoryboardSegue) {}
    
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
