//
//  SignManagable.swift
//  SignupApp
//
//  Created by 김동준 on 2022/03/28.
//

import Foundation

protocol SignManagable: SignVerifyable, SignNameInputable{
    
}

protocol SignVerifyable{
    func verifyid(id: String)
    func verifyPassword(password: String)
    func verifyPasswordCheck(password: String)
}

protocol SignNameInputable{
    func isNilName(name: String)
}
