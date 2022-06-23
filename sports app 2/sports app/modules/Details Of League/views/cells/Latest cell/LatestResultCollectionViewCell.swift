//
//  LatestResultCollectionViewCell.swift
//  sports app
//
//  Created by Macintosh on 21/06/2022.
//

import UIKit

class LatestResultCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var firstTeam: UILabel!
    @IBOutlet weak var firstTeamScore: UILabel!
    
    @IBOutlet weak var dateOfMatch: UILabel!
    @IBOutlet weak var secondTeam: UILabel!
    @IBOutlet weak var secondTeamScore: UILabel!
    @IBOutlet weak var timeOfmatch: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

  
    func setupDataInLateset(event : Event){
        firstTeam.text = event.strHomeTeam
        secondTeam.text = event.strAwayTeam
        
        firstTeamScore.text = event.intHomeScore
        secondTeamScore.text = event.intAwayScore
        
        dateOfMatch.text = event.dateEventLocal
        timeOfmatch.text = event.strTimeLocal
    }
    
    
  
    
    
    
}
