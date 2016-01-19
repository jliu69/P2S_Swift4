//
//  p2sPlayerVotingCell.swift
//  P2S4
//
//  Created by Johnson Liu on 1/19/16.
//  Copyright © 2016 HomeOffice. All rights reserved.
//

import UIKit


@objc protocol p2sPlayerVotingCellDelegate {
    
    optional func didVoteWithValues(rowNumber: Int, starNumber: Int)
}


class p2sPlayerVotingCell: UITableViewCell {
    
    @IBOutlet weak var skillTitleLabel: UILabel!
    @IBOutlet weak var skillPointsLabel: UILabel!
    @IBOutlet weak var imageOneView: UIImageView!
    @IBOutlet weak var imageTwoView: UIImageView!
    @IBOutlet weak var imageThreeView: UIImageView!
    @IBOutlet weak var imageFourView: UIImageView!
    @IBOutlet weak var imageFiveView: UIImageView!
    
    let yellowStar: UIImage? = UIImage(named: "star_yellow.png")
    let blankStar: UIImage? = UIImage(named: "star_blank.png")
    
    var delegate: p2sPlayerVotingCellDelegate! = nil
    var rowNumber: Int? = 0
    
    
    //MARK: - init
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: - IB actions
    
    @IBAction func voteOneAction(sender: AnyObject) {
        self.chooseOneStar()
        delegate?.didVoteWithValues?(self.rowNumber!, starNumber: 1)
    }
    
    @IBAction func voteTwoAction(sender: AnyObject) {
        self.chooseTwoStar()
        delegate?.didVoteWithValues?(self.rowNumber!, starNumber: 2)
    }
    
    @IBAction func voteThreeAction(sender: AnyObject) {
        self.chooseThreeStar()
        delegate?.didVoteWithValues?(self.rowNumber!, starNumber: 3)
    }
    
    @IBAction func voteFourAction(sender: AnyObject) {
        self.chooseFourStar()
        delegate?.didVoteWithValues?(self.rowNumber!, starNumber: 4)
    }
    
    @IBAction func voteFiveAction(sender: AnyObject) {
        self.chooseFiveStar()
        delegate?.didVoteWithValues?(self.rowNumber!, starNumber: 5)
    }
    
    
    //MARK: - local method
    
    func chooseOneStar() {
        self.imageOneView.image = self.yellowStar
        self.imageTwoView.image = self.blankStar
        self.imageThreeView.image = self.blankStar
        self.imageFourView.image = self.blankStar
        self.imageFiveView.image = self.blankStar
    }
    
    func chooseTwoStar() {
        self.imageOneView.image = self.yellowStar
        self.imageTwoView.image = self.yellowStar
        self.imageThreeView.image = self.blankStar
        self.imageFourView.image = self.blankStar
        self.imageFiveView.image = self.blankStar
    }
    
    func chooseThreeStar() {
        self.imageOneView.image = self.yellowStar
        self.imageTwoView.image = self.yellowStar
        self.imageThreeView.image = self.yellowStar
        self.imageFourView.image = self.blankStar
        self.imageFiveView.image = self.blankStar
    }
    
    func chooseFourStar() {
        self.imageOneView.image = self.yellowStar
        self.imageTwoView.image = self.yellowStar
        self.imageThreeView.image = self.yellowStar
        self.imageFourView.image = self.yellowStar
        self.imageFiveView.image = self.blankStar
    }
    
    func chooseFiveStar() {
        self.imageOneView.image = self.yellowStar
        self.imageTwoView.image = self.yellowStar
        self.imageThreeView.image = self.yellowStar
        self.imageFourView.image = self.yellowStar
        self.imageFiveView.image = self.yellowStar
    }
    
    
    
    
}

