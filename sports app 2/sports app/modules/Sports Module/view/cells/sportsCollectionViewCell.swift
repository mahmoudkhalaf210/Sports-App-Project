//
//  sportsCollectionViewCell.swift
//  sports app
//
//  Created by Macintosh on 19/06/2022.
//

import UIKit
import SDWebImage

class sportsCollectionViewCell: UICollectionViewCell {
    

    @IBOutlet weak var titleOfSport: UILabel!
    @IBOutlet weak var imageOfSport: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        makeImage()
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOffset = CGSize(width: 0, height: 0)
        contentView.layer.shadowOpacity = 0.8
        contentView.layer.shadowRadius = 10
    }

    
    
    func makeImage(){

        imageOfSport.layer.masksToBounds = true
        imageOfSport.layer.cornerRadius = 10
        imageOfSport.clipsToBounds = true
 
    }
    
    
    func setupDataInCell (sport : Sport){
        titleOfSport.text = sport.strSport
        imageOfSport.sd_setImage(with: URL(string: "\(sport.strSportThumb)"), placeholderImage: UIImage(named: "luffy.jpeg"))
    }
  
    
}
