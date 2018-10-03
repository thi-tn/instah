//
//  HomeFeedTableViewController.swift
//  instah
//
//  Created by student on 10/2/18.
//  Copyright © 2018 hu. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class HomeFeedTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet var tableView: UITableView!
    
    var posts:[Post]=[]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if posts != nil {
            print(posts.count)
            return posts.count
        } else {
            return 0
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeFeedCell", for: indexPath) as! HomeFeedCell
        cell.post = posts[indexPath.row]
        //cell.post = post
        return cell
    }
    
    
    @IBAction func onLogout(_ sender: Any) {
        PFUser.logOutInBackground { (error) in
            // PFUser.current() will now be nil
            NotificationCenter.default.post(name: NSNotification.Name("didLogout"), object: nil)
            if PFUser.current() == nil {
                print("logged out")
                
            } else {
                print(error?.localizedDescription)
            }
            
        }
    }
    
    @IBAction func cancelToHomeFeedViewController(_ segue: UIStoryboardSegue) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 300
        // Initialize a UIRefreshControl
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(HomeFeedTableViewController.didPulltoRefresh(_:)), for: UIControlEvents.valueChanged)
        tableView.insertSubview(refreshControl, at: 0)
        loadQueries()
        
    }
    
    func loadQueries() {
        // construct PFQuery
        let query = PFQuery(className: "Post")
        query.order(byDescending: "createdAt")
        query.includeKey("author")
        query.includeKey("createdAt")
        query.limit = 20
        
       query.findObjectsInBackground { (posts: [PFObject]?, error: Error?) in
            if let posts = posts {
                self.posts = posts as! [Post]
                print(self.posts)
                self.tableView.reloadData()
                self.tableView.refreshControl?.endRefreshing()
            } else {
                print(error?.localizedDescription)
            }
            
        }
    }
    
    @objc func didPulltoRefresh(_ refreshControl: UIRefreshControl) {
        loadQueries()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "detailSegue" else {return}
        let cell = sender as! UITableViewCell
        if let indexPath = tableView.indexPath(for: cell) {
            let post = posts[indexPath.row]
            let PostDetailViewController = segue.destination as! PostDetailViewController
            PostDetailViewController.post = post
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    //    func numberOfSections(in tableView: UITableView) -> Int {
    //        // #warning Incomplete implementation, return the number of sections
    //        return 0
    //    }


}
