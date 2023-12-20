//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by A on 19/12/2023.
//

import Foundation
import SwiftUI

class AccountViewModel: ObservableObject {
    
    @Published var user = User()
    
    @AppStorage("user") var userData: Data?
    
    var isValidForm: Bool {
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            return false
        }
        guard user.email.isValidEmail else {
            return false
        }
        return true
    }
    
    func saveChanges() {
        guard isValidForm else { return }
        
        do {
            let data = try JSONEncoder().encode(user)
            userData = data
        } catch {
            print("sds")
        }
    }
    
    func retrieveData() {
        guard let userData = userData else {
            return
        }
        
        do {
            user = try JSONDecoder().decode(User.self, from: userData)
            
        } catch {
            print("sdsd")
        }
    }
    
}

