//
//  ContentView.swift
//  SwiftUI CoffeeOrderingApp
//
//  Created by Dmitry Novosyolov on 25/08/2019.
//  Copyright © 2019 Dmitry Novosyolov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var showModal = false
    var body: some View {
        NavigationView{
            OrderListView()
                .navigationBarTitle("Coffee Orders")
                .navigationBarItems(trailing: Button(action: showAddCoffeeView)
                { Image(systemName: "plus.square.fill.on.square.fill")
                    .font(.title)
                    .shadow(radius: 3)})
                .sheet(isPresented: self.$showModal) { AddCoffeeOrderView(showModal: self.$showModal)}
        }
    }
    private func showAddCoffeeView() {
        self.showModal = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .colorScheme(.dark)
    }
}
