//
//  p2sPlayerWebViewController.swift
//  P2S4
//
//  Created by Johnson Liu on 1/25/16.
//  Copyright © 2016 HomeOffice. All rights reserved.
//

import UIKit

class p2sPlayerWebViewController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var titleBarItem: UIBarButtonItem!
    @IBOutlet weak var webView: UIWebView!
    
    var urlLink: String? = ""
    var isTwitterLink: Bool = false
    
    var progressView: UIView? = UIView(frame: CGRectZero)
    
    
    //MARK: - init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //-- logo
        let imageObject: LogoImageObject? = LogoImageObject()
        let logoView: UIImageView = imageObject!.logoView()
        self.titleBarItem!.customView = logoView
        
        self.webView.layer.borderColor = UIColor.blackColor().CGColor
        self.webView.layer.borderWidth = 0.5
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.showActivityIndicator()
        
        if self.isTwitterLink {
            var baseLink: String? = self.urlLink!
            
            let range1 = (baseLink! as NSString).rangeOfString("@")
            if range1.location != NSNotFound {
                baseLink = (baseLink! as NSString).stringByReplacingOccurrencesOfString("@", withString: "")
            }
            
            let range2 = (baseLink! as NSString).rangeOfString("twitter.com/")
            if range2.location == NSNotFound {
                self.urlLink = "https://twitter.com/\(baseLink!)"
            }
            else {
                self.urlLink = "https://\(baseLink!)"
            }
            //print("twitter link : '\(self.urlLink!)' ")
        }
        
        
        var url: NSURL? = NSURL(string: self.urlLink!)!
        let request: NSURLRequest = NSURLRequest(URL: url!)
        self.webView.loadRequest(request)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //MARK: - IB action
    
    @IBAction func close(sender: AnyObject) {
        self.navigationController!.popViewControllerAnimated(true)
    }
    
    
    //MARK: - activity indicator
    
    func showActivityIndicator() {
        
        if self.progressView != nil {
            self.progressView = nil
        }
        let activityObject: ActivityIndicatorObject? = ActivityIndicatorObject()
        self.progressView = activityObject!.activityIndicator()
        
        let width: CGFloat = self.view.frame.size.width
        let height: CGFloat = self.view.frame.size.height
        
        let xPosition: CGFloat = (width - self.progressView!.frame.size.width) / 2.0
        let yPosition: CGFloat = (height - 64.0 - self.progressView!.frame.size.height) / 2.0
        let pWidth: CGFloat = self.progressView!.frame.size.width
        let pHeight: CGFloat = self.progressView!.frame.size.height
        
        self.progressView!.frame = CGRectMake(xPosition, yPosition, pWidth, pHeight)
        self.view.addSubview(self.progressView!)
    }
    
    func hideActivityIndicator() {
        self.progressView!.removeFromSuperview()
        //self.progressView = nil
    }
    
    
    //MARK: - web view delegate
    
    func webViewDidFinishLoad(webView: UIWebView) {
        self.hideActivityIndicator()
    }
    
}
