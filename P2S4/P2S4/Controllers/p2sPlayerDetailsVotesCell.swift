//
//  p2sPlayerDetailsVotesCell.swift
//  P2S4
//
//  Created by Johnson Liu on 1/19/16.
//  Copyright © 2016 HomeOffice. All rights reserved.
//

import UIKit

class p2sPlayerDetailsVotesCell: UITableViewCell {
    
    @IBOutlet weak var skillNameLabel: UILabel!
    @IBOutlet weak var star1ImageView: UIImageView!
    @IBOutlet weak var star2ImageView: UIImageView!
    @IBOutlet weak var star3ImageView: UIImageView!
    @IBOutlet weak var star4ImageView: UIImageView!
    @IBOutlet weak var star5ImageView: UIImageView!
    @IBOutlet weak var star6ImageView: UIImageView!
    @IBOutlet weak var rateValueLabel: UILabel!
    
    //MARK: - init
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
