//
//  NotificationsController.swift
//  NOOK
//
//  Created by HANAN on 21/04/1443 AH.
//
import UIKit
import WebKit

class NotificationsController : UIViewController , WKUIDelegate{

        
        var webView: WKWebView!
        
        override func loadView() {
            let webConfiguration = WKWebViewConfiguration()
            webView = WKWebView(frame: .zero, configuration: webConfiguration)
            webView.uiDelegate = self
            view = webView
        }
        override func viewDidLoad() {
            super.viewDidLoad()
            configureUI()
            
            let myURL = URL(string:"https://mana.net")
            let myRequest = URLRequest(url: myURL!)
            webView.load(myRequest)
        }
 
    func configureUI() {
        
        view.backgroundColor = .systemGray6
        navigationItem.title = "library"
    }
}
   

