//
//  TeamsCollectionViewCell.swift
//  sports app
//
//  Created by Macintosh on 21/06/2022.
//

import UIKit

class TeamsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageOfTeam: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        makeImageCircle()
        
        
        
    }

    
    
    
    
    
    func makeImageCircle(){

        imageOfTeam.layer.masksToBounds = true
        imageOfTeam.layer.cornerRadius = imageOfTeam.frame.height / 2
        
        imageOfTeam.layer.shadowColor = UIColor.red.cgColor
        imageOfTeam.layer.shadowOffset = CGSize(width: 5 , height: 5)
        imageOfTeam.layer.shadowOpacity = 1
        imageOfTeam.layer.shadowRadius = 10
    }
    
}
