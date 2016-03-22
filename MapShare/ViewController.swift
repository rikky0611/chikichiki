//
//  ViewController.swift
//  MapShare
//
//  Created by 荒川陸 on 2016/03/21.
//  Copyright © 2016年 riku_arakawa. All rights reserved.
//

//せいやん加入


import UIKit
import CoreLocation
import MapKit
import Firebase

// CLLocationManagerDelegateを継承しなければならない
class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    // 現在地の位置情報の取得にはCLLocationManagerを使用
    var lm: CLLocationManager!
    //Start画面から渡ってくるnameを入れる変数
    var myselfName : String!
    var userNames : [String] = []
    //user
    var myself : User!
    var user1 : User!
    var users : [User]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //自分
        myself = User(name: myselfName)
        setupUsers()
        
        // フィールドの初期化
        lm = CLLocationManager()
        
        // CLLocationManagerをDelegateに指定
        lm.delegate = self
        
        // 位置情報取得の許可を求めるメッセージの表示．必須．
        lm.requestAlwaysAuthorization()
        // 位置情報の精度を指定．任意，
        lm.desiredAccuracy = kCLLocationAccuracyBest
        // 位置情報取得間隔を指定．指定した値（メートル）移動したら位置情報を更新する．任意．
        // lm.distanceFilter = 1000
        
        // GPSの使用を開始する
        lm.startUpdatingLocation()
        
        setupFirebase()
        
    }
    
    //自分以外のuserを配列で管理
    func setupUsers(){
        //配列を初期化
        users.removeAll()
        //相手
        for name in userNames{
            let user = User(name: name)
            users.append(user)
        }

    }
    
    //Firebase設定
    func setupFirebase(){
        let ref = Firebase(url:"https://hem-tutorial-0318.firebaseio.com")
        
        ref.queryLimitedToLast(25).observeEventType(FEventType.ChildAdded, withBlock: { (snapshot) in
            print(snapshot.value!)
            
            //配列に入っているuser全員の座標を更新
            for user in self.users {
                if snapshot.value["name"] as! String == user.name{
                    user.latitude = snapshot.value["latitude"] as! CLLocationDegrees!
                    user.longitude = snapshot.value["longitude"] as! CLLocationDegrees!
                    //相手の位置を更新
                    self.setUserOnMap(user)
                }
            }
        })

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //相手の位置にピンを作成
    func setUserOnMap(user:User){
        // セット済みのピンを削除
        self.mapView.removeAnnotations(self.mapView.annotations)
        //相手の座標を作成
        let toCoordinate = CLLocationCoordinate2D(latitude: user.latitude, longitude: user.longitude)
        
        //ピンを地図にドロップ
        let userAnnotation = MKPointAnnotation()
        userAnnotation.coordinate  = toCoordinate
        userAnnotation.title       = user.name
        self.mapView.addAnnotation(userAnnotation)
    }
    
    
    /* 位置情報取得成功時に実行される関数 */
    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation){
        // 取得した緯度がnewLocation.coordinate.latitudeに格納されている
        myself.latitude = newLocation.coordinate.latitude
        // 取得した経度がnewLocation.coordinate.longitudeに格納されている
        myself.longitude = newLocation.coordinate.longitude
        // 取得した緯度・経度をLogに表示
        NSLog("latiitude: \(myself.latitude) , longitude: \(myself.longitude)")
        
        //Firebaseに送信
        myself.submitLocation()
        
        
        // GPSの使用を停止する．停止しない限りGPSは実行され，指定間隔で更新され続ける．
        // lm.stopUpdatingLocation()
        
        //向きを表示--- あると挙動がうざい ---
        //mapView.setUserTrackingMode(MKUserTrackingMode.FollowWithHeading, animated: true)
        //中心に設定--- あると挙動がうざい ---
        //mapView.setCenterCoordinate(mapView.userLocation.coordinate, animated: false)
        
    }
    
    /* 位置情報取得失敗時に実行される関数 */
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        // この例ではLogにErrorと表示するだけ．
        NSLog("Error")
    }
    
}


