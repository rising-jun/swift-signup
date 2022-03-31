//
//  SignupDependency.swift
//  SignupApp
//
//  Created by 김동준 on 2022/03/31.
//

import Foundation

struct SignupDependency{
    let signManager: SignupManager
}

extension SignupDependency: SignupDependencyUsable{
    func getManagable() -> SignManagable {
        return signManager
    }
}
