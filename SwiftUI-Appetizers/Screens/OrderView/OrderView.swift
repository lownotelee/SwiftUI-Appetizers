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
            Text("Account View")
                .navigationTitle("Account")
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
