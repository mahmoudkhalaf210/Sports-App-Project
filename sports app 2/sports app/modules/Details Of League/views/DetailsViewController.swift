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
    @IBOutlet weak var upComingCollectionView: UICollectionView!
    @IBOutlet weak var latestResultCollectionView: UICollectionView!
    @IBOutlet weak var teamsCollectionView: UICollectionView!
    
    
    
    // teams
    var teams = [Team]()
    // events
    var events = [Event]()
    
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
        upComingCollectionView.register(UINib(nibName: "UpComingCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "upcoming")
        latestResultCollectionView.register(UINib(nibName: "LatestResultCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "latest")
        teamsCollectionView.register(UINib(nibName: "TeamsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "teams")
        
        upComingCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        latestResultCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        teamsCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
        
        let layoutUpcoming = UICollectionViewFlowLayout()
        let layoutlateset = UICollectionViewFlowLayout()
        let layoutTeams = UICollectionViewFlowLayout()
        
        layoutUpcoming.scrollDirection = .horizontal
        layoutlateset.scrollDirection = .vertical
        layoutTeams.scrollDirection = .horizontal
        
        upComingCollectionView.collectionViewLayout = layoutUpcoming
        latestResultCollectionView.collectionViewLayout = layoutlateset
        teamsCollectionView.collectionViewLayout = layoutTeams
        
        
        
        
        // data presenter of teams
        let teamPresenter : ITeamPresenter = DetailsPresenter(teamsview: self)
        teamPresenter.fetchDataOfTeams(endPoint: (league?.strLeague)!)
        
        // data presenter of events
        let eventPresenter : IEventPresenter = PresenterInEventDetails(eventsView: self)
        eventPresenter.fetchdataOfEvents(endPoint: (league?.idLeague)!)
        

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





extension DetailsViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        if collectionView == upComingCollectionView{
            return CGSize(width: 350, height: 200)
        }
        else if (collectionView == latestResultCollectionView)
        {
            return CGSize(width:400, height: 170)
        }
        return CGSize(width:250, height: 200)
    }
}



extension DetailsViewController : UICollectionViewDelegate {}


extension DetailsViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
            
        case upComingCollectionView :
            do {
                print("in upComing")
                return events.count
            }
        case latestResultCollectionView:
            do {
                print("in latest")
                return 20
            }
        case teamsCollectionView:
            do {
                print("in team")
                return teams.count
            }
        default:
            return 20
        
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (collectionView == upComingCollectionView){
            let cell : UpComingCollectionViewCell = (upComingCollectionView.dequeueReusableCell(withReuseIdentifier: "upcoming", for: indexPath) as? UpComingCollectionViewCell)!
            
            cell.setUpdata(event: events[indexPath.row])
            return cell
        }
        else if (collectionView == latestResultCollectionView){
            let cell : LatestResultCollectionViewCell = (latestResultCollectionView.dequeueReusableCell(withReuseIdentifier: "latest", for: indexPath) as?
                                                         LatestResultCollectionViewCell)!
            return cell
        }
        else {
            let cell : TeamsCollectionViewCell = (teamsCollectionView.dequeueReusableCell(withReuseIdentifier: "teams", for: indexPath) as? TeamsCollectionViewCell)!
            cell.setupdata(team: teams[indexPath.row])
            return cell
        }
    }
    
    
    
}





extension DetailsViewController : ITeamView {
    func renderTeams(teams: [Team]) {
        print("teams >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
        print(teams)
        self.teams = teams
        DispatchQueue.main.sync {
            self.teamsCollectionView.reloadData()
        }
    }
    
    func postErrorInTeams(error: Error) {
        print(error.localizedDescription)
    }
    
}

extension DetailsViewController : IEventView {
    func renderEvents(events: [Event]) {
        self.events = events
        DispatchQueue.main.sync {
            self.upComingCollectionView.reloadData()
        }
    }
    
    func postErrorInEvents(error: Error) {
        print(error.localizedDescription)
    }
    
    
}


