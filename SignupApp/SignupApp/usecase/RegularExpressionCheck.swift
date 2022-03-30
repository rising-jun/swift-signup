//
//  RegularExpressionCheck.swift
//  SignupApp
//
//  Created by 김동준 on 2022/03/28.
//

import Foundation

class RegularExpressionCheck{
    private func isUsableId(id: String) -> IdVerifyState{
        let pattern = "^[a-z0-9_-]{5,20}$"
        let regex = try? NSRegularExpression(pattern: pattern)
        if let _ = regex?.firstMatch(in: id, options: [], range: NSRange(location: 0, length: id.count)) {
            return .usable
        }
        return .unable
    }
    
    private func isUsablePassword(password: String) -> PasswordVerifyState{
        if !isUsablePasswordLength(password: password){
            return .length
        }
        if !isPasswordIncludeUpper(password: password){
            return .upper
        }
        if !isPasswordIncludeNumber(password: password){
            return .number
        }
        if !isPasswordIncludeSpecialCharacter(password: password){
            return .speical
        }
        return .usable
    }
    
    private func isUsablePasswordLength(password: String) -> Bool{
        if password.count >= 8 && password.count <= 16{
            return true
        }
        return false
    }
    
    
    private func isPasswordIncludeUpper(password: String) -> Bool{
        let pattern = "(?=.*[A-Z])"
        let regex = try? NSRegularExpression(pattern: pattern)
        if let _ = regex?.firstMatch(in: password, options: [], range: NSRange(location: 0, length: password.count)) {
            return true
        }
        return false
    }
    
    private func isPasswordIncludeNumber(password: String) -> Bool{
        let pattern = "(?=.*[0-9])"
        let regex = try? NSRegularExpression(pattern: pattern)
        if let _ = regex?.firstMatch(in: password, options: [], range: NSRange(location: 0, length: password.count)) {
            return true
        }
        return false
    }
    
    private func isPasswordIncludeSpecialCharacter(password: String) -> Bool{
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
        return isUsableId(id: id)
    }
    
    func verifyUsablePassword(password: String) -> PasswordVerifyState {
        return isUsablePassword(password: password)
    }
}

enum PasswordVerifyState{
    case length
    case upper
    case number
    case speical
    case usable
}

enum IdVerifyState{
    case usable
    case unable
}
