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
    
    override func viewDidLoad() {
        super.viewDidLoad()


        MyWebView.load(URLRequest(url: URL(string: "https://www.youtube.com/watch?v=i2yhyaNb4ac")!))

    }
    

 

}
