//
//  LogInVC.swift
//  MyInstag
//
//  Created by Mehmet Baykar on 14/09/2019.
//  Copyright © 2019 Mehmet Baykar. All rights reserved.
//

import UIKit
import Parse

class LogInVC: UIViewController {
    
    @IBOutlet weak var userNameTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setHideKeyBoardFunction()
       
    }
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    func setHideKeyBoardFunction() {
        
        self.hideKeyboardWhenTappedAround()
        
    }
    
    
    
    @IBAction func signInPressed(_ sender: UIButton) {
        
        if userNameTxt.text?.isEmpty ?? true || passwordTxt.text?.isEmpty ?? true {
            
            
        }else{
            
            let userName        = userNameTxt.text!
            let userPassword    = passwordTxt.text!
            
            PFUser.logInWithUsername(inBackground:userName , password: userPassword) { (user, error) in
                
                if error == nil{
                    
                    //save user
                    UserDefaults.standard.set(user?.username!, forKey: USER_NAME_DEFAULTS)
                    
                    //show Tabbar
                    let appDelegate = UIApplication.shared.delegate as! AppDelegate
                    appDelegate.logIn()
                    
                }
                else{
                    print("Error with signing in:\(error.debugDescription)")
                }
                
            }
        }
    }
}
