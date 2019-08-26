//
//  OrderTotalView.swift
//  SwiftUI CoffeeOrderingApp
//
//  Created by Dmitry Novosyolov on 26/08/2019.
//  Copyright © 2019 Dmitry Novosyolov. All rights reserved.
//

import SwiftUI

struct OrderTotalView: View {
    
    let total: Double
    
    var body: some View {
        HStack {
            Spacer()
            Divider()
            Text(String(format: "$%.2f", self.total)).font(.title)
                .foregroundColor(Color.init(.cyan))
                .shadow(color: Color.init(.link), radius: 2)
            Divider()
            Spacer()
        }
    }
}

struct OrderTotalView_Previews: PreviewProvider {
    static var previews: some View {
        OrderTotalView(total: 45.67)
    }
}
