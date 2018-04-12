//
//  ViewController.swift
//  UserNotificationTest
//
//  Created by Pavlo Novak on 4/11/18.
//  Copyright © 2018 Pavlo Novak. All rights reserved.
//

// request in viewDidLoad to send notifications
// add trigger, content, request(trigger,content)
// add UNUserNotificationCenter.current().add(request) from above
// call function by action
// in AppDelegate add extension
// in AppDelegate func application add UNUserNotificationCenter.current().delegate = self

import UIKit
// always import UserNotifications
import UserNotifications

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // request to send notifications
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (success, error) in
            if error != nil {
                print("Authorization unsuccesful")
            } else {
                print("Authorization successful")
            }
        }
    }

    @IBAction func notifyPressed(_ sender: Any) {
        
        timedNotifications(inSeconds: 3) { (success) in
            if success {
                print("successfully notified")
            }
        }
    }
    
    func timedNotifications(inSeconds: TimeInterval, completion: @escaping (_ success: Bool) -> ()) {
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: inSeconds, repeats: false)
        let content = UNMutableNotificationContent()
        content.title = "Hello"
        content.subtitle = "World!"
        content.body = "This is my first notification, don't be mad"
        content.sound = UNNotificationSound.default()
        
        let request = UNNotificationRequest(identifier: "customNotification", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { (error) in
            if error != nil {
                completion(false)
            } else {
                completion(true)
            }
        }
    }
}







