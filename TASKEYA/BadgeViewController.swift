//
//  BadgeViewController.swift
//  TASKEYA
//
//  Created by 井上航 on 2016/05/05.
//  Copyright © 2016年 Wataru Inoue. All rights reserved.
//

import UIKit

class BadgeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var badgeCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        badgeCollectionView.delegate = self
        badgeCollectionView.dataSource = self
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 各cellに値を設定. セルが表示されるときに呼ばれる処理（1個のセルを描画する毎に呼び出されます
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:CustomCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        
        // Section毎にCellのプロパティを変える.
        //        switch(indexPath.section){
        //        case 0:
        //            cell.backgroundColor = UIColor.redColor()
        //            cell.textLabel?.text = "0"
        //
        //        case 1:
        //            cell.backgroundColor = UIColor.greenColor()
        //            cell.textLabel?.text = "1"
        //
        //        case 2:
        //            cell.backgroundColor = UIColor.blueColor()
        //            cell.textLabel?.text = "2"
        //
        //        default:
        //            println("section error")
        //            cell.backgroundColor = UIColor.whiteColor()
        //        }
        
        cell.lblSample.text = "ラベル\((indexPath as NSIndexPath).row)"
        cell.imgSample.image = UIImage(named: "smile.png")
        return cell
    }
    
    // セクションの数（今回は1つだけです => 3）
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    /*
     表示するCellの総数を返す
     */
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        // Section毎にCellの総数を変える.
        switch(section){
        case 0:
            return 5
            
        case 1:
            return 8
            
        case 2:
            return 20
            
        default:
            print("error")
            return 0
        }
        
    }
    
    /*
     Sectionに値を設定する
     */
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        var header: CustomHeader!
        header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "header", for: indexPath) as! CustomHeader
        
        header.headerLabel.text = "testtesttest"
        header.backgroundColor = UIColor.white()
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize {
        
        let width: CGFloat = badgeCollectionView.frame.width / 3 - 3
        let height: CGFloat = width
        return CGSize(width: width, height: height)
    }

}
