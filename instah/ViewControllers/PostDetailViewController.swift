//
//  PostDetailViewController.swift
//  instah
//
//  Created by student on 10/2/18.
//  Copyright © 2018 hu. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class PostDetailViewController: UIViewController {

    @IBOutlet var postImage: PFImageView!
    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    var post: Post!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let post = post {
            descriptionLabel.text = post.caption
            postImage.file = post.media
            postImage.loadInBackground()
            usernameLabel.text = post.author.username
            timeLabel.text = post.time
        }
        // Do any additional setup after loading the view.
       
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
