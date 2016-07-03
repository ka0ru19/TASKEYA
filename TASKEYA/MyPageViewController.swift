//
//  MyPageViewController.swift
//  TASKEYA
//
//  Created by 井上航 on 2016/05/05.
//  Copyright © 2016年 Wataru Inoue. All rights reserved.
//

import UIKit

class MyPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func btn(_ sender: UIButton) {
        performSegue(withIdentifier: "toLoginVC",sender: nil)
        
    }
    
    // Segue 準備
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "toLoginVC" {
            print("success")
        }
    }

    
}
