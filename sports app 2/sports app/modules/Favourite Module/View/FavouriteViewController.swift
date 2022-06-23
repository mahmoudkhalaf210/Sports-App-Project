//
//  FavouriteViewController.swift
//  sports app
//
//  Created by Macintosh on 20/06/2022.
//

import UIKit
import Network


class FavouriteViewController: UIViewController, WebViewProtocol {
    func onClickButton(index: Int) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "webview") as? WebViewViewController
        present(vc!, animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var myTableView: UITableView!
    
    var selectedRow : Int = 0

    
    var db = DBmanger.sharedInstance
    let appDelegate = UIApplication.shared.delegate as! AppDelegate


    var leagueList = [LeagueItem]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        myTableView.register(UINib(nibName: "LeagueTableViewCell", bundle: nil), forCellReuseIdentifier: "leaguecell")
        // collection view cell regitser
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        monitorNetwork()
        myTableView.reloadData()
        leagueList = db.fetchData(appDelegate: appDelegate)
    }

}





// delete from list

extension FavouriteViewController: DeletionDelegate{
    func deleteMovieAtIndexPath(indexPath: IndexPath){
        leagueList.remove(at: indexPath.row)
        DispatchQueue.main.async {
            self.myTableView.reloadData()
        }
    }

}



extension FavouriteViewController : UITableViewDelegate {
    
}


// MARK: - Table view Data Source

extension FavouriteViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leagueList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "leaguecell", for: indexPath) as? LeagueTableViewCell
        
        cell?.SetupLeagueInCell(league: nil, leagueItem: leagueList[indexPath.row])
        cell?.delegate = self
       cell?.index = indexPath
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // to delete League From Core data
       // db.delete(leagueItem: leagueList[indexPath.row], indexPath: indexPath, appDelegate: appDelegate, delegate: self)
        selectedRow = indexPath.row
        performSegue(withIdentifier: "detail", sender: nil)
        
        
    }
    
}





// MARK: - Func Alert Connection
extension FavouriteViewController {
func showalert(){
    let alert = UIAlertController(title: "Alert", message: "You are Not connect to Network ", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
    self.present(alert, animated: true, completion: nil)
    
    }
}

// MARK: - Func check network
extension FavouriteViewController {
    
    
    func monitorNetwork(){
        let monitor = NWPathMonitor()
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                DispatchQueue.main.async { [self] in
                    print("internet Connected")
                    myTableView.reloadData()
                    
                }
            } else {
                DispatchQueue.main.async { [self] in
                showalert()
                myTableView.reloadData()
                }
            }
        }
        let queue = DispatchQueue(label: "Network")
        monitor.start(queue: queue)
    }
}

// MARK: - prepare For Segue
extension FavouriteViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondVC = segue.destination as! DetailsViewController
        secondVC.strleague = leagueList[selectedRow].strleague
    }
}
