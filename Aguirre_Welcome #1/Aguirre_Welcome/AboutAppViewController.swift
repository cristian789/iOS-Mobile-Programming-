//
//  AboutAppViewController.swift
//  Aguirre_Welcome
//
//  Created by Cristian Aguirre on 9/20/18.
//  Copyright © 2018 Cristian Aguirre. All rights reserved.
//
//  **************************************************************************
//  This view controller is for the about app part
//  without this view controller you cant connect this to
//  with the info light to the new view which is the about author view
//  **************************************************************************


import UIKit
import MessageUI

class AboutAppViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    @IBAction func sendFeedback(_ sender: Any) {
        
        if !MFMailComposeViewController.canSendMail() {
            print("Mail services are not available")
            return
        }
        else
        {
        
        let mailComposeVC = MFMailComposeViewController()
        
        mailComposeVC.mailComposeDelegate = self
        
        let toRecipients = ["niucsci@gmail.com"]
        
        let emailTitle = "Welcome App Feedback"
        
        let messageBody = "Feedback for Welcome App version 1.0, Fall 2018"
        mailComposeVC.setToRecipients(toRecipients)
        mailComposeVC.setSubject(emailTitle)
        mailComposeVC.setMessageBody(messageBody, isHTML: false)
        self.present(mailComposeVC, animated: true, completion: nil)
        
        //self.dismiss(animated: true, completion: nil)
        }
        
    }
    
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?)
    {
        self.dismiss(animated: true, completion: nil)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

         navigationItem.title = "About App"
        
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
