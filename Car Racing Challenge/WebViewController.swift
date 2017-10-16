//
//  WebViewController.swift
//  Car Racing Challenge
//
//  Created by dennis on 2017/10/9.
//  Copyright © 2017年 Alex Ongarato. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.isStatusBarHidden = true
        self.webView.delegate = self

        // Do any additional setup after loading the view.
    }
    
    var myTimer = Timer()
    
    @IBOutlet weak var myProgressView: UIProgressView!
    
    @IBOutlet weak var webView: UIWebView!
    
    var url: URL = URL.init(string: "https://www.baidu.com")!
    
    var loaded : Bool = false

    @IBOutlet weak var tab: UITabBar!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.webView.loadRequest(URLRequest.init(url: url))
    }
    
    @IBAction func backButtonTap(_ sender: UIBarButtonItem) {
        self.webView.goBack()
    }
    
    @IBAction func forwardButtonTap(_ sender: UIBarButtonItem) {
        self.webView.goForward()
    }
    
    @IBAction func refresh(_ sender: UIBarButtonItem) {
        self.webView.reload()
    }
    
    @IBAction func clear(_ sender: UIBarButtonItem) {
        self.webView.loadRequest(URLRequest.init(url: url))
    }
    //MARK: - progress
    func progressStart() {
        self.myProgressView.isHidden = false
        self.myProgressView.progress = 0.0
        self.loaded = false
        self.myTimer = Timer.scheduledTimer(timeInterval:0.1, target: self, selector: #selector(timerCallback), userInfo: nil, repeats: true)
    }
    
    func progressFinish() {
        self.loaded = true
    }
    
    func timerCallback() {
        if self.loaded {
            if self.myProgressView.progress >= 1 {
                self.myProgressView.isHidden = true
                self.myTimer.invalidate()
            } else {
                self.myProgressView.progress += 0.1
            }
        } else {
            self.myProgressView.progress += 0.05
            if self.myProgressView.progress >= 0.95 {
                self.myProgressView.progress = 0.95
            }
        }
    }
    
    

}

extension WebViewController: UIWebViewDelegate{
    func webViewDidFinishLoad(_ webView: UIWebView) {
        self.progressFinish()
    }
    func webViewDidStartLoad(_ webView: UIWebView) {
        self.progressStart()
    }
}
