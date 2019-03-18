//
//  AboutAuthorViewController.swift
//  Aguirre_Welcome
//
//  Created by Cristian Aguirre on 9/20/18.
//  Copyright © 2018 Cristian Aguirre. All rights reserved.
//
//  **************************************************************************
//  This view allows the user and thee main story board get their hands on
//  the html that has all the information of the author without this
//  view controller you cant connect the webview and things just dont work
//  **************************************************************************

import UIKit
import WebKit   //you need this to import all the web stuff

class AboutAuthorViewController: UIViewController {

    //this is the connection for my webview controller
    @IBOutlet weak var WEBVIEW: WKWebView!
    
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        navigationItem.title = "Cristian Aguirre"
        
        
        let path = Bundle.main.path(forResource: "html/index", ofType: "html")!
        let data: Data = try! Data(contentsOf: URL(fileURLWithPath: path))
        let html = NSString(data: data, encoding:String.Encoding.utf8.rawValue)
        
        
        WEBVIEW.loadHTMLString(html! as String, baseURL: Bundle.main.bundleURL)
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
