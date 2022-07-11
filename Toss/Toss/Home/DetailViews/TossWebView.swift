//
//  TossWebView.swift
//  Toss
//
//  Created by 이재웅 on 2022/07/12.
//

import UIKit
import WebKit
import SnapKit

class TossWebView: UIViewController {
    private var webView = WKWebView()
    
    private lazy var dismissButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(dismissWebView))
        button.tintColor = .darkGray
        
        return button
    }()
    
    @objc func dismissWebView() {
        self.dismiss(animated: true)
    }
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = dismissButton
        
        let url = URL(string: "https://toss.im/about-free-transfer?is_retargeting=true&af_dp=servicetoss%3A%2F%2Fabout-free-transfer&c=conversion_transfer_performance&af_ad=155014&pid=referral&id=35776992-ec22-4462-b1f3-42c2106b714d&af_adset=transfer_20210906_seokju.me")
        let request = URLRequest(url: url ?? URL(fileURLWithPath: ""))
        webView.load(request)
    }
}
