//
//  SignupTextFieldDelegate.swift
//  SignupApp
//
//  Created by 김동준 on 2022/03/28.
//

import Foundation

protocol SignupTextFieldDelegate{
    func editedIdTextField(id: String)
    func editedPasswordTextField(password: String)
    func editedPasswordCheckTextField(passwordCheck: String)
    func editedNameTextField(name: String)
}
