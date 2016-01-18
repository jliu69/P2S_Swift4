//
//  p2sPlayerSignUpViewController.swift
//  P2S4
//
//  Created by Johnson Liu on 1/16/16.
//  Copyright © 2016 HomeOffice. All rights reserved.
//

import UIKit

class p2sPlayerSignUpViewController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var titleBarItem: UIBarButtonItem!
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //MARK: - init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //-- logo
        let imageObject: LogoImageObject? = LogoImageObject()
        let logoView: UIImageView = imageObject!.logoView()
        self.titleBarItem!.customView = logoView
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.activityIndicator.startAnimating()
        self.view.bringSubviewToFront(self.activityIndicator)
        
        let url = NSURL(string: JsonLinks.quickRegisterLink())
        let request = NSURLRequest(URL: url!)
        self.webView.loadRequest(request)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - IB actions
    
    @IBAction func closeAction(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: {})
    }
    
    //MARK: - web view delegate
    
    func webViewDidFinishLoad(webView: UIWebView) {
        self.activityIndicator.stopAnimating()
        self.view.sendSubviewToBack(self.activityIndicator)
    }
}
