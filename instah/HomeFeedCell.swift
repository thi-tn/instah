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
    
    var post: PFObject! {
        didSet {
            self.descriptionLabel.text = post["caption"] as? String
            self.feedImageView.file = post["image"] as? PFFile
            self.feedImageView.loadInBackground()
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
