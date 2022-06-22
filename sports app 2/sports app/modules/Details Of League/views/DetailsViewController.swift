//
//  DetailsViewController.swift
//  sports app
//
//  Created by Macintosh on 20/06/2022.
//

import UIKit
import CoreData

class DetailsViewController: UIViewController {

    @IBOutlet weak var headerOfLeague: UILabel!
    @IBOutlet weak var favouriteButton: UIButton!

    
    // collections view


    // dBmanger
    var db = DBmanger.sharedInstance
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    
    var LeaguesFavourites : [LeagueItem] = []
    var getFavouriteList :[LeagueItem] = []

    var league : League?
    var strleague : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        headerOfLeague.text = "\(league?.strLeague ?? "ahmed" )"
        
        
        
        // define cells into view
      //  myCollectionView.register(UINib(nibName: "sportsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "collectioncell")
        
        
        
        
        
        
        
        

    }
    
    
  
    // MARK: - button to make league favourite
    @IBAction func addColorFavorite(_ sender: Any) {
       // for item in getFavouriteList {
          /*  if item.strleague == league?.strLeague{
                print("not add item ")
            }else {*/
        db.addLeague(AppDelegate: appDelegate , idleague: league?.idLeague ?? "", strleague: league?.strLeague ?? "", strsport: league?.strSport ?? "" , strBadge: league?.strBadge ?? ""  , strYoutube: league?.strYoutube ?? "" )
                makeColorFavourite()
    
            //}
 //   }
    }
    
    // MARK: - function make check if league inside in favourites and change color
    override func viewWillAppear(_ animated: Bool) {
        
        favouriteButton.layer.cornerRadius = 5
        getFavouriteList = db.fetchData(appDelegate: appDelegate)
        for item in getFavouriteList {
            if item.strleague == league?.strLeague{
                makeColorFavourite()
            }
        }
    }
    

}


// MARK: - function make color to favourite
extension DetailsViewController {
    func makeColorFavourite() {
        favouriteButton.backgroundColor = UIColor.red
    }
    
}







