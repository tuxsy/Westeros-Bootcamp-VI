//
//  EpisodeListViewController.swift
//  Westeros
//
//  Created by Bruno Anglés Robles on 18/3/18.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import UIKit

class EpisodeListViewController: UITableViewController {
        
    // MARK: - Properties
    let model: [Episode]
    
    // MARK: - Initialization
    init (model: [Episode]) {
        self.model = model
        super.init(style: .plain)
        
        self.title = "Episodios"
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
        let cellId = "EpisodeCell"
        
        // Descubrir cual es el episodio que tenemos que mostrar
        let episode = model[indexPath.row]
        
        // Crear una celda
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellId)
        }
        
        // Sincroniza season (model) con cell (vista)
        //cell?.textLabel?.text = "\(season.releaseDate.asString()) - \(season.title)"
        cell?.textLabel?.text = episode.title
        cell?.detailTextLabel?.text = episode.releaseDate.asString()
        
        return cell!
    }
    
    // MARK: - Navigation
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let episode = model[indexPath.row]
        navigationController?.pushViewController(EpisodeDetailViewController(model: episode), animated: true)
    }
    
    // Mark: - Life Cycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Nos damos de alta de las notificaciones, este método viene de una extensión de UIViewController
        observeNotificationSeasonDidChange(mustRepeat: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Nos damos de baja de las notificaciones, este método viene de una extensión de UIViewController
        removeObserver()
    }
    
}
