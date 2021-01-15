//
//  APButton.swift
//  SwiftUI-Appetizers
//
//  Created by Lee on 15/1/21.
//

import SwiftUI

struct APButton: View {
    
    var title: String
    
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .background(Color.brandPrimary)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}

struct APButton_Previews: PreviewProvider {
    static var previews: some View {
        APButton(title: "Learn More")
    }
}
