//
//  User.swift
//  SwiftUI-Appetizers
//
//  Created by Lee on 15/1/21.
//

import Foundation

struct User: Codable {
    var firstName        = ""
    var lastName         = ""
    var email            = ""
    var birthdate        = Date()
    var extraNapkins     = false
    var frequentRefills  = false
}
