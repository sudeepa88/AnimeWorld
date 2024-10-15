//
//  FavouriteTVC.swift
//  TableViewPractice
//
//  Created by Sudeepa Pal on 16/10/24.
//

import UIKit

class FavouriteTVC: UITableViewCell {
    
    @IBOutlet weak var bgView: UIView!
    {
        didSet {
            bgView.layer.cornerRadius = 10
        }
    }
    
    @IBOutlet weak var imgView: UIImageView! {
        didSet {
            imgView.layer.cornerRadius = 10
            imgView.clipsToBounds = true
        }
    }
    
    
    @IBOutlet weak var titleOfFav: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
