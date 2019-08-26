//
//  Order.swift
//  SwiftUI CoffeeOrderingApp
//
//  Created by Dmitry Novosyolov on 25/08/2019.
//  Copyright © 2019 Dmitry Novosyolov. All rights reserved.
//

import Foundation

struct Order: Codable {
    let name: String
    let size: String
    let coffeeName: String
    let total: Double
}
