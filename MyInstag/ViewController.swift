//
//  ViewController.swift
//  MyInstag
//
//  Created by Mehmet Baykar on 14/09/2019.
//  Copyright © 2019 Mehmet Baykar. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let imageView = UIImageView(frame: CGRect(x: self.view.frame.width/2 , y: self.view.frame.height/2, width: 50, height: 50))
        
        
        //Just for fun and test
        
        //Retrieve data
        let image = UIImage(named: "southpark.jpg")!

        let data =  image.jpegData(compressionQuality: 0.5)

        let file = PFFileObject(name: "southpark.jpg", data: data!)

        let newTable = PFObject(className: "newtable")
        newTable["image"] = file
        newTable["firstphotobitches"] = "First Photo"
        newTable.saveInBackground { (success, error) in
            if success {
                print("SAVED")
            }else{
                print("ERROR:\(error)")
            }
        }

        
        //Recieve Object
        
        let information = PFQuery(className: "newtable")
        
        information.findObjectsInBackground { (objects, error) in
            if error == nil
            {
            
            for object in objects! {
                
                let filem = object ["image"] as? PFFileObject
                
                filem?.getDataInBackground(block: { (data, error) in
                    if error == nil{
                        if let imagedata = data {
                            imageView.image = UIImage(data: imagedata)
                            self.view.addSubview(imageView)
                        }
                    }
                })
            }
            
        }
        
    }
}
}
