//
//  FavouritesVC.swift
//  TableViewPractice
//
//  Created by Sudeepa Pal on 16/10/24.
//

import UIKit

class FavouritesVC: UIViewController {

    @IBOutlet weak var tablevIewView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Favourite Animes"
        
        tablevIewView.register(UINib(nibName: "FavouriteTVC" , bundle: nil), forCellReuseIdentifier: "FavouriteCell")
        
        tablevIewView.delegate = self
        tablevIewView.dataSource = self

        
    }
    

}

extension FavouritesVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let defaults = UserDefaults.standard
        let favoriteAnimes = defaults.array(forKey: "favoriteAnimes") as? [[String: String]] ?? []
        return favoriteAnimes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavouriteCell", for: indexPath) as! FavouriteTVC
        let defaults = UserDefaults.standard
        let favoriteAnimes = defaults.array(forKey: "favoriteAnimes") as? [[String: String]] ?? []
        let favoriteAnime = favoriteAnimes[indexPath.row]
        let titleAnime = favoriteAnime["titleAnime"] ?? "Unknown Title"
        let imageName = favoriteAnime["imageName"] ?? "Unknown Title"
        cell.titleOfFav.text = titleAnime
        cell.imgView.image = UIImage(named: imageName)
        return cell
    }
    
    
}

extension FavouritesVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
}
