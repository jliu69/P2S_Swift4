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
    
    //MARK: - display data
    
    func displayVotesData(data: VotesDataObject) {
        //
        
        self.skillNameLabel.text = data.skillName!
        
        let votesValue: Float = (data.votesValue! as NSString).floatValue
        let totalVotes: Float = (data.totalVoting! as NSString).floatValue
        let ratingValue: Float = votesValue / totalVotes
        self.rateValueLabel.text = NSString(format: "%0.1f", ratingValue) as String
        
        let starValues: Double = round(Double(ratingValue))
        let stars: Int = Int(starValues)
        
        let yellowStar: UIImage = UIImage(named: "star_yellow.png")!
        let blankStar: UIImage = UIImage(named: "star_blank.png")!
        
        switch (stars) {
        case 1:
            star1ImageView.image = yellowStar
            star2ImageView.image = blankStar
            star3ImageView.image = blankStar
            star4ImageView.image = blankStar
            star5ImageView.image = blankStar
            break
        case 2:
            star1ImageView.image = yellowStar
            star2ImageView.image = yellowStar
            star3ImageView.image = blankStar
            star4ImageView.image = blankStar
            star5ImageView.image = blankStar
            break
        case 3:
            star1ImageView.image = yellowStar
            star2ImageView.image = yellowStar
            star3ImageView.image = yellowStar
            star4ImageView.image = blankStar
            star5ImageView.image = blankStar
            break
        case 4:
            star1ImageView.image = yellowStar
            star2ImageView.image = yellowStar
            star3ImageView.image = yellowStar
            star4ImageView.image = yellowStar
            star5ImageView.image = blankStar
            break
        case 5:
            star1ImageView.image = yellowStar
            star2ImageView.image = yellowStar
            star3ImageView.image = yellowStar
            star4ImageView.image = yellowStar
            star5ImageView.image = yellowStar
            break
        default:
            break
        }
    }
    
}
