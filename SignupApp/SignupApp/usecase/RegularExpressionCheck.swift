//
//  RegularExpressionCheck.swift
//  SignupApp
//
//  Created by 김동준 on 2022/03/28.
//

import Foundation

class RegularExpressionCheck{
    private func isUsableId(id: String) -> IdVerifyState{
        //isUsableId(id: id) ? (return .usable) : (return .unable)
        return .unable
    }
    
    private func isUsablePassword(password: String) -> PasswordVerifyState{
        if !isUsablePasswordLength(password: password){
            return .length
        }
        if !isPasswordIncludeNumber(password: password){
            return .number
        }
        if !isPasswordIncludeSpecialCharacter(password: password){
            return .speical
        }
        if !isPasswordIncludeUpper(password: password){
            return .upper
        }
        return .usable
    }
    
    private func isUsablePasswordLength(password: String) -> Bool{
        return false
    }
    
    private func isPasswordIncludeUpper(password: String) -> Bool{
        return false
    }
    
    private func isPasswordIncludeNumber(password: String) -> Bool{
        return false
    }
    
    private func isPasswordIncludeSpecialCharacter(password: String) -> Bool{
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
