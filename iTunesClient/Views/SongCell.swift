//
//  SongCell.swift
//  iTunesClient
//
//  Created by toby tang on 2017-12-13.
//  Copyright © 2017 Toby Tang. All rights reserved.
//

import UIKit

class SongCell: UITableViewCell {
    
    static let reuseIdentifier = "SongCell"

    @IBOutlet weak var songTitleLabel: UILabel!
    
    @IBOutlet weak var songRunTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
