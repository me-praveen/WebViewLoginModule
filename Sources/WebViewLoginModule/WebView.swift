//
//  File.swift
//  
//
//  Created by T, Praveen on 10/06/21.
//

import Foundation
import WebKit
import CoreData



public class WebViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {
    
    //    @IBOutlet weak var webView2: WKWebView!
    //    var pdfData: NSData!
    //    var templateName: String!
    //    var templateId: String!
    //    var context:NSManagedObjectContext!
    //    var sellSheetID: String!
    //    public let name: String!
    //    var templa: NSObject!
    //    var url: URL!
    //    var webView = WKWebView()
    //
    //    var template = ["Email","Preview","Print"]
    
    
    //    public override func viewDidLoad() {
    //        print("sdf")
    //    }
    //    required init?(coder: NSCoder) {
    //        fatalError("init(coder:) has not been implemented")
    //    }
    
    //    public init(pdfData: NSData?,templateName: String?,templateId: String?,context: NSManagedObjectContext?,sellSheetID: String?,name: String?,tmplate:NSObject?,url: URL?) {
    //        self.pdfData = pdfData
    //        self.templateName = templateName
    //        self.templateId = templateId
    //        self.context = context
    //        self.sellSheetID = sellSheetID
    //        self.name = name
    //        self.templa = tmplate
    //        self.url = url
    //
    //        super.init(nibName: nil, bundle: nil)
    //
    //    }
    
    
    //
    //    public func downloadAndViewPDFWithParameters() -> WKWebView? {
    //        guard let url = url else {
    //            return webView
    //        }
    //        //Call Network Modules Mehods
    //        webView.load(URLRequest(url: url))
    //
    //        return webView
    //    }
    //
    //
    //    func showpdf() -> UIViewController? {
    //        UIViewController()
    //     }
    
    
    
    public var webView: WKWebView!
    public var pdfData: String!
    public var responseURL: String!
    
    open override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        webView.navigationDelegate = self
        view = webView
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
//        configureAutoLayouts()
    }
    
    public func loadLoginScreen(url: String?)  {
        
        let myURL = URL(string:url!)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
    
    func configureAutoLayouts() {
        self.webView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive =  true
        self.webView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive =  true
        self.webView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive =  true
        self.webView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive =  true
        self.webView.heightAnchor.constraint(equalTo: self.view.heightAnchor, constant: 0).isActive =  true
        self.webView.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: 0).isActive =  true
        
    }
    
    
    public func webView(_ webView: WKWebView,
                        decidePolicyFor navigationResponse: WKNavigationResponse,
                        decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        self.responseURL = navigationResponse.response.url?.absoluteString
        decisionHandler(WKNavigationResponsePolicy.allow)
    }
    
    
    @available(iOS 13.0, *)
    public func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, preferences: WKWebpagePreferences, decisionHandler: @escaping (WKNavigationActionPolicy, WKWebpagePreferences) -> Void) {
        let urlString = navigationAction.request.url?.absoluteString
        if urlString!.contains("https://mylan-publisher.devweb01.fingertipformulary.com") {
            print("Yes")
//            loginChecker.getTok(withParameters: [AnyHashable : Any]?, success: <#T##(Any?, String?, String?) -> Void#>, failure: <#T##() -> Void#>)
        } else if urlString!.contains("https://test-authentication.decisionresourcesgroup.com/login/home/noaccess") {
        } else {
            
        }
        print("print")
        decisionHandler(WKNavigationActionPolicy.allow, WKWebpagePreferences())
    }
    
    
}


