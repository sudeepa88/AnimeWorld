//
//  AnimeCell.swift
//  TableViewPractice
//
//  Created by Sudeepa Pal on 15/10/24.
//

import UIKit

class AnimeCell: UITableViewCell {
    
    @IBOutlet weak var favImage: UIButton!
    
    @IBOutlet weak var backgroundImg: UIView!{
        didSet{
            backgroundImg.layer.cornerRadius = 20
        }
    }
    
    @IBOutlet weak var imgView: UIImageView!
    {
        didSet {
            
            imgView.clipsToBounds = true
           // imgView.layer.cornerRadius = 10
        }
    }
    
    
    @IBOutlet weak var animeLabel: UILabel!
    
    var imageName = ""
    var titleAnime = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
            super.layoutSubviews()

            // Set the corner radius after the layout is complete
            imgView.layer.cornerRadius = 10
        }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func tapOnFav(_ sender: Any) {
        let defaults = UserDefaults.standard
        
        // Check if the favorite is already added or not
        if favImage.backgroundImage(for: .normal) == UIImage(systemName: "heart") {
            favImage.setBackgroundImage(UIImage(systemName: "heart.fill"), for: .normal)
            
            // Retrieve current favorites from UserDefaults
            var favoriteAnimes = defaults.array(forKey: "favoriteAnimes") as? [[String: String]] ?? []
            
            // Add the new favorite anime as a dictionary
            let favoriteAnime: [String: String] = ["imageName": imageName, "titleAnime": titleAnime]
            favoriteAnimes.append(favoriteAnime)
            
            // Save the updated array back to UserDefaults
            defaults.set(favoriteAnimes, forKey: "favoriteAnimes")
            defaults.synchronize()
            
        } else {
            favImage.setBackgroundImage(UIImage(systemName: "heart"), for: .normal)
            
            // Retrieve current favorites from UserDefaults
            var favoriteAnimes = defaults.array(forKey: "favoriteAnimes") as? [[String: String]] ?? []
            
            // Find and remove the anime from the favorites
            if let index = favoriteAnimes.firstIndex(where: { $0["imageName"] == imageName && $0["titleAnime"] == titleAnime }) {
                favoriteAnimes.remove(at: index)
            }
            
            // Save the updated array back to UserDefaults
            defaults.set(favoriteAnimes, forKey: "favoriteAnimes")
            defaults.synchronize()
        }
        
        print("Favorites updated with image: \(imageName) and title: \(titleAnime)")
    }
    
}
