//
//  DetailsVC.swift
//  TableViewPractice
//
//  Created by Sudeepa Pal on 15/10/24.
//

import UIKit

class DetailsVC: UIViewController {

    @IBOutlet weak var detailsImg: UIImageView! {
        didSet {
            detailsImg.layer.cornerRadius = 20
            detailsImg.clipsToBounds = true
        }
    }
    
    @IBOutlet weak var detailsInfo: UITextView!
    
    var textViewMat = ""
    var imgName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        detailsImg.image = UIImage(named: imgName)
        detailsInfo.text = textViewMat
        
        
        // Do any additional setup after loading the view.
    }
    


}
