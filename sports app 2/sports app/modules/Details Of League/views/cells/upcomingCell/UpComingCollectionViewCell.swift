//
//  UpComingCollectionViewCell.swift
//  sports app
//
//  Created by Macintosh on 21/06/2022.
//

import UIKit

class UpComingCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var timeOfEvent: UILabel!
    
    @IBOutlet weak var eventName: UILabel!
    @IBOutlet weak var dateOfEvent: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUpdata(event : Event) {
        
        eventName.text = event.strEvent
        dateOfEvent.text = event.dateEvent
        timeOfEvent.text = event.strTime
        
        
    }
}
