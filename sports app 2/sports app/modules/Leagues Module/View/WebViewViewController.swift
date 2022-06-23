//
//  WebViewViewController.swift
//  sports app
//
//  Created by Macintosh on 20/06/2022.
//

import UIKit
import WebKit



class WebViewViewController: UIViewController {
    @IBOutlet weak var MyWebView: WKWebView!
    
    var youtube : String! = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        print(youtube!)
        MyWebView.configuration.allowsInlineMediaPlayback = true
        
        MyWebView.loadHTMLString(youtube!, baseURL: nil)
        
     /*  let url = URL(string: youtube!)
        let request = URLRequest(url: url!)
        MyWebView.load(request)*/
        
       // MyWebView.load(URLRequest(url: URL(string: "https://www.youtube.com/channel/UC3Guly6AbOr3PqrZMaV6vog" )!))
        
        //"https://www.youtube.com/watch?v=i2yhyaNb4ac"

    }
    

 

}
