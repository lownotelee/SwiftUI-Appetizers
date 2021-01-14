//
//  OrderView.swift
//  SwiftUI-Appetizers
//
//  Created by Lee on 11/1/21.
//

import SwiftUI

struct OrderView: View {
    var body: some View {
        NavigationView{
            Text("Order View")
                .navigationTitle("Orders")
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
