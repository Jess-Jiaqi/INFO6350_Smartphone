//
//  StringExtensions.swift
//  LoginApp
//
//  Created by Jiaqi Li on 11/4/23.
//

import Foundation

extension String {
    var isEmail: Bool {
        let emailRegEx = ""
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
    
    var isValidPassword: Bool {
        let passwordRegEx = ""
        let password
    }
}
