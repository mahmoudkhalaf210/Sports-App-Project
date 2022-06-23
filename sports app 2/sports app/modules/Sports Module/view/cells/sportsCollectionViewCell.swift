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

    }


    func setupDataInCell (sport : Sport){
        titleOfSport.text = sport.strSport
        imageOfSport.sd_setImage(with: URL(string: "\(sport.strSportThumb)"), placeholderImage: UIImage(named: "luffy.jpeg"))
    }
  
    
}
