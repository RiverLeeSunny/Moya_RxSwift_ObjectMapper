//
//  ViewController.swift
//  MVVM_RxSwift_Demo
//
//  Created by liJiang on 2017/9/14.
//  Copyright © 2017年 liJiang. All rights reserved.
//

import UIKit
import SVGKit
class ViewController: UIViewController {
    
    @IBOutlet weak var textView:UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showLoginView(_ sender:AnyObject){
        let sb = UIStoryboard(name: "Main", bundle:nil)
        let loginVC = sb.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        loginVC.callBack { [weak self] (value: String?) -> Void in
            self?.textView.text = value
        }
        let navgationController = UINavigationController(rootViewController: loginVC);
        self.present(navgationController, animated: true, completion: nil)
    }
}

