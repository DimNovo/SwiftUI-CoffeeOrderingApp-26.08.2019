//
//  Coffee.swift
//  SwiftUI CoffeeOrderingApp
//
//  Created by Dmitry Novosyolov on 25/08/2019.
//  Copyright © 2019 Dmitry Novosyolov. All rights reserved.
//

import Foundation

struct Coffee {
    let name: String
    let imageURL: String
    let price: Double
}

extension Coffee {
    
    static func all() -> [Coffee] {
        [
        Coffee(name: "Capuccino", imageURL: "Capuccino", price: 2.5),
        Coffee(name: "Espresso", imageURL: "Espresso", price: 2.1),
        Coffee(name: "Regular", imageURL: "Regular", price: 1.0)
        ]
    }
}
