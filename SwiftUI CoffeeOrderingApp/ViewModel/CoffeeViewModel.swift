//
//  CoffeeViewModel.swift
//  SwiftUI CoffeeOrderingApp
//
//  Created by Dmitry Novosyolov on 26/08/2019.
//  Copyright © 2019 Dmitry Novosyolov. All rights reserved.
//

import Foundation

class CoffeeListViewModel {
    var orderList = [OrderViewModel]()
}

struct CoffeeViewModel {
    var coffee: Coffee
    
    init(coffee: Coffee) { self.coffee = coffee }
    
    var name: String { return self.coffee.name }
    var imageURL: String { return self.coffee.imageURL }
    var price: Double { return self.coffee.price }
}
