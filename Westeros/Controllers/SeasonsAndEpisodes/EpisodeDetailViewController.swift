//
//  EpisodeDetailViewController.swift
//  Westeros
//
//  Created by Bruno Anglés Robles on 18/3/18.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import UIKit
import WebKit

class EpisodeDetailViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var episodeTitleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var urlViewer: WKWebView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    // MARK: - Propertiese && Initializer
    var model: Episode
    
    init (model: Episode) {
        self.model = model
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Mark: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingIndicator.isHidden = false
        loadingIndicator.startAnimating()
        urlViewer.navigationDelegate = self
        syncModelWithView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Nos damos de alta de las notificaciones, este método viene de una extensión de UIViewController
        observeNotificationSeasonDidChange(mustRepeat: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Nos damos de baja de las notificaciones, este método viene de una extensión de UIViewController
        removeObserver()
    }
    
    // MARK: - Sync
    func syncModelWithView() {
        episodeTitleLabel.text = model.title
        releaseDateLabel.text = model.releaseDate.asString()
        NSLog("START LOADING \(model.wikiUrl)")
        urlViewer.load(URLRequest(url: model.wikiUrl))
        NSLog("STOP LOADING \(model.wikiUrl)")
    }

}


extension EpisodeDetailViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        loadingIndicator.stopAnimating()
        loadingIndicator.isHidden = true
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        
        let type = navigationAction.navigationType
        switch type {
        case .linkActivated, .formSubmitted:
            decisionHandler(.cancel)
        default:
            decisionHandler(.allow)
        }
    }
}
