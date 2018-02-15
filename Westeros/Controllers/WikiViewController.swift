//
//  WikiViewController.swift
//  Westeros
//
//  Created by Alexandre Freire on 15/02/2018.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import UIKit
import WebKit

class WikiViewController: UIViewController {
    
    // Mark: - Outlets
    @IBOutlet weak var webView: WKWebView!
    
    // Mark: - Properties
    let model: House
    
    // Mark: - Initialization
    init(model: House) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    // chapuza
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Mark: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        syncModelWithView()
    }
    
    // MARK: - Sync
    func syncModelWithView() {
        title = model.name
        webView.load(URLRequest(url: model.wikiURL))
    }
}
















