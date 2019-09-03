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

    // MARK: Programmatically detect display mode change (not required in this demo)
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        switch traitCollection.userInterfaceStyle {
            case .dark: darkModeEnabled()   // Switch to dark mode colors, etc.
            case .light: fallthrough
            case .unspecified: fallthrough
            default: lightModeEnabled()   // Switch to light mode colors, etc.
        }
    }

    private func lightModeEnabled() {}
    private func darkModeEnabled() {}
    
    // MARK: Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataStore.animals.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "animalCell", for: indexPath) as! AnimalCell

        let selectedAnimal = dataStore.animals[indexPath.row]
        
        /*
         
         Use colors that adapt to the display mode rather than static colors.
         
         cell.colorTabView.backgroundColor = selectedAnimal.canFly ? UIColor.red : UIColor.blue
         
         */
        
        // The colors adaptiveRed and adaptiveBlue are defined in the asset catalogue
        cell.colorTabView.backgroundColor = UIColor(named: selectedAnimal.canFly ? "adaptiveRed" : "adaptiveBlue")
        cell.animalName.text = selectedAnimal.name
        
        cell.animalDescription.text = selectedAnimal.description
        cell.animalDescription.textColor = UIColor.secondaryLabel  // Use new iOS System Colors like this rather than a static color
        
        // thumbName is the name of an adaptive image in the asset catalog
        cell.animalImageView.image = UIImage(named: selectedAnimal.thumbName)
        
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
