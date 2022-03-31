//
//  SignupManager.swift
//  SignupApp
//
//  Created by 김동준 on 2022/03/28.
//

import Foundation


class SignupManager{
    private let signupNetworkUsable: SignupNetworkUsable
    private let regularExpressionCheck: SignupExpressionCheckable
    
    init(signupNetworkUsable: SignupNetworkUsable, signupExpressionCheckable :SignupExpressionCheckable){
        self.signupNetworkUsable = signupNetworkUsable
        self.regularExpressionCheck = signupExpressionCheckable
    }
    
    private func verifyUsableId(id: String){
       regularExpressionCheck.verifyUsableId(id: id)
    }
    
    private func verifyUsablePassword(password: String){
       regularExpressionCheck.verifyUsablePassword(password: password)
    }
}

extension SignupManager: SignManagable{
    func isNilName(name: String) {
        
    }
    
    func verifyid(id: String) {
        verifyUsableId(id: id)
    }
    
    func verifyPassword(password: String) {
        verifyUsablePassword(password: password)
    }
    
    func verifyPasswordCheck(password: String) {
        
    }
    
}
