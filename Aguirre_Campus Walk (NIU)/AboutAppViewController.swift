//
//  AboutAppViewController.swift
//  Campus Walk
//
//  Created by Cristian Aguirre on 11/28/18.
//  Copyright © 2018 Cristian Aguirre. All rights reserved.
//

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
        
        let emailTitle = "Campus Walk Feedback"
        
        let messageBody = "Feedback for Campus Walk version 1.2, Fall 2018"
        mailComposeVC.setToRecipients(toRecipients)
        mailComposeVC.setSubject(emailTitle)
        mailComposeVC.setMessageBody(messageBody, isHTML: false)
        self.present(mailComposeVC, animated: true, completion: nil)
        
        //self.dismiss(animated: true, completion: nil)
        }
    }
    
    //function to go back (dismiss) to the view after cancelled emailed or sent
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?)
    {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


}
