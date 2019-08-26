//
//  NetService.swift
//  SwiftUI CoffeeOrderingApp
//
//  Created by Dmitry Novosyolov on 25/08/2019.
//  Copyright © 2019 Dmitry Novosyolov. All rights reserved.
//

import Foundation

class NetService {
    
    func createCoffeeOrder(order: Order, completion: @escaping (CreateOrderResponse?) -> Void) {
        
        guard let url = URL(string: "https://island-bramble.glitch.me/orders")  else { fatalError("Invalid URL!")}
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(order)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data, error == nil else { DispatchQueue.main.async { completion(nil)}; return }
            
            let createOrderResponse = try? JSONDecoder().decode(CreateOrderResponse.self, from: data)
            DispatchQueue.main.async { completion(createOrderResponse)}
        }.resume()
    }
    
    func getAllOrders(completion: @escaping ([Order]?) -> Void) {
        
        guard let url = URL(string: "https://island-bramble.glitch.me/orders") else { DispatchQueue.main.async { completion(nil)}; return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else { fatalError("Can't decode data!")}
            
            let orders = try? JSONDecoder().decode([Order].self, from: data)
            DispatchQueue.main.async { completion(orders)}
        }.resume()
    }
}
