//
//  HomeFeedCell.swift
//  instah
//
//  Created by student on 9/23/18.
//  Copyright © 2018 hu. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class HomeFeedCell: UITableViewCell {

    @IBOutlet var feedImageView: PFImageView!
    @IBOutlet var descriptionLabel: UILabel!
    
    @IBOutlet var likeCountLabel: UILabel!
    @IBOutlet var usernameLabel: UILabel!
    var post: Post! {
        didSet {
            self.descriptionLabel.text = post.caption
            self.feedImageView.file = post.media
            self.feedImageView.loadInBackground()
            self.usernameLabel.text = post.author.username
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
