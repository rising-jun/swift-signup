//
//  SignupExpressionCheckable.swift
//  SignupApp
//
//  Created by 김동준 on 2022/03/28.
//

import Foundation

protocol RegularExpressionCheckable: SignupExpressionCheckable{
    
}

protocol SignupExpressionCheckable{
    func verifyUsableId(id: String) -> IdVerifyState
    func verifyUsablePassword(password: String) -> PasswordVerifyState
}
