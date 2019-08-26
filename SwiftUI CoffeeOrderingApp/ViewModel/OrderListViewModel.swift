//
//  OrderListViewModel.swift
//  SwiftUI CoffeeOrderingApp
//
//  Created by Dmitry Novosyolov on 25/08/2019.
//  Copyright © 2019 Dmitry Novosyolov. All rights reserved.
//

import Foundation

class OrderListViewModel: ObservableObject {
    
   @Published var orders = [OrderViewModel]()
    
    init() { fetchOrders()}
    
    func fetchOrders() {
        NetService().getAllOrders { orders in
            if let orders = orders {
                self.orders = orders.map(OrderViewModel.init)
            }
        }
    }
}

class OrderViewModel {
    
    let id = UUID()
    
    var order: Order
    
    init(order: Order) { self.order = order }
    
    var coffeeName: String { return self.order.coffeeName }
    var name: String { return self.order.name }
    var size: String { return self.order.size }
    var total: Double { return self.order.total }
}
