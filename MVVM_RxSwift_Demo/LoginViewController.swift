//
//  LoginViewController.swift
//  MVVM_RxSwift_Demo
//
//  Created by liJiang on 2017/9/14.
//  Copyright © 2017年 liJiang. All rights reserved.
//

import UIKit
import SVGKit
import RxSwift

class LoginViewController: UIViewController {
    @IBOutlet weak var phoneImage:UIImageView!
    @IBOutlet weak var lockImage:UIImageView!
    @IBOutlet weak var backBtn:UIButton!
    @IBOutlet weak var registerBtn:UIButton!
    @IBOutlet weak var loginBtn:UIButton!
    @IBOutlet weak var userTextField:UITextField!
    @IBOutlet weak var passwordTextField:UITextField!
    let viewModel = UserViewModel()
    let disposeBag = DisposeBag()
    var closure: Closure!

    override func viewDidLoad() {
        super.viewDidLoad()
        let phoneIm:SVGKImage = SVGKImage(contentsOfFile: Bundle.main.path(forResource: "phone", ofType: "svg"))
        let lockIm:SVGKImage = SVGKImage(contentsOfFile: Bundle.main.path(forResource: "lock", ofType: "svg"))
        let backIm:SVGKImage = SVGKImage(contentsOfFile: Bundle.main.path(forResource: "goback_btn", ofType: "svg"))
        
        phoneIm.size = CGSize(width: kScreenW/12, height: kScreenW/12)
        lockIm.size = CGSize(width: kScreenW/12, height: kScreenW/12)
        backIm.size = CGSize(width: kScreenW/15, height: kScreenW/15)
        
        phoneImage.image = phoneIm.uiImage;
        lockImage.image = lockIm.uiImage;
        backBtn.setImage(backIm.uiImage, for: UIControlState.normal)
        backBtn.addTarget(self, action: #selector(LoginViewController.backBtnPressed), for: UIControlEvents.touchDown)
        registerBtn.addTarget(self, action: #selector(LoginViewController.jumpToRegisterView), for: UIControlEvents.touchDown)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func backBtnPressed() -> Void {
        self.dismiss(animated: true, completion: nil)
    }
    
    func jumpToRegisterView() -> Void {
        self.navigationController?.pushViewController(CustomWebViewController(), animated: true)
    }
    
    @IBAction func login() -> Void {
        viewModel.login(username:"lj200010" , password: "147258")
            .subscribe(onNext: { (topicModels: [TopicModel]) in
                var stringButter = ""
                //do something
                for e in topicModels.enumerated() {
                    print("\(e.offset)\(String(describing: e.element.content))")
                    stringButter += String(describing: e.element.content)
                    
                }
                if let closure = self.closure {
                    closure(stringButter)
                }
                self.dismiss(animated: true, completion: nil)
            })
            .addDisposableTo(disposeBag)
    }
    
    func callBack(closure: Closure!) {
        // 赋值闭包属性
        self.closure = closure
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
