//
//  TeamsCollectionViewCell.swift
//  sports app
//
//  Created by Macintosh on 21/06/2022.
//

import UIKit
import SDWebImage

class TeamsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageOfTeam: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
      //  makeImageCircle()
        
        
        
    }

    
    func setupdata (team : Team) {
        imageOfTeam.sd_setImage(with: URL(string: "\(team.strTeamBadge!)"), placeholderImage: UIImage(named: "luffy.jpeg"))
    }
    
    
    
}
