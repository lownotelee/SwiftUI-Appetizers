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
    
    static let orderItem1 = Appetizer(id: 1,
                                           name: "some name1",
                                           description: "some description",
                                           price: 12.12,
                                           imageURL: "yea",
                                           calories: 12,
                                           protein: 666,
                                           carbs: 144)
    
    static let orderItem2 = Appetizer(id: 2,
                                           name: "some name2",
                                           description: "some description",
                                           price: 12.12,
                                           imageURL: "yea",
                                           calories: 115,
                                           protein: 515,
                                           carbs: 15666)
    
    static let orderItem3 = Appetizer(id: 3,
                                           name: "some name3",
                                           description: "some description",
                                           price: 12.12,
                                           imageURL: "yeadsasa",
                                           calories: 1555,
                                           protein: 15235,
                                           carbs: 15235)
    
    static let orderItems = [orderItem1, orderItem2, orderItem3]
}
