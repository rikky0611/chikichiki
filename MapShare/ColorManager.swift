//
//  ColorManager.swift
//  MapShare
//
//  Created by 荒川陸 on 2016/03/21.
//  Copyright © 2016年 riku_arakawa. All rights reserved.


import UIKit

class ColorManager: UIColor {
    

    //メインカラー
    class func EnWordColor_Main() -> UIColor {
        return UIColor(red: 52.0 / 255.0, green: 205.0  / 255.0, blue: 182.0 / 255.0, alpha: 1.0) //Green
    }
    
    //ダークグレイ
    class func EnWordColor_Gray_Dark() -> UIColor {
        return UIColor(red: 132.0 / 255.0, green: 132.0 / 255.0, blue: 132.0 / 255.0, alpha: 1.0)
    }
    
    //ライトグレイ
    class func EnWordColor_Gray_Light() -> UIColor {
        return UIColor(red: 232.0 / 255.0, green: 232.0 / 255.0, blue: 232.0 / 255.0, alpha: 1.0)
    }
    //イエロー
    class func EnWordColor_Yellow() -> UIColor {
        return UIColor(red: 254.0 / 255.0, green: 250.0 / 255.0, blue: 50.0 / 255.0, alpha: 1.0)
    }
    
    class func buttonColor_blue() -> UIColor {
        return UIColor(red: 12.0 / 255.0, green: 95.0 / 255.0, blue: 250.0 / 255.0, alpha: 1.0)
    }
    
   
    class func lightGray_D() -> UIColor {
        return UIColor(red: 232.0 / 255.0, green: 232.0 / 255.0, blue: 232.0 / 255.0, alpha: 1.0)
    }

    class func EnWordColorWithImageView(imageView: UIImageView) -> UIImageView {
        imageView.image = imageView.image!.imageWithRenderingMode(.AlwaysTemplate)
        imageView.tintColor = ColorManager.EnWordColor_Main()
        return imageView
    }
    
    
}