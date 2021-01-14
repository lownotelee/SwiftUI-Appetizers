//
//  Appetizer.swift
//  SwiftUI-Appetizers
//
//  Created by Lee on 12/1/21.
//

import Foundation

/// conforming to Decodable rather than Codable because Codable is a typealias for Encodable and Decodable; no Encodable needed
struct Appetizer: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}

struct MockData {
    static let sampleAppetizer = Appetizer(id: 1,
                                           name: "some name",
                                           description: "some description",
                                           price: 12.12,
                                           imageURL: "yea",
                                           calories: 15,
                                           protein: 15,
                                           carbs: 15)
    
    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
}
