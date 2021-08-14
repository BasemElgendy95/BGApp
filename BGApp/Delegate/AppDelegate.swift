//
//  AppDelegate.swift
//  BGApp
//
//  Created by BasemElgendy on 10/08/2021.
//

import UIKit
import IQKeyboardManagerSwift
import WLEmptyState

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        emptyStateConfig()
        keyboardManagerConfig()
        localizationConfig()
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

    fileprivate func keyboardManagerConfig() {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.previousNextDisplayMode = .alwaysHide
        IQKeyboardManager.shared.enableAutoToolbar = true
    }
    
    fileprivate func emptyStateConfig() {
        WLEmptyState.configure()
    }

    fileprivate func localizationConfig() {
        EasyLocalization.config(
                   locale: .en,
                   languageDictionary: [
                       .ar : arabicDic,
                       .en : englishDic,
                       ]
        )
    }
}

// MARK: UNUserNotificationCenterDelegate

extension AppDelegate : UNUserNotificationCenterDelegate {
    
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
      print("Unable to register for remote notifications: \(error.localizedDescription)")
    }

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
       // Messaging.messaging().apnsToken = deviceToken
       // Messaging.messaging().token { token, error in
       //     print("APNs token retrieved: \(token ?? "")")
       //     UserDefaults.standard.set("\(token ?? "")", forKey: "FCM")
       // }
        
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        let userInfo = notification.request.content.userInfo
        print("Message: \(userInfo)")
        
        // opened app
        
        notificationsActionWhileOpened(userInfo)
        
        // Change this to your preferred presentation option
        completionHandler([])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo
        // Print message ID.
        
        print("Message ID: \(userInfo)")
        
        // closed app
        
        notificationsActionFromClosed(userInfo)
        completionHandler()
    }
    
    func notificationsActionFromClosed(_ userInfo: [AnyHashable : Any]){
       
    }
    
    func notificationsActionWhileOpened(_ userInfo: [AnyHashable : Any]){
       
    }
    
    
}
