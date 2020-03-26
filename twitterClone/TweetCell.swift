//
//  TableViewCell.swift
//  twitterClone
//
//  Created by 이진하 on 2020/03/25.
//  Copyright © 2020 이진하. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {

    @IBOutlet weak var profile: UILabel!
    @IBOutlet weak var Id: UILabel!
    @IBOutlet weak var content: UILabel!
    @IBOutlet weak var mention: UIButton!
    @IBOutlet weak var retweet: UIButton!
    @IBOutlet weak var like: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
