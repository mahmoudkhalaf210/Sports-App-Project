//
//  DBmanger.swift
//  sports app
//
//  Created by Macintosh on 20/06/2022.
//

import Foundation
import CoreData



protocol DeletionDelegate{
    func deleteMovieAtIndexPath(indexPath: IndexPath)
}


class DBmanger {
    static let sharedInstance = DBmanger()
    private init(){
        
    }
    
}
extension DBmanger {

    
    // add League To Core Data Favourites

    func addLeague (AppDelegate : AppDelegate ,leagueitem : LeagueItem ){
        
        // get the shared application delegate
        
        let managedContext = AppDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "LeagueItem", in: managedContext)
        let league = NSManagedObject(entity: entity!, insertInto: managedContext)
        league.setValue(leagueitem.idleague , forKey: "idleague")
        league.setValue(leagueitem.strleague , forKey: "strleague")
        league.setValue(leagueitem.strsport , forKey: "strsport")

        do {
            try managedContext.save()
            print("data saved")
        }catch let error as NSError {
            print("error in core data saving")
            print(error.localizedDescription )
        }
    }
    
    
    
    func addLeague(AppDelegate : AppDelegate , idleague : String , strleague : String , strsport : String){
        // get the shared application delegate
        
        let managedContext = AppDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "LeagueItem", in: managedContext)
        let league = NSManagedObject(entity: entity!, insertInto: managedContext)
        league.setValue(idleague , forKey: "idleague")
        league.setValue(strleague , forKey: "strleague")
        league.setValue(strsport , forKey: "strsport")

        do {
            try managedContext.save()
        }catch let error as NSError {
            print("error in core data saving")
            print(error.localizedDescription )
        }
    }
        
    
    
    
    
    func fetchData(appDelegate : AppDelegate) -> [LeagueItem] {
        
        var fetchedList : [LeagueItem] = []
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "LeagueItem")

        do {
            fetchedList = try managedContext.fetch(fetchRequest) as! [LeagueItem]
            print("data fetched")
            
            
        } catch let error as NSError {
            print("error in fetch data in core data")
            print(error.localizedDescription)
        }

        return fetchedList
    }
    
    
    
    
    func delete(leagueItem :LeagueItem , indexPath: IndexPath, appDelegate: AppDelegate, delegate: DeletionDelegate){
        
        let managedContext = appDelegate.persistentContainer.viewContext
        managedContext.delete(leagueItem)
        do{
            try managedContext.save()
            delegate.deleteMovieAtIndexPath(indexPath: indexPath)
        }catch let error as NSError{
            print("Error in saving")
            print(error.localizedDescription)
        }
        
    }
    
    
    func delete(leagueItem :LeagueItem , appDelegate: AppDelegate){
        
        let managedContext = appDelegate.persistentContainer.viewContext
        managedContext.delete(leagueItem)
        do{
            try managedContext.save()
        }catch let error as NSError{
            print("Error in saving")
            print(error.localizedDescription)
        }
        
    }
    
    
    
}
