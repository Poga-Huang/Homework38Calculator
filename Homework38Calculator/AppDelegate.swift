//
//  AppDelegate.swift
//  Homework38Calculator
//
//  Created by 黃柏嘉 on 2021/12/9.
//

import UIKit
extension UIView{
    func addGradientlayer(view:UIView){
        let grdientLayer = CAGradientLayer()
        let pinkColor = UIColor(red: 255/255, green: 235/255, blue: 244/255, alpha: 1)
        let whiteColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        let blueColor = UIColor(red: 209/255, green: 233/255, blue: 255/255, alpha: 1)
        grdientLayer.frame = view.frame
        grdientLayer.colors = [pinkColor.cgColor,whiteColor.cgColor,blueColor.cgColor]
        grdientLayer.locations = [0,0.4,0.7,1]
        view.layer.insertSublayer(grdientLayer, at: 0)
    }
    func makeCircleButton(view:UIView){
        view.layer.cornerRadius = view.frame.width/2
        view.clipsToBounds = true
    }
}

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

