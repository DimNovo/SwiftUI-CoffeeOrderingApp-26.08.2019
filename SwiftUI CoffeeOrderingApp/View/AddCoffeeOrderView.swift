//
//  AddCoffeeOrderView.swift
//  SwiftUI CoffeeOrderingApp
//
//  Created by Dmitry Novosyolov on 26/08/2019.
//  Copyright © 2019 Dmitry Novosyolov. All rights reserved.
//

import SwiftUI

struct AddCoffeeOrderView: View {
    @ObservedObject private var addCoffeeOrderVM = AddCoffeeOrderViewModel()
    @Binding var showModal: Bool
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("YOUR INFORMATION").font(.body)) {
                        TextField("Enter name", text: self.$addCoffeeOrderVM.name) {}
                    }
                    Section(header: Text("PLEASE SELECT YOUR COFFEE").font(.body)) {
                        ForEach(addCoffeeOrderVM.coffeeList, id: \.name) { coffee in
                            CoffeeCellView(coffee: coffee, selection: self.$addCoffeeOrderVM.coffeeName)
                        }
                    }
                    Section(header: Text("PLEASE SELECT COFFEE SIZE").font(.body), footer: OrderTotalView(total: self.addCoffeeOrderVM.total)) {
                        Picker(selection: self.$addCoffeeOrderVM.size, label: Text("")) {
                            Text("Small").tag("Small")
                            Text("Medium").tag("Medium")
                            Text("Large").tag("Large")
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                }
                HStack {
                    Button("Place Order") {
                        guard
                            !self.addCoffeeOrderVM.name.isEmpty,
                            !self.addCoffeeOrderVM.coffeeName.isEmpty
                            else { return }
                        self.addCoffeeOrderVM.placeOrder()
                        self.showModal = false
                    }
                }.font(.title)
                    .foregroundColor(Color.init(.lightGray))
                    .padding(EdgeInsets(top: 10, leading: 100, bottom: 10, trailing: 100))
                    .background(Color.init(.tertiarySystemBackground))
                    .cornerRadius(10)
                    .shadow(color: .pink, radius: 5)
            }
            .navigationBarTitle("Add Order", displayMode: .inline)
        }
    }
}

struct CoffeeCellView: View {
    let coffee: CoffeeViewModel
    @Binding var selection: String
    var body: some View {
        HStack {
            Image(coffee.imageURL)
                .resizable()
                .frame(maxWidth: 150, maxHeight: 130)
                .shadow(color: (self.selection == self.coffee.name) ? .pink : .clear, radius: 5)
            Text(coffee.name)
                .foregroundColor(Color.init(.systemGray))
                .font(.title)
                .padding()
            Spacer()
            Image(systemName: "checkmark")
                .resizable()
                .foregroundColor((self.selection == self.coffee.name) ? .gray : .clear)
                .frame(width: 25, height: 25)
                .shadow(color: (self.selection == self.coffee.name) ? .pink : .clear, radius: 5)
        }.onTapGesture { self.selection = self.coffee.name }
    }
}

struct AddCoffeeOrderView_Previews: PreviewProvider {
    static var previews: some View {
        AddCoffeeOrderView(showModal: .constant(false))
            .colorScheme(.dark)
    }
}
