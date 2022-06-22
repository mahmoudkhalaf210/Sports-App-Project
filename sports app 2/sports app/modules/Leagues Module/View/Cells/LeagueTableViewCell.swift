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
    
    
    var delegate : WebViewProtocol?
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
        
        makeImageCircle()

        // Configure the view for the selected state
    }
    
    func SetupLeagueInCell(league : League?, leagueItem : LeagueItem?) {
        
        if league != nil {
            titleLeagueInCell.text = league?.strLeague
            imageLeagueInCell.sd_setImage(with: URL(string: "\(league?.strBadge ?? "https://www.thesportsdb.com/images/media/league/badge/6shh7l1645299895.png")"), placeholderImage: UIImage(named: "luffy.jpeg"))
            
        }else {
                titleLeagueInCell.text = leagueItem?.strleague
            imageLeagueInCell.sd_setImage(with: URL(string: "\(leagueItem?.strBadge ?? "https://www.thesportsdb.com/images/media/league/badge/6shh7l1645299895.png")") , placeholderImage: UIImage(named: "logo1.jpeg"))
            }
        
    }
    
    func makeImageCircle(){

        imageLeagueInCell.layer.masksToBounds = true
        imageLeagueInCell.layer.cornerRadius = imageLeagueInCell.frame.height / 2
        
        imageLeagueInCell.layer.shadowColor = UIColor.red.cgColor
        imageLeagueInCell.layer.shadowOffset = CGSize(width: 5 , height: 5)
        imageLeagueInCell.layer.shadowOpacity = 1
        imageLeagueInCell.layer.shadowRadius = 10
    }
    
    
    
    
    
    
    
    
}





// MARK: - Protocol  <<<< link to WebView

protocol WebViewProtocol {
    func onClickButton(index : Int )
}

