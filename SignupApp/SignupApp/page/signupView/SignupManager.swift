//
//  SignupManager.swift
//  SignupApp
//
//  Created by 김동준 on 2022/03/28.
//

import Foundation
protocol SignManagable{
    func setNetworkUsable(networkUsable: SignupNetworkUsable)
    func verifyid(string: String)
    func verifyPassword(string: String)
    func verifyPasswordCheck(string: String)
}

class SignupManager{
    private var networkUsable: SignupNetworkUsable?
    // state 관리 struct
    // pattern match!
    
}

extension SignupManager: SignManagable{
    func verifyid(string: String) {
        
    }
    
    func verifyPassword(string: String) {
        
    }
    
    func verifyPasswordCheck(string: String) {
        
    }
    
    func setNetworkUsable(networkUsable: SignupNetworkUsable){
        self.networkUsable = networkUsable
    }
}
