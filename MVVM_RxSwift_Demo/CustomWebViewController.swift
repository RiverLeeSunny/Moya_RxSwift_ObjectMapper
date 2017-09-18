//
//  CustomWebViewController.swift
//  MVVM_RxSwift_Demo
//
//  Created by liJiang on 2017/9/15.
//  Copyright © 2017年 liJiang. All rights reserved.
//

import UIKit
import WebKit

class CustomWebViewController: UIViewController,WKUIDelegate {
    
    var webView:WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let myURL = URL(string: RegisterAddress)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
