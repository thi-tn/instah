//
//  HomeFeedTableViewController.swift
//  instah
//
//  Created by student on 9/23/18.
//  Copyright © 2018 hu. All rights reserved.
//

import UIKit
import Parse



class HomeFeedTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeFeedCell", for: indexPath) as! HomeFeedCell
        
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
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }


}
