//
//  ResetPasswordVC.swift
//  MyInstag
//
//  Created by Mehmet Baykar on 15/09/2019.
//  Copyright © 2019 Mehmet Baykar. All rights reserved.
//

import UIKit
import Parse

class ResetPasswordVC: UIViewController {

    
    @IBOutlet weak var emailTxt: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

   
    @IBAction func resetPasswordPressed(_ sender: UIButton) {
        
        if emailTxt.text?.isEmpty ?? true{
            
        }else{
            
            let userEmail = emailTxt.text!
            
            PFUser.requestPasswordResetForEmail(inBackground: userEmail) { (success, error) in
                
                if success {
                    
                    let alert = UIAlertController(title: "Reset Password", message: "Email has been sent", preferredStyle: .alert)
                    let action = UIAlertAction(title: "OK", style: .default, handler: { (alertAction) in
                        
                        self.dismiss(animated: true, completion: nil)
                    })
                    
                    alert.addAction(action)
                    
                }else{
                    print("Error with reseting the password\(error)")
                }
            }
        }
    }
    
}
