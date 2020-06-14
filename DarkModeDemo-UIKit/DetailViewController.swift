//
//  DetailViewController.swift
//  DarkModeDemo-UIKit
//
//  Created by Russell Archer on 01/09/2019.
//  Copyright © 2019 Russell Archer. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var animalImageView: UIImageView!
    @IBOutlet weak var animalName: UILabel!
    @IBOutlet weak var animalDescription: UILabel!
    
    public var selectedAnimal: Animal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard selectedAnimal != nil else { return }
        
        animalName.text = selectedAnimal!.name
        animalDescription.text = selectedAnimal!.description
        animalImageView.image = UIImage(named: selectedAnimal!.imageName)
        
        displayAllSubviews(for: self.view)
    }
    
    func displayAllSubviews(for view: UIView) {
        view.subviews.forEach { subview in
            print(subview.debugDescription)
            displayAllSubviews(for: subview)
        }
    }
}
