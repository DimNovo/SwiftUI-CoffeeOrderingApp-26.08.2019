//
//  AddCoffeeOrderViewModel.swift
//  SwiftUI CoffeeOrderingApp
//
//  Created by Dmitry Novosyolov on 26/08/2019.
//  Copyright © 2019 Dmitry Novosyolov. All rights reserved.
//

import Foundation

class AddCoffeeOrderViewModel: ObservableObject {
    
    var name = ""
    @Published var size = "Medium"
    @Published var coffeeName = ""
    
    var coffeeList: [CoffeeViewModel] { return Coffee.all().map(CoffeeViewModel.init)}
    
    var total: Double { return calculateTotalPrice()}
    
    private var netService: NetService
    init() { self.netService = NetService()}
    
    private func priseForSize() -> Double {
        let prices = ["Small": 2.0, "Medium": 3.0, "Large": 4.0]
        return prices[self.size]!
    }
    
    private func calculateTotalPrice() -> Double {
        let coffeeVM = coffeeList.first { $0.name == coffeeName }
        if let coffeeVM = coffeeVM {
            return coffeeVM.price * priseForSize()
        } else {
            return 0.0
        }
    }
    
    func placeOrder() {
        
        let order = Order(
            name: self.name,
            size: self.size,
            coffeeName: self.coffeeName,
            total: self.total
        )
        self.netService.createCoffeeOrder(order: order) { _ in
            // some action after create order
        }
    }
}
