//
//  TableViewController.swift
//  DarkModeDemo-UIKit
//
//  Created by Russell Archer on 31/08/2019.
//  Copyright © 2019 Russell Archer. All rights reserved.
//

import Foundation
import UIKit

class TableViewController: UITableViewController {
    var dataStore = AnimalRepository()

    // MARK: Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataStore.animals.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "animalCell", for: indexPath) as! AnimalCell

        cell.animalName.text = dataStore.animals[indexPath.row].name
        cell.animalDescription.text = dataStore.animals[indexPath.row].description
        cell.animalImageView.image = UIImage(named: dataStore.animals[indexPath.row].thumbName)
        
        return cell
    }

    // MARK: Navigation
    
    @IBSegueAction func segueToDetailsViewController(_ coder: NSCoder) -> DetailViewController? {
        guard tableView.indexPathForSelectedRow != nil else { return nil }
        guard let dvc = DetailViewController(coder: coder) else { return nil }

        let selectedRow = tableView.indexPathForSelectedRow!.row
        dvc.selectedAnimal = dataStore.animals[selectedRow]
        
        return dvc
    }
}
