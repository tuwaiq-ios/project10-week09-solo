//
//  Video.swift
//  KidsLogic
//
//  Created by sara saud on 23/04/1443 AH.
//

import WebKit
class Vedio: UIViewController, WKUIDelegate {
    
    var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
   
        let myURL = URL(string:"https://www.youtube.com/watch?v=YtYEGsi2HB4")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
}


