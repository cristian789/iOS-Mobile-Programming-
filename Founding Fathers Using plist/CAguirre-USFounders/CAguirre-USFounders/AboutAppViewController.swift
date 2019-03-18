//
//  AboutAuthorViewController.swift
//  
//
//  Created by Cristian Aguirre on 10/4/18.
//
////  This view controller handles the interaction when the
//  info light button is pressed from the ParksTableViewController.

import UIKit

class AboutAppViewController: UIViewController {

    // This function dismisses the view when the "Done" button
    // on the navigation bar is pressed.
    @IBAction func doneButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        
    }
    
    // As the view loads, place the view title on the view.
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "About App"
        
    }
    
//    @IBAction func AboutAuthorButton(_ sender: UIButton) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//
//        let destinationVC = storyboard.instantiateViewController(withIdentifier: "AuthorViewController") as! AuthorViewController
//        self.navigationController?.pushViewController(destinationVC, animated: true)
//
    }
    

    
    


//    override func viewDidLoad() {
//        super.viewDidLoad()
//       // navigationItem.title = "About App"
//
//        // Do any additional setup after loading the view.
//    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

//}
