//
//  ColorManager.swift
//  MapShare
//
//  Created by 荒川陸 on 2016/03/21.
//  Copyright © 2016年 riku_arakawa. All rights reserved.


import UIKit
import Foundation

class BtnAnimation: AnyObject {

    func animateButton(button: UIButton){
    //ボタンを動かす
    button.transform = CGAffineTransformMakeScale(0.8, 0.8)
    UIView.animateWithDuration(2.0,
        delay: 0,
        usingSpringWithDamping: 0.2,
        initialSpringVelocity: 4.0,
        options: UIViewAnimationOptions.AllowUserInteraction,
        animations: {
            button.transform = CGAffineTransformIdentity
        }, completion: nil)
    }
}