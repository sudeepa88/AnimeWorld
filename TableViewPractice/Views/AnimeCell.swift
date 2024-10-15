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
        
    }
    
    override func layoutSubviews() {
            super.layoutSubviews()

            
            imgView.layer.cornerRadius = 10
        }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    
    func configureCell(imageName: String, titleAnime: String) {
        self.imageName = imageName
        self.titleAnime = titleAnime
        animeLabel.text = titleAnime
        updateFavButtonState()
    }
    
    
    private func updateFavButtonState() {
        let defaults = UserDefaults.standard
        let favoriteAnimes = defaults.array(forKey: "favoriteAnimes") as? [[String: String]] ?? []
        
        if favoriteAnimes.contains(where: { $0["titleAnime"] == self.titleAnime }) {
            favImage.setBackgroundImage(UIImage(systemName: "heart.fill"), for: .normal)
        } else {
            favImage.setBackgroundImage(UIImage(systemName: "heart"), for: .normal)
        }
    }
    
    
    @IBAction func tapOnFav(_ sender: Any) {
        let defaults = UserDefaults.standard
        
        
        if favImage.backgroundImage(for: .normal) == UIImage(systemName: "heart") {
            favImage.setBackgroundImage(UIImage(systemName: "heart.fill"), for: .normal)
           
            var favoriteAnimes = defaults.array(forKey: "favoriteAnimes") as? [[String: String]] ?? []
           
            let favoriteAnime: [String: String] = ["imageName": imageName, "titleAnime": titleAnime]
            favoriteAnimes.append(favoriteAnime)
            
          
            defaults.set(favoriteAnimes, forKey: "favoriteAnimes")
            defaults.synchronize()
            
        } else {
            favImage.setBackgroundImage(UIImage(systemName: "heart"), for: .normal)
            
            
            var favoriteAnimes = defaults.array(forKey: "favoriteAnimes") as? [[String: String]] ?? []
            
            
            if let index = favoriteAnimes.firstIndex(where: { $0["imageName"] == imageName && $0["titleAnime"] == titleAnime }) {
                favoriteAnimes.remove(at: index)
            }
            
            
            defaults.set(favoriteAnimes, forKey: "favoriteAnimes")
            defaults.synchronize()
        }
        
        print("Favorites updated with image: \(imageName) and title: \(titleAnime)")
    }
    
}
