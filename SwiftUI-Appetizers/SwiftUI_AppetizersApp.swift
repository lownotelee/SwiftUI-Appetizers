//
//  SwiftUI_AppetizersApp.swift
//  SwiftUI-Appetizers
//
//  Created by Lee on 11/1/21.
//

import SwiftUI

@main
struct SwiftUI_AppetizersApp: App {
    
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environmentObject(order)
        }
    }
}
