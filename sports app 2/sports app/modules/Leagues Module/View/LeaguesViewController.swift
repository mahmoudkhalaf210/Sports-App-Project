//
//  LeaguesViewController.swift
//  sports app
//
//  Created by Macintosh on 19/06/2022.
//

import UIKit





class LeaguesViewController: UIViewController {
    
    var selectedRow : Int = 0

    @IBOutlet weak var myTableView: UITableView!

    var leagues = [League]()
    // variable to set strSport from sports page
    var strSport : String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        

        
    
        myTableView.register(UINib(nibName: "LeagueTableViewCell", bundle: nil), forCellReuseIdentifier: "leaguecell")
        // collection view cell regitser
        
        // MARK: - Use Presenter

        let leaguesPresenter : ILeaguesPresenter = leaguesPresenter(leagueView: self, str: self.strSport )
        leaguesPresenter.fetchData(endpoint: "all_leagues.php")
        
        // Do any additional setup after loading the view.
    }
}

// MARK: - UItable View DataSource
extension LeaguesViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leagues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "leaguecell", for: indexPath) as? LeagueTableViewCell
        cell?.SetupLeagueInCell(league: leagues[indexPath.row], leagueItem: nil)
        cell?.delegate = self
       cell?.index = indexPath
        
        
        // make radius to cell
        cell?.clipsToBounds = true
        cell?.layer.cornerRadius = 50
   
      
        
        
        return cell!
    }
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
    
    
    
    
}

// MARK: - UItable View Delegate
extension LeaguesViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRow = indexPath.row
        performSegue(withIdentifier: "detail", sender: nil)
    }
    
}



// MARK: - ISports View

extension LeaguesViewController : ILeaguesView {
    func renderAllLeagues(leagues: [League]) {
        self.leagues = leagues
        print(leagues)
        DispatchQueue.main.async {
            self.myTableView.reloadData()
        }
    }
    
    func postErroeInLeagues(error: Error) {
        print(error.localizedDescription)
    }
}






// MARK: - Implementation of Protocol  <<<< link to WebView

extension LeaguesViewController : WebViewProtocol {
    // link = leagues[index].link
    
    func onClickButton(index: Int) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "webview") as? WebViewViewController
        present(vc!, animated: true, completion: nil)
    }
    
    
    
}


// MARK: - prepare For Segue

extension LeaguesViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        let secondVC = segue.destination as! DetailsViewController
        secondVC.league = leagues[selectedRow]
    }
}

