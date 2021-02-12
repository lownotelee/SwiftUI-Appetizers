//
//  AccountViewModel.swift
//  SwiftUI-Appetizers
//
//  Created by Lee on 15/1/21.
//

import SwiftUI

final class AccountViewModel: ObservableObject {
    /// "user" is the key/identifier
    @AppStorage("user") private var userData: Data?
    @Published var user = User()
    @Published var alertItem: AlertItem?
    
    func saveChanges() {
        /// no error shown here, isValidForm shows the errors
        guard isValidForm else {return}
        
        do {
            let encodedUser = try JSONEncoder().encode(user)
            userData = encodedUser
            alertItem = AlertContext.userSaveSuccess
        } catch {
            alertItem = AlertContext.invalidUserData
        }
    }
    
    
    func retrieveUser() {
        guard let userData = userData else { return }
        
        do {
            user = try JSONDecoder().decode(User.self, from: userData)
        } catch {
            alertItem = AlertContext.invalidUserData
        }
    }
    
    
    var isValidForm: Bool {
        /// checks that the user has entered all required fields
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            alertItem = AlertContext.invalidForm
            return false
        }
        
        /// checks that the email is a valid email and conforms to the regex
        guard user.email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        
        return true
    }    
}
