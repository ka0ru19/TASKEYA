//
//  LoginViewController.swift
//  TASKEYA
//
//  Created by 井上航 on 2016/05/07.
//  Copyright © 2016年 Wataru Inoue. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        
        print("login tapped")
        getUserData(emailTextField.text!, pass: passwordTextField.text!)
        
    }
    
    // メアドとパスでログインしたらユーザー情報を取得
    func getUserData(_ mail: String, pass: String) {
        //        let requestUrl = "https://taskeya.com/final/user/sample.php?um=" + mail + "&pw=" + pass
        
        let requestUrl = "https://kiyo:kiyokiyo@taskeya.com/mobile/?code=kiyocixo113aks331mxhr76567ejxaaa&func=signin&um=" + mail + "&up=" + pass
        
        print(requestUrl)
        
        Alamofire.request(.GET, requestUrl).responseJSON
            {response in
                
                print("response")
                
                guard let object = response.result.value else {
                    print("guard let object = response.result.value else")
                    return
                }
                let json = JSON(object)
                print(json)
                let id: String? = json["TSK_ID"].string
                
//                let userInfo: [String: String?] = [
//                    "MailAddress": json["title"].string,
//                    "userId": json["user"]["id"].string,
//                    "dateString": json["updated_at"].string,
//                    "imageString": json["user"]["profile_image_url"].string,
//                    "webUrl": json["url"].string
//                ]
                
                let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                appDelegate.app_TSK_ID = id
                
                if appDelegate.app_TSK_ID == nil {
                    print("ログイン失敗")
                    self.passwordTextField.placeholder = "パスワードが違います"
                } else {
                    print("ログイン成功、プロフィールに画面遷移する")
                    // NSDBに保存
                    let defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
                    defaults.setValue(id, forKey: "tsk_id")
                    defaults.synchronize()
                    
                    // 画面遷移
                    let storyboard:UIStoryboard = UIStoryboard(name: "Main",bundle:nil)
                    var viewController: UITabBarController //UIViewController!
                    viewController = storyboard.instantiateViewControllerWithIdentifier("TabBarVC") as! UITabBarController
                    self.presentViewController(viewController, animated: true, completion: nil)
                }
                
        }
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
