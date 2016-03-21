//
//  User.swift
//  MapShare
//
//  Created by 荒川陸 on 2016/03/21.
//  Copyright © 2016年 riku_arakawa. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import CoreLocation

//FirebaseのURL,今は練習用URL
var ref = Firebase(url:"https://hem-tutorial-0318.firebaseio.com")


class User{
    
    var id : Int = 0
    var name : String!
    var latitude : CLLocationDegrees!
    var longitude : CLLocationDegrees!
    
    init(name:String){
        self.name = name
        self.latitude = CLLocationDegrees()
        self.longitude = CLLocationDegrees()
        print("\(name)が作成されました。")
    }
    
    //Firebase上に現在地を送信
    func submitLocation(){
        let post = ["name":name,"latitude":latitude,"longitude":longitude]
        ref.childByAutoId().setValue(post)
    }
    
    
    
}
