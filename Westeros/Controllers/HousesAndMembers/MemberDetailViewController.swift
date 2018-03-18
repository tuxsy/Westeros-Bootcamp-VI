//
//  MemberDetailViewController.swift
//  Westeros
//
//  Created by Bruno Anglés Robles on 18/3/18.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import UIKit

class MemberDetailViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var memberNameLabel: UILabel!
    @IBOutlet weak var memberAliasLabel: UILabel!
    
    
    // MARK: - Model and Initialization
    var model: Person
    
    init (model: Person) {
        self.model = model
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Mark: - Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        syncModelWithView()
        // Nos damos de alta de las notificaciones, este método viene de una extensión de UIViewController
        observeNotificationHouseDidChange(mustRepeat: true)
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Nos damos de baja de las notificaciones, este método viene de una extensión de UIViewController
        removeObserver()
    }
    
    // Mark: - Sync
    func syncModelWithView() {
        // Model -> View
        title = model.name
        memberNameLabel.text = model.name
        memberAliasLabel.text = model.alias
    }
    
}
