//
//  DetailsOfTeamViewController.swift
//  sports app
//
//  Created by Macintosh on 23/06/2022.
//

import UIKit

class DetailsOfTeamViewController: UIViewController {

    @IBOutlet weak var imageOfTeam: UIImageView!
    @IBOutlet weak var strTeam: UILabel!
    @IBOutlet weak var strAlternate: UILabel!
    @IBOutlet weak var des1: UILabel!
    @IBOutlet weak var des2: UILabel!
    @IBOutlet weak var des3: UILabel!
    
    
    
   var imageTeam : String? = ""
    var stringTeam : String? = ""
    var strAlt : String? = ""
    var dest1 : String? = ""
    var dest2 : String? = ""
    var dest3 : String? = ""
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        imageOfTeam.sd_setImage(with: URL(string: "\(imageTeam ?? "")"), placeholderImage: UIImage(named: "poster.jpeg"))
        strTeam.text = stringTeam ?? ""
        strAlternate.text =  strAlt ?? ""
        des1.text = dest1 ?? ""
        des2.text = dest2 ?? ""
        des3.text = dest3 ?? ""
        
    }

}
