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

        delegate?.onClickButton(index: (index?.row)!)
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        makeImageCircle()

        // Configure the view for the selected state
    }
    
    func SetupLeagueInCell(league : League?, leagueItem : LeagueItem?) {
        
        if league != nil {
        
            titleLeagueInCell.text = league?.strLeague
       // LinkLeagueInCell.text = league.strLeagueAlternate
      //  LinkLeagueInCell.text = "https://www.youtube.com/watch?v=i2yhyaNb4ac"
            imageLeagueInCell.sd_setImage(with: URL(string: "\(league!.strSport)"), placeholderImage: UIImage(named: "logo1.jpeg")) }else {
                
                titleLeagueInCell.text = leagueItem?.strleague
                imageLeagueInCell.sd_setImage(with: URL(string: "\(String(describing: leagueItem!.strsport))"), placeholderImage: UIImage(named: "logo1.jpeg"))
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
    func onClickButton(index : Int)
}

