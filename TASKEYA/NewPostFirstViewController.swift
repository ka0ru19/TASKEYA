//
//  NewPostFirstViewController.swift
//  TASKEYA
//
//  Created by 井上航 on 2016/05/05.
//  Copyright © 2016年 Wataru Inoue. All rights reserved.
//

import UIKit
import Alamofire

class NewPostFirstViewController: UIViewController {
    
    var tagNumber1: Int!
    var price:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        
    }
    
    func writeToDatabase() {
        
        let URL = Foundation.URL(string: "https://taskeya.com/final/user/sample2.php")
        let jsonData :Data = try! Data(contentsOf: URL!)
        do {
            let json = try JSONSerialization.jsonObject(with: jsonData, options: .mutableLeaves) as? NSDictionary
            
            // エラーが起こらなければ後続の処理...
            price = json!["LastName"] as! String
            print(price)
            
        } catch  {
            // エラーが起こったらここに来るのでエラー処理などをする
            print("error")
        }
        
    }
    
    // メアドとパスでログインしたらユーザー情報を取得
    func getUserData(_ mail: String, pass: String) {
        let requestUrl = "https://taskeya.com/final/user/sample.php?um=" + mail + "&pw=" + pass
        
        Alamofire.request(.GET, requestUrl).responseJSON
            {response in
                let json = response.result.value
                print(json)
                
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btn1Tapped(_ sender: UIButton) {
        tagNumber1 = 1
        performSegue(withIdentifier: "toNewPostSecondVC",sender: nil)
    }
    
    @IBAction func btn2Tapped(_ sender: UIButton) {
        tagNumber1 = 2
        performSegue(withIdentifier: "toNewPostSecondVC",sender: nil)
    }
    
    @IBAction func btn3Tapped(_ sender: UIButton) {
        tagNumber1 = 3
        performSegue(withIdentifier: "toNewPostSecondVC",sender: nil)
    }
    
    @IBAction func btn4Tapped(_ sender: UIButton) {
        tagNumber1 = 4
        performSegue(withIdentifier: "toNewPostSecondVC",sender: nil)
    }
    
    
    // Segue 準備
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "toNewPostSecondVC" {
            let nextVC: NewPostSecondViewController = (segue.destinationViewController as? NewPostSecondViewController)!
            // SubViewController のselectedImgに選択された画像を設定する
            //            nextVC.userImage = userImage
            nextVC.displayID = tagNumber1
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
