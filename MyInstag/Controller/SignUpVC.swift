//
//  SignUpVC.swift
//  MyInstag
//
//  Created by Mehmet Baykar on 14/09/2019.
//  Copyright © 2019 Mehmet Baykar. All rights reserved.
//

import UIKit
import Parse

class SignUpVC: UIViewController {
    
    //outlets
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var repeatPasswordTxt: UITextField!
    @IBOutlet weak var webAddressTxt: UITextField!
    @IBOutlet weak var biografyTxt: UITextField!
    @IBOutlet weak var fullNameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    
    
    //variables
    var profileImage: UIImage? =  nil
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        setTapGesture()
        
        setHideKeyBoardFunction()
       

        
    }
    
    func setHideKeyBoardFunction() {
        
        self.hideKeyboardWhenTappedAround()
        
    }
    
    
    func setTapGesture()  {
        //tapGestureFor UIImageview
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(loadImage))
        profileImageView.addGestureRecognizer(tapGesture)
        
    }
    
    //seletorForTapGesture
    
    ///call picker to select an image
   @objc func loadImage() {
    
    let picker              = UIImagePickerController()
    picker.delegate         = self
    picker.sourceType       = .photoLibrary
    picker.allowsEditing    = true
    
    present(picker,animated: true,completion: nil)
        
    }

    
    
    

    @IBAction func signUpClicked(_ sender: Any) {
        
        
        if  userNameTxt.text?.isEmpty ?? true || passwordTxt.text?.isEmpty ?? true || repeatPasswordTxt.text?.isEmpty ?? true || webAddressTxt.text?.isEmpty ?? true || biografyTxt.text?.isEmpty ?? true || fullNameTxt.text?.isEmpty ?? true
            {
                print("Fill all the shits")
        }else{
            
            if passwordTxt.text == repeatPasswordTxt.text {
                
                
                if profileImage != nil {
                    
                    let userName = userNameTxt.text?.lowercased()
                    let password = passwordTxt.text
                    let fullName = fullNameTxt.text?.lowercased()
                    let bio      = biografyTxt.text
                    let webAddress = webAddressTxt.text?.lowercased()
                    let useremail  = emailTxt.text?.lowercased()
                    
                    //creeate a user
                    
                    let user        = PFUser()
                    user.username   = userName
                    user.email      = useremail
                    user.password   = password
                    user["fullName"] = fullName
                    user["bio"]     = bio
                    user["web"]     = webAddress
                    
                    
                    //in the editprofile its gonna be assigned
                    user["tel"]     = ""
                    user["gender"]  = ""
                    
                    
                    user.signUpInBackground { (success, error) in
                        
                        
                        //create the image data
                        
                        
                        let profileImageData    = (self.profileImage?.jpegData(compressionQuality: 0.5))!
                        
                        
                        let profileImageFile    = PFFileObject(name: "\(String(describing: userName))_profileImage", data: profileImageData)
                        user["profileImage"]    = profileImageFile
                        
                        
                        if success {
                            
                            //saveuserToLocal
                            UserDefaults.standard.set(user.username, forKey: USER_NAME_DEFAULTS)
                            UserDefaults.standard.synchronize()
                            
                            let appdelegate = UIApplication.shared.delegate as! AppDelegate
                            appdelegate.logIn()
                            
                            
                            print("SignUp Succeed")
                            
                        }else{
                            print("Error in Signing Up the user:\(String(describing: error))")
                        }
                    }
                }else{
                    print("choose a photo")
                }
            }
    
            else{
                
                print("Enter same password")
                
            }
            
        }
        
        
       
    
        
        
        
    }
    @IBAction func cancelClicked(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}





extension SignUpVC: UIImagePickerControllerDelegate , UINavigationControllerDelegate{
    //get the image
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        profileImage = (info[UIImagePickerController.InfoKey.editedImage] as? UIImage)
        
        
        if profileImage != nil {
            profileImageView.image = profileImage
        }
        
        dismiss(animated: true, completion: nil)
        
        
    }
    
}
