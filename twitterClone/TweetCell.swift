//
//  TableViewCell.swift
//  twitterClone
//
//  Created by 이진하 on 2020/03/29.
//  Copyright © 2020 이진하. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {


    @IBOutlet weak var Id: UILabel!
    @IBOutlet weak var profile: UIImageView!
    @IBOutlet weak var content: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
