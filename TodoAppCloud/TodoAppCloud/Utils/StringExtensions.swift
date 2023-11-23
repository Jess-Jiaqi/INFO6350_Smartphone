//
//  StringExtensions.swift
//  TodoAppCloud
//
//  Created by Jiaqi Li on 11/22/23.
//

import Foundation

extension String {
    var isEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
    var isValidPassword: Bool {
        let passwordRegEx = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&<>*~:`-]).{8,}$"
        let passwordPred = NSPredicate(format: "SELF MATCHES %@",passwordRegEx)
        return passwordPred.evaluate(with: self)
    }
}

