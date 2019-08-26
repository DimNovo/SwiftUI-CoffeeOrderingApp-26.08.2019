//
//  OrderListView.swift
//  SwiftUI CoffeeOrderingApp
//
//  Created by Dmitry Novosyolov on 25/08/2019.
//  Copyright © 2019 Dmitry Novosyolov. All rights reserved.
//

import SwiftUI

struct OrderListView: View {
    let orders: [OrderViewModel]
    init(orders: [OrderViewModel]) { self.orders = orders }
    var body: some View {
        List {
            ForEach(orders, id: \.id) { order in
                VStack {
                    HStack(alignment: .top, spacing: 20) {
                        Image(order.coffeeName)
                            .resizable()
                            .frame(width: 100, height: 100)
                            .clipShape(Rectangle())
                            .cornerRadius(15)
                            .shadow(color: .pink, radius: 3)
                        VStack(alignment: .leading) {
                            HStack(alignment: .firstTextBaseline) {
                                Text("Order for:")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                Text(order.name)
                                    .font(.headline)
                                    .lineLimit(nil)
                            }
                            HStack(alignment: .firstTextBaseline) {
                                Text(order.coffeeName)
                                    .padding(EdgeInsets(top: 3, leading: 5, bottom: 3, trailing: 5))
                                Text(order.size)
                                    .padding(EdgeInsets(top: 3, leading: 5, bottom: 3, trailing: 5))
                                    .background(Color.blue)
                            }.font(.headline)
                                .background(Color.gray)
                                .cornerRadius(8)
                                .shadow(color: .pink, radius: 3)
                                .foregroundColor(Color.init(.tertiarySystemGroupedBackground))
                        }
                        VStack(alignment: .center, spacing: 10) {
                            Text("Total")
                                .foregroundColor(.secondary)
                                .font(.subheadline)
                            Text(String(format: "$%.2f", order.total)).font(.headline)
                                .foregroundColor(Color.init(.cyan))
                                .shadow(color: Color.init(.link), radius: 2)
                        }
                    }
                    Text("Order ID: \(order.id)")
                        .font(.custom("", size: 10))
                        .foregroundColor(.secondary)
                }
            }
        }
    }
}

struct OrderListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            OrderListView(
                orders: [
                    OrderViewModel(
                        order:
                        Order(
                            name: "Mary",
                            size: "Medium",
                            coffeeName: "Espresso",
                            total: 3.0
                        )
                    )
                ]
            )
        }.colorScheme(.dark)
    }
}
