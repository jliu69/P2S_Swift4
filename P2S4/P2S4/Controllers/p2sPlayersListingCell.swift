//
//  p2sPlayersListingCell.swift
//  P2S4
//
//  Created by Johnson Liu on 1/18/16.
//  Copyright © 2016 HomeOffice. All rights reserved.
//

import UIKit

class p2sPlayersListingCell: UITableViewCell {
    
    @IBOutlet weak var bgLabel: UILabel!
    @IBOutlet weak var votesRatingsLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cityStateLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    
    //MARK: - init
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func changeBgColor(bgColor: UIColor) {
        self.bgLabel.backgroundColor = bgColor
    }
    
}
