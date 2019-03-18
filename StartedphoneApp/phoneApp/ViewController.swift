//
//  ViewController.swift
//  phoneApp
//
//  Created by Cristian Aguirre on 10/2/18.
//  Copyright © 2018 Cristian Aguirre. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func phoneNum(_ sender: Any)
    {
        //get phone# from button title
        guard let phoneNum = (sender as AnyObject).titleLabel??.text       //xcode 10(sender as AnyObject).titleLabel?.text
            else {return}
        
        //create as url string w/ require protocol
        
      //  "tel ://"
        
        let myURL:NSURL = URL(string: "tel://\(phoneNum)")! as NSURL
        
        //make a call
        
        UIApplication.shared .open(myURL as URL, options: [:], completionHandler: nil)
        //UIApplication.shared open(myURL as URL, option:[:], CompletitionHandler: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

