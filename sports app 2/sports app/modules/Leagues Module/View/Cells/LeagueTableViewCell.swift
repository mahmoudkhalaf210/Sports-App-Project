//
//  LeagueTableViewCell.swift
//  sports app
//
//  Created by Macintosh on 19/06/2022.
//

import UIKit

class LeagueTableViewCell: UITableViewCell {

  //  @IBOutlet weak var LinkLeagueInCell: UILabel!
    @IBOutlet weak var titleLeagueInCell: UILabel!
    @IBOutlet weak var imageLeagueInCell: UIImageView!
    
    @IBOutlet weak var MyView: UIView!
    
    // delegate of protocol web view
    var delegate : WebViewProtocol?
    // index path to save from leagues screen
    var index : IndexPath?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
  
    }
    // MARK: - func click to go to webPage
    @IBAction func GoToLink(_ sender: Any) {

        delegate?.onClickButton(index: (index?.row)! )
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    // MARK: - setup data from sport json or core data

    func SetupLeagueInCell(league : League?, leagueItem : LeagueItem?) {
        
        if league != nil {
            titleLeagueInCell.text = league?.strLeague
            imageLeagueInCell.sd_setImage(with: URL(string: "\(league?.strBadge ?? "https://www.thesportsdb.com/images/media/league/badge/6shh7l1645299895.png")"), placeholderImage: UIImage(named: "luffy.jpeg"))
            
        }else {
                titleLeagueInCell.text = leagueItem?.strleague
            imageLeagueInCell.sd_setImage(with: URL(string: "\(leagueItem?.strBadge ?? "https://www.thesportsdb.com/images/media/league/badge/6shh7l1645299895.png")") , placeholderImage: UIImage(named: "logo1.jpeg"))
            }
        
    }

}

// MARK: - Protocol  <<<< link to WebView

protocol WebViewProtocol {
    func onClickButton(index : Int )
}

