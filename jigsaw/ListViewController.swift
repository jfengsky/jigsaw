//
//  SecondViewController.swift
//  jigsaw
//
//  Created by jiangfeng on 15/10/9.
//  Copyright © 2015年 jiangfeng. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let tempLabel = UILabel()
        tempLabel.text = "label"
        tempLabel.frame = CGRectMake(10, 10, 200, 200)
        tempLabel.backgroundColor = UIColor.grayColor()
        self.view.addSubview(tempLabel)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
