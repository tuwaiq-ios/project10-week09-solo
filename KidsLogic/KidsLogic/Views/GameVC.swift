//
//  GameVC.swift
//  KidsLogic
//
//  Created by sara saud on 23/04/1443 AH.
//


import WebKit
class GameVC: UIViewController, WKUIDelegate {
    
    var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
   
        let myURL = URL(string:"https://app.codemonkey.com/junior/chapters/sequencing/challenges/7")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
}


