//
//  ViewController.swift
//  ParseSDK
//
//  Created by KBryan on 2015-11-10.
//  Copyright © 2015 KBryan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var myLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        /// creates a default parse user.
        self.myMethod()
        let demoObject = PFObject(className: "Data")
        print("\(demoObject)")
        
        /// Step 1: set up data object and keyvalue
        //        demoObject.setObject("Data", forKey: "MyFirstValue")
        //        do {
        //            try demoObject.save()
        //        } catch {
        //            print("Error")
        //        }
        
        let query = PFQuery(className:"Data")
        query.getObjectInBackgroundWithId("oxdOI90j4r") {
            (gameScore: PFObject?, error: NSError?) -> Void in
            if error == nil && gameScore != nil {
                if let firstValue = gameScore!["MyFirstValue"] as? String {
                    self.myLabel.text = firstValue
                    print("\(firstValue)")
                }

            } else {
                print(error)
            }
        }
    }
    func myMethod() {
        let user = PFUser()
        user.username = "Kwame"
        user.password = "123456"
        user.email = "email@example.com"
        // other fields can be set just like with PFObject
        user["phone"] = "415-392-0202"
        
        user.signUpInBackgroundWithBlock {
            (succeeded: Bool, error: NSError?) -> Void in
            if let error = error {
                let errorString = error.userInfo["error"] as? NSString
                print("\(errorString)")
                // Show the errorString somewhere and let the user try again.
            } else {
                // Hooray! Let them use the app now.
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

