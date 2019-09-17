//
//  AuthorViewController.swift
//  Campus Walk
//
//  Created by Cristian Aguirre on 11/27/18.
//  Copyright © 2018 Cristian Aguirre. All rights reserved.
//

import UIKit
import WebKit

class AuthorViewController: UIViewController {
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Cristian Aguirre"
        /* Create a path to fetch the content/data of the index.html file located in
         the project app bundle. */
        
        //these lets are to connnect the html folder with the author view controller
        let path = Bundle.main.path(forResource: "html/index", ofType: "html")!
        let data: Data = try! Data(contentsOf: URL(fileURLWithPath: path))
        let html = NSString(data: data, encoding:String.Encoding.utf8.rawValue)
        // Load the content of the index.html file onto the webView
        webView.loadHTMLString(html! as String, baseURL: Bundle.main.bundleURL)        // Do any additional setup after loading the view.
        // Do any additional setup after loading the view.
    }
    
    //        override func didReceiveMemoryWarning() {
    //            super.didReceiveMemoryWarning()
    //            // Dispose of any resources that can be recreated.
    //        }
    //
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
