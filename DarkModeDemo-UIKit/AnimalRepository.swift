//
//  AnimalRepository.swift
//  SwiftUI-ListDemo
//
//  Created by Russell Archer on 25/06/2019.
//  Copyright © 2019 Russell Archer. All rights reserved.
//
// Updated for Xcode 11 Beta 7
//

import Foundation

class AnimalRepository {
    public var animals = [Animal]()
    
    init() {
        // Create initial test data
        animals.append(Animal(name: "Eagle", description: "Flys", canFly: true))
        animals.append(Animal(name: "Owl", description: "Hoots", canFly: true))
        animals.append(Animal(name: "Parrot", description: "Talks", canFly: true))
        animals.append(Animal(name: "Penguin", description: "Waddles", canFly: false))
        animals.append(Animal(name: "Zebra", description: "Runs", canFly: false))
    }
}

