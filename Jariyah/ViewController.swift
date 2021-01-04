//
//  ViewController.swift
//  Jariyah
//
//  Created by Jay on 12/28/20.
//

import UIKit
import GoogleSignIn

class ViewController: UIViewController, GIDSignInDelegate {
    
    
    @IBOutlet weak var FbButton: UIButton!
    
    @IBOutlet weak var LoginButton: UIButton!
    
    @IBOutlet weak var GoogleButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FbButton.layer.cornerRadius = 35.0
        FbButton.clipsToBounds = true
        GoogleButton.layer.cornerRadius = 35.0
        GoogleButton.clipsToBounds = true
        LoginButton.layer.cornerRadius = 15.0
        LoginButton.clipsToBounds = true
        
        GIDSignIn.sharedInstance()?.delegate = self
        
    }

    @IBAction func GoogleButton(_ sender: Any) {
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.signIn()
        
    }
    
    @IBAction func FbButton(_ sender: Any) {
        guard let main = storyboard?.instantiateViewController(identifier: "MainScreen") as? MainScreenViewController else {
            return
        }
        
        present(main, animated: true)
        
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        
        if error != nil {
            print(user.userID)
        }
    }

}

