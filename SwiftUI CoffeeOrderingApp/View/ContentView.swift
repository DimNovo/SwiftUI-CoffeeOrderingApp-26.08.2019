//
//  ContentView.swift
//  SwiftUI CoffeeOrderingApp
//
//  Created by Dmitry Novosyolov on 25/08/2019.
//  Copyright © 2019 Dmitry Novosyolov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var orderListVM = OrderListViewModel()
    @State private var showModal = false
    var body: some View {
        NavigationView{
            OrderListView(orders: self.orderListVM.orders)
            .navigationBarTitle("Coffee Orders")
                .navigationBarItems(leading: Button(action: reloadOrders)
                { Image(systemName: "arrow.clockwise")},
                                    trailing: Button(action: showAddCoffeeView)
                                    { Image(systemName: "plus")})
                .sheet(isPresented: self.$showModal) { AddCoffeeOrderView(showModal: self.$showModal)}
        }
    }
    private func reloadOrders() {
        self.orderListVM.fetchOrders()
    }
    private func showAddCoffeeView() {
        self.showModal = true
        self.orderListVM.fetchOrders()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .colorScheme(.dark)
    }
}
