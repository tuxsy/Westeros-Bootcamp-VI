//
//  SeasonListViewController.swift
//  Westeros
//
//  Created by Bruno Anglés Robles on 14/3/18.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import UIKit

protocol SeasonListViewControllerDelegate: class {
    // should, will, did
    func seasonListViewController(_ viewController: SeasonListViewController, didSelectSeason: Season)
}

class SeasonListViewController: UITableViewController {
    
    // MARK: - Properties
    let model: [Season]
    weak var delegate: SeasonListViewControllerDelegate?
    
    // MARK: - Initialization
    init(model: [Season]) {
        self.model = model
        super.init(style: .plain)
        title = "Temporadas"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "SeasonCell"
        
        // Descubrir cual es la temporada que tenemos que mostrar
        let season = model[indexPath.row]
        
        // Crear una celda
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellId)
        }
        
        // Sincroniza season (model) con cell (vista)
        //cell?.textLabel?.text = "\(season.releaseDate.asString()) - \(season.title)"
        cell?.textLabel?.text = season.title
        cell?.detailTextLabel?.text = season.releaseDate.asString()
        
        return cell!
    }

    // MARK: Table View Delegate
    // should, will, did
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Averiguar que temporada han pulsado
        let season = model[indexPath.row]
        
        if UIDevice.current.userInterfaceIdiom == .pad { // Estamos en iPad
            delegate?.seasonListViewController(self, didSelectSeason: season)
            
            sendSeasonChangeNotification(season: season)
            
        } else if UIDevice.current.userInterfaceIdiom == .phone {// Estamos en iPhone
            navigationController?.pushViewController(SeasonDetailViewController(model: season), animated: true)
        }
        
        
    }
    
}
