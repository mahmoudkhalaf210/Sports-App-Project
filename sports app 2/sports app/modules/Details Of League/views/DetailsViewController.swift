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
    
    
    var selectedRowINTeam : Int = 0

    
    // teams
    var teams = [Team]()
    // events
    var events = [Event]()
    // latest event
    var LatestEvents = [Event]()
    
    // dBmanger
    var db = DBmanger.sharedInstance
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    
    var LeaguesFavourites : [LeagueItem] = []
    var getFavouriteList :[LeagueItem] = []

    var league : League?
    
    // fromfavourite in core data
    var strleague : String?
    var idLeage : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        headerOfLeague.text = "\(league?.strLeague ?? "Khalifa" )"
        
        
        
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
       
        fetchdataFromTeamPresenter(str: league?.strLeague)
        
        // data presenter of events
       
        

    }
    
    // MARK: - func to check if data from sports or from coredata

    func fetchdataFromTeamPresenter(str : String?){
        if str != nil {
            // data from sports
        let teamPresenter : ITeamPresenter = DetailsPresenter(teamsview: self)
            teamPresenter.fetchDataOfTeams(endPoint: (league?.strLeague)!)
            
        let eventPresenter : IEventPresenter = PresenterInEventDetails(eventsView: self)
            eventPresenter.fetchdataOfEvents(endPoint: (league?.idLeague)!)
            
        }else{
            // data from core data
            let teamPresenter : ITeamPresenter = DetailsPresenter(teamsview: self)
                teamPresenter.fetchDataOfTeams(endPoint: strleague!)
                
            let eventPresenter : IEventPresenter = PresenterInEventDetails(eventsView: self)
                eventPresenter.fetchdataOfEvents(endPoint: idLeage!)
            
        }
        
     
    }
    
    
  
    // MARK: - button to make league favourite
    @IBAction func addColorFavorite(_ sender: Any) {
       // for item in getFavouriteList {
          /*  if item.strleague == league?.strLeague{
                print("not add item ")
            }else {*/
        
        if let image = UIImage(systemName: "heart.fill") {
            favouriteButton.setImage(image, for: .normal)
        }
        
        
        db.addLeague(AppDelegate: appDelegate , idleague: league?.idLeague ?? "", strleague: league?.strLeague ?? "", strsport: league?.strSport ?? "" , strBadge: league?.strBadge ?? ""  , strYoutube: league?.strYoutube ?? "" )
        
        // make red color
               // makeColorFavourite()

    }
    
    // MARK: - function make check if league inside in favourites and change color
    override func viewWillAppear(_ animated: Bool) {
        
        favouriteButton.layer.cornerRadius = 5
        getFavouriteList = db.fetchData(appDelegate: appDelegate)
        for item in getFavouriteList {
            if item.strleague == league?.strLeague{
               // makeColorFavourite()
                if let image = UIImage(systemName: "heart.fill") {
                    favouriteButton.setImage(image, for: .normal)
                    
                }
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




// MARK: - add width and height to cells in any collection view

extension DetailsViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        if collectionView == upComingCollectionView{
            return CGSize(width: 350, height: 200)
        }
        else if (collectionView == latestResultCollectionView)
        {
            return CGSize(width:400, height: 170)
        }
        return CGSize(width:150, height: 140)
    }
}


// MARK: - add didselect to cells in any collection view

extension DetailsViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == teamsCollectionView {
            
            selectedRowINTeam = indexPath.row
            performSegue(withIdentifier: "gotodetail", sender: nil)
           // let vc2 = storyboard?.instantiateViewController(withIdentifier: "Detail") as! DetailsOfTeamViewController
           // vc2.makeSetupdata(team: teams[indexPath.row])

           // present(vc2, animated: true, completion: nil)
            
        }
    }
}


// MARK: - add data source to cells in any collection view

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
                print(events.count)
                return LatestEvents.count
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
            let cell : LatestResultCollectionViewCell = (latestResultCollectionView.dequeueReusableCell(withReuseIdentifier: "latest", for: indexPath) as? LatestResultCollectionViewCell)!
            cell.setupDataInLateset(event: LatestEvents[indexPath.row])
            return cell
        }
        else {
            let cell : TeamsCollectionViewCell = (teamsCollectionView.dequeueReusableCell(withReuseIdentifier: "teams", for: indexPath) as? TeamsCollectionViewCell)!
            cell.setupdata(team: teams[indexPath.row])

            return cell
        }
    }
    
}




// MARK: - add team View

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

// MARK: - add Event View

extension DetailsViewController : IEventView {
    func renderEvents(events: [Event]) {
        self.events = events
        self.LatestEvents = events
        print(LatestEvents)
        DispatchQueue.main.sync {
            self.upComingCollectionView.reloadData()
            self.latestResultCollectionView.reloadData()
        }
    }
    
    func postErrorInEvents(error: Error) {
        print(error.localizedDescription)
    }
    
    
}




// MARK: - prepare for segue to Details of team

extension DetailsViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc2 = segue.destination as! DetailsOfTeamViewController
        vc2.imageTeam = teams[selectedRowINTeam].strStadiumThumb
        vc2.strAlt =  teams[selectedRowINTeam].strAlternate
        vc2.stringTeam = teams[selectedRowINTeam].strTeam
        vc2.dest1 = teams[selectedRowINTeam].strDescriptionFR
        vc2.dest2 = teams[selectedRowINTeam].strDescriptionEN
        vc2.dest3 = teams[selectedRowINTeam].strDescriptionDE
    }
}



// MARK: - make data of latest events (sort events and make it latest)



