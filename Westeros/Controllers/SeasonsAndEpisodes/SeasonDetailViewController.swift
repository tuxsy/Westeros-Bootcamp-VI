//
//  SeasonDetailViewController.swift
//  Westeros
//
//  Created by Bruno Anglés Robles on 17/3/18.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import UIKit

class SeasonDetailViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var seasonNameLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var numberOfEpisodesLabel: UILabel!
    
    // MARK: - Properties
    var model: Season
    
    // MARK: - Initialization
    init(model: Season) {
        self.model = model
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Mark: - Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
        syncModelWithView()
    }
    
    // MARK: - Sync
    func syncModelWithView() {
        seasonNameLabel.text = model.title
        releaseDateLabel.text = model.releaseDate.asString()
        numberOfEpisodesLabel.text = "\(model.count)"
    }
    
    // MARK: - Set UI
    func setupUI () {
        
    }
    
}


// MARK: - SeasonListViewControllerDelegate
extension SeasonDetailViewController: SeasonListViewControllerDelegate {
    func seasonListViewController(_ viewController: SeasonListViewController, didSelectSeason season: Season) {
        self.model = season
        syncModelWithView()
    }
    
    
}
