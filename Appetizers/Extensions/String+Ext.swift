//
//  String+Ext.swift
//  Appetizers
//
//  Created by A on 19/12/2023.
//

import Foundation

extension String {
    
    var isValidEmail: Bool {
        let emailFormat = NSLocalizedString("[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}", comment: "")
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: self)
    }
}
