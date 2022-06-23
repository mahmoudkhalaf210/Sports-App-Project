//
//  SportsViewController.swift
//  sports app
//
//  Created by Macintosh on 19/06/2022.
//

import UIKit

class SportsViewController: UIViewController {
 
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    // sports
    var sports = [Sport]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - Use Presenter
        let sportsPresenter : ISportsPresenter = SportsPresenter(iSportsView: self)
        sportsPresenter.fetchData(endPoint: "all_sports.php")

        
        // collection view cell regitser
        myCollectionView.register(UINib(nibName: "sportsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "collectioncell")
        // width and height of cell
     myCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
}
    
}


// MARK: - Collection View Delegate
extension SportsViewController : UICollectionViewDelegate{
  
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("selected  \(sports[indexPath.row].strSport)")
        
        let secondVc = storyboard?.instantiateViewController(withIdentifier: "league") as! LeaguesViewController
        secondVc.strSport = sports[indexPath.row].strSport
        navigationController?.pushViewController(secondVc, animated: true)
    
    }
    
}


// MARK: - Collection View DataSource

extension SportsViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sports.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectioncell", for: indexPath) as? sportsCollectionViewCell
        
        cell?.setupDataInCell(sport: sports[indexPath.row])
        // make radius to cell 
        cell?.clipsToBounds = true
        cell?.layer.cornerRadius = 15
        return cell!
    }
    
    
}

// MARK: - Collection View UICollectionViewDelegateFlowLayout  >>> width and height of cell

extension SportsViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // make size 2 to any screen
        let size = (myCollectionView.frame.size.width - 10)/2
        return CGSize(width: size , height: 280)
    }
}



// MARK: - ISports View

extension SportsViewController : ISportsView {
    
    func renderAllSports(sports: [Sport]) {
        self.sports = sports
        print(sports)
        DispatchQueue.main.async {
            self.myCollectionView.reloadData()
        }
    }
    
    func postErrorInSports(error: Error) {
        print(error.localizedDescription)
    }
    
    
}
