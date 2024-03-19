//
//  BikeKeeperApp.swift
//  BikeKeeper
//
//  Created by Sai Srikar on 2/28/24.
//

import SwiftUI

@main
struct BikeKeeperApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            IntroPage()
        }
    }
}
class AppDelegate: NSObject, UIApplicationDelegate {
         
    static var orientationLock = UIInterfaceOrientationMask.all //By default you want all your views to rotate freely
 
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return AppDelegate.orientationLock
    }
}
