//
//  RegularExpressionCheck.swift
//  SignupApp
//
//  Created by 김동준 on 2022/03/28.
//

import Foundation

class RegularExpressionCheck{
    private func checkIDVerify(in id: String) -> IdVerifyState{
        let pattern = "^[a-z0-9_-]{5,20}$"
        let regex = try? NSRegularExpression(pattern: pattern)
        if let _ = regex?.firstMatch(in: id, options: [], range: NSRange(location: 0, length: id.count)) {
            return .usable
        }
        return .unable
    }
    
    private func checkPasswordVerify(in password: String) -> PasswordVerifyState{
        if !satisfiedPasswordLength(in: password){
            return .lengthRange
        }
        if !hasUppercase(in: password){
            return .upperInclude
        }
        if !hasNumbercase(in: password){
            return .numberInclude
        }
        if !hasSpecialCharcase(in: password){
            return .speicalCharInclude
        }
        return .usable
    }
    
    private func satisfiedPasswordLength(in password: String) -> Bool{
        if password.count >= 8 && password.count <= 16{
            return true
        }
        return false
    }
    
    
    private func hasUppercase(in password: String) -> Bool{
        let pattern = "(?=.*[A-Z])"
        let regex = try? NSRegularExpression(pattern: pattern)
        if let _ = regex?.firstMatch(in: password, options: [], range: NSRange(location: 0, length: password.count)) {
            return true
        }
        return false
    }
    
    private func hasNumbercase(in password: String) -> Bool{
        let pattern = "(?=.*[0-9])"
        let regex = try? NSRegularExpression(pattern: pattern)
        if let _ = regex?.firstMatch(in: password, options: [], range: NSRange(location: 0, length: password.count)) {
            return true
        }
        return false
    }
    
    private func hasSpecialCharcase(in password: String) -> Bool{
        let pattern = "(?=.*[!@#$])"
        let regex = try? NSRegularExpression(pattern: pattern)
        if let _ = regex?.firstMatch(in: password, options: [], range: NSRange(location: 0, length: password.count)) {
            return true
        }
        return false
    }
}

extension RegularExpressionCheck: RegularExpressionCheckable{
    func verifyUsableId(id: String) -> IdVerifyState {
        return checkIDVerify(in: id)
    }
    
    func verifyUsablePassword(password: String) -> PasswordVerifyState {
        return checkPasswordVerify(in: password)
    }
}

enum PasswordVerifyState{
    case lengthRange
    case upperInclude
    case numberInclude
    case speicalCharInclude
    case usable
}

enum IdVerifyState{
    case usable
    case unable
}
