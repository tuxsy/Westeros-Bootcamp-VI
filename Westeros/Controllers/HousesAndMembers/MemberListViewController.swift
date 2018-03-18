//
//  MemberListViewController.swift
//  Westeros
//
//  Created by Alexandre Freire on 19/02/2018.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import UIKit

class MemberListViewController: UIViewController {

    // Mark: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // Mark: - Properties
    let model: [Person]
    
    // Mark: - Initialization
    init(model: [Person]) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = "Members"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Mark: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Asignamos la fuente de datos
        tableView.dataSource = self
        
        // Asignamos el delegado
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Nos damos de alta de las notificaciones, este método viene de una extensión de UIViewController
        observeNotificationHouseDidChange(mustRepeat: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Nos damos de baja de las notificaciones, este método viene de una extensión de UIViewController
        removeObserver()
    }
    
    
}

// MARK: - UITableViewDataSource
extension MemberListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "MemberCell"
        
        // Descubrir la persona que tenemos que mostrar
        let person = model[indexPath.row]
        
        // Preguntar por una celda (a una cache) o Crearla
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId)
            ?? UITableViewCell(style: .default, reuseIdentifier: cellId)
        
        // Sicronizar celda y persona
        cell.textLabel?.text = person.fullName
        
        // Devolver la celda
        return cell
    }

}

extension MemberListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let person = self.model[indexPath.row]
        navigationController?.pushViewController(MemberDetailViewController(model: person), animated:true)
    }
}









