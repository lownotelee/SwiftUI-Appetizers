//
//  AppetizerListView.swift
//  SwiftUI-Appetizers
//
//  Created by Lee on 11/1/21.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var viewModel = AppetizerListViewModel()
    
    
    var body: some View {
        NavigationView{
            List(viewModel.appetizers) { appetizer in
                AppetizerListCell(appetizer: appetizer)
            }
                .navigationTitle("Appetizers")
        }
        .onAppear {
            viewModel.getAppetizers()
        }
    }
}

struct AppetizerListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListView()
    }
}
