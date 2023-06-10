//
//  WebViewController.swift
//  LoginScreen
//
//  Created by unkn0wn on 2/21/23.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var webView: WKWebView!
    
    weak var mainCoordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadUrlInWebView()
        webView.navigationDelegate = self
    }
    
    func loadUrlInWebView() {
        DispatchQueue.main.async {
            let url = URL(string: "https://www.facebook.com")!
            let request = URLRequest(url: url)
            self.webView.load(request)
            
            //        let htmlString = """
            //        <!DOCTYPE html>
            //        <html>
            //        <body>
            //
            //        <h1>My First Heading</h1>
            //        <p>My first paragraph.</p>
            //
            //        </body>
            //        </html>
            //        """
            //
            //        webView.loadHTMLString(htmlString, baseURL: url)
        }
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print(error.localizedDescription)
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction) async -> WKNavigationActionPolicy {
        if webView.url == URL(string: "https://www.apple.com/") {
            return .cancel
        }
        return .allow
    }
}
