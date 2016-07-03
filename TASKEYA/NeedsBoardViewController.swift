//
//  NeedsBoardViewController.swift
//  TASKEYA
//
//  Created by 井上航 on 2016/05/05.
//  Copyright © 2016年 Wataru Inoue. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class NeedsBoardViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var table: UITableView!
    
    var userImage: UIImage?
    var selectedPost: Post?
    
    var postArray: [Post] = []
    
//    var articles:[Anyobject!]
    
    // 写真の読み込み
    let imgArray: [String] = [
        "c01.png",
        "c02.png",
        "c03.png",
        "c04.png",
        "c05.png",
        "c06.png",
        "c07.png"
    ]
    
    //
    let label2Array: [String] = [
        "2013/8/23 16:04",
        "2013/8/23 16:15",
        "2013/8/23 16:47",
        "2013/8/23 17:10",
        "2013/8/23 17:15",
        "2013/8/23 17:21",
        "2013/8/23 17:33"
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        table.dataSource = self
        table.delegate = self
        
        inputArray()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear")
        
        let appDelegate: AppDelegate = UIApplication.shared().delegate as! AppDelegate
        let id = appDelegate.app_TSK_ID
        
        print(id)
        
        if id != nil {
            getUserData()
        }
        
    }
    
    // 仕事を30件取得
    func getUserData() {
        
        print("仕事を30件取得開始")
        
        let appDelegate: AppDelegate = UIApplication.shared().delegate as! AppDelegate
        let id = appDelegate.app_TSK_ID
        
        //        let requestUrl = "http://api.taskeya.com/mobile?uid='" + id! + "'&am='30'"
        
        let requestUrl = "https://kiyo:kiyokiyo@taskeya.com/mobile/?code=kiyocixo113aks331mxhr76567ejxaaa&func=getjobs&uid=" + id! + "&srt=createdAt&cnt=30"
        
        print(requestUrl)
        
        Alamofire.request(.GET, requestUrl).responseJSON
            {response in
                
                print("response")
                
                guard let object = response.result.value else {
                    print("guard let object = response.result.value else")
                    return
                }
                print("obj:\(object)")
                let json = JSON(object)
                print("json:\(json)")
                
                //                json.forEach { (_, json) in
                //                    let article: [String: String?] = [
                //                        "title": json["title"].string,
                //                        "userId": json["user"]["id"].string,
                //                        "dateString": json["updated_at"].string,
                //                        "imageString": json["user"]["profile_image_url"].string,
                //                        "webUrl": json["url"].string
                //                    ] // 1つの記事を表す辞書型を作る
                //                    self.articles.append(article) // 配列に入れる
                //                    print(article)
                //                }
                
//                json.forEach { (_, json) in
//                    let article: [String: String?] = [
//                        "equester_ID": json["Requester_ID"].string,
//                        "category1": json["Category1"].string,
//                        "category2": json["Category2"].string,
//                        "title": json["Titie"].string,
//                        "detail": json["Detail"].string,
//                        "location": json["Location"].string,
//                        "price": json["Price"].string,
//                        "other": json["Other"].string,
//                        "status": json["Status"].string,
//                        "r_deadline": json["R_Deadline"].string,
//                        "c_deadline": json["C_Deadline"].string,
//                        "opponents": json["Opponents"].string,
//                        "createdAt": json["createdAt"].string,
//                        "updatedAt": json["updatedAt"].string,
//                        "is_Done": json["Is_Done"].string,
//                        "work_ID": json["Work_ID"].string,
//                        "newInfo": json["NewInfo"].string
//                    ]
//                    self.articles.append(article) // 配列に入れる
//                    print(article)
//                }
                
        }
        
        print("取得完了")
        
    }
    
    func inputArray() {
        for i in 0 ..< imgArray.count{
            let date_formatter: DateFormatter = DateFormatter()
            date_formatter.dateFormat = "yyyy/MM/dd HH:mm"
            let changedDate: Date = date_formatter.date(from: label2Array[i])!
            
            let post = Post(userName: "name:No.\(i + 1)",
                            userImage: UIImage(named: imgArray[i])!,
                            titleString: "Title:\(String(imgArray[i]))",
                            lastTime: changedDate
            )
            postArray.append(post)
        }
    }
    
    
    //Table Viewのセルの数を指定
    func tableView(_ table: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imgArray.count
    }
    
    //各セルの要素を設定する
    func tableView(_ table: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // tableCell の ID で UITableViewCell のインスタンスを生成
        let cell = table.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
        
        // Tag番号 1 で UIImageView インスタンスの生成
        let imageView = table.viewWithTag(1) as! UIImageView
        imageView.image = postArray[(indexPath as NSIndexPath).row].userImage
        
        // Tag番号 ２ で UILabel インスタンスの生成
        let label1 = table.viewWithTag(2) as! UILabel
        label1.text = postArray[(indexPath as NSIndexPath).row].userName as String
        //        let color = ColorManager() //インスタンス化
        //        label1.backgroundColor = color.mainColor()
        
        // Tag番号 ３ で UILabel インスタンスの生成
        let label2 = table.viewWithTag(3) as! UILabel
        label2.text = postArray[(indexPath as NSIndexPath).row].titleString
        
        // Tag番号 4 で UILabel インスタンスの生成
        let label4 = table.viewWithTag(4) as! UILabel
        label4.text = String(postArray[(indexPath as NSIndexPath).row].lastTime)
        
        return cell
    }
    
    // Cell が選択された場合
    func tableView(_ table: UITableView, didSelectRowAt indexPath:IndexPath) {
        
        selectedPost = postArray[(indexPath as NSIndexPath).row]
        if selectedPost != nil {
            // SubViewController へ遷移するために Segue を呼び出す
            performSegue(withIdentifier: "toFriendsNeedVC",sender: nil)
        }
        
    }
    
    // Segue 準備
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "toFriendsNeedVC" {
            let nextVC: FriendsNeedViewController = (segue.destinationViewController as? FriendsNeedViewController)!
            // SubViewController のselectedImgに選択された画像を設定する
            //            nextVC.userImage = userImage
            nextVC.post = selectedPost
        }
    }
    
}
