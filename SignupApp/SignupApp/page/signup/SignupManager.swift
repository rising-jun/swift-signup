//
//  SignupManager.swift
//  SignupApp
//
//  Created by 김동준 on 2022/03/28.
//

import Foundation


class SignupManager{
    private let networkUsable: SignupNetworkUsable
    private let regularExpressionCheck: SignupExpressionCheckable
    // state struct 생성해야함
    
    init(networkUsable: SignupNetworkUsable, signupExpressionCheckable :SignupExpressionCheckable){
        self.networkUsable = networkUsable
        self.regularExpressionCheck = signupExpressionCheckable
    }
    
    private func verifyUsableId(id: String){
       regularExpressionCheck.verifyUsableId(id: id)
        //networkmodel에서 id 중복체크 해야함
        //state에 결과 저장해야함
    }
    
    private func verifyUsablePassword(password: String){
        //state에 결과 저장해야함
        print(regularExpressionCheck.verifyUsablePassword(password: password))
    }
}

extension SignupManager: SignManagable{
    func isNilName(name: String) {
        //사용자 정보에 저장해야함
    }
    
    func verifyid(id: String) {
        verifyUsableId(id: id)
    }
    
    func verifyPassword(password: String) {
        verifyUsablePassword(password: password)
    }
    
    func verifyPasswordCheck(password: String) {
        // password와 비교 로직 작성해야함.
    }
    
}
