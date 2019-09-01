//
//  Animal.swift
//  SwiftUI-ListDemo
//
//  Created by Russell Archer on 21/06/2019.
//  Copyright © 2019 Russell Archer. All rights reserved.
//
// Updated for Xcode 11 Beta 6
//

import Foundation

struct Animal: Identifiable {
    var id = UUID()
    var name: String
    var description: String
    var imageName: String { return name }
    var thumbName: String { return name + "Thumb" }
}

