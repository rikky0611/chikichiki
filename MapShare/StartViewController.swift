//
//  StartViewController.swift
//  MapShare
//
//  Created by 荒川陸 on 2016/03/21.
//  Copyright © 2016年 riku_arakawa. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    
    @IBOutlet var textField : UITextField!
    @IBOutlet var textField2 : UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func toNext(){
        performSegueWithIdentifier("toNext", sender: nil)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let nextVC = segue.destinationViewController as! ViewController
        nextVC.myselfName = textField.text
        nextVC.userNames.append(textField2.text!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
