//
//  ViewController.swift
//  Aguirre_Welcome
//
//  Created by Cristian Aguirre on 9/11/18.
//  Copyright © 2018 Cristian Aguirre. All rights reserved.
//
//  **************************************************************************
//  This view controller is for the main screen it controls the bottons for the
//  class pictures and it guides into the next view which is the
//  about app view
//  **************************************************************************

import UIKit


class ViewController: UIViewController {
    
    //these are the iboulets for the buttons
     @IBOutlet weak var display: UILabel!
    
     @IBOutlet weak var imageView: UIImageView!
     @IBOutlet weak var csci321Button: UIButton!
     @IBOutlet weak var csci521Button: UIButton!
    
    
    
    @IBAction func csci321ButtonPressed(_ sender: UIButton) {
        if (sender.currentTitle! == "CSCI321")
                {
                 sender.backgroundColor = UIColor.black
                    csci321Button.backgroundColor = UIColor.darkGray
                 // Check to see if the current title of the
                 // button is "CSCI321."
                    print("Welcome iOS UNDERGRADUATE students 👋🏼👋🏼👋🏼")
        
                    //to display a welcome message in the lable on the view
                    display.text = "Welcome iOS UNDERGRADUATE students 👋🏼👋🏼"
        
                    //display undergraduate group photo
                    imageView.image = UIImage(named: "students_3xUndergrads.jpg")
                }
    }
   
    
    
    @IBAction func csci521ButtonPressed(_ sender: UIButton) {
        if (sender.currentTitle! == "CSCI521")
                {
                    sender.backgroundColor = UIColor.black
                    csci521Button.backgroundColor = UIColor.darkGray
                    
                    //print on the console
                    print("Welcome iOS GRADUATE students 👋🏼👋🏼👋🏼")
        
                    //display on the label
                    display.text = "Welcome iOS GRADUATE students 👋🏼👋🏼"
        
                    //display grad image
                    imageView.image = UIImage(named: "students_3xGrads.jpg")
    }
        
  
       
    
    
    
  //  @IBAction func touchButton(_ sender: UIButton)
        
//    {
//        if (sender.currentTitle! == "CSCI321")
//        {// Check to see if the current title of the
//         // button is "CSCI321."
//            print("Welcome iOS UNDERGRADUATE students 👋🏼👋🏼👋🏼")
//
//            //to display a welcome message in the lable on the view
//            display.text = "Welcome iOS UNDERGRADUATE students 👋🏼👋🏼"
//
//            //display undergraduate group photo
//            imageView.image = UIImage(named: "students_3xUndergrads.jpg")
//        }
//
//            //check if button pressed is csci521
//        else if (sender.currentTitle! == "CSCI521")
//        {
//            //print on the console
//            print("Welcome iOS GRADUATE students 👋🏼👋🏼👋🏼")
//
//            //display on the label
//            display.text = "Welcome iOS GRADUATE students 👋🏼👋🏼"
//
//            //display grad image
//            imageView.image = UIImage(named: "students_3xGrads.jpg")
//
//        }
    
    //}

//
//    override func viewDidLoad()
//    {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//    }
    
    
    
    
    
    
    
    
    

//    override func didReceiveMemoryWarning()
//    {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }


    }
    
}

 
