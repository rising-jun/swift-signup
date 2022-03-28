//
//  ViewController.swift
//  SignupApp
//
//  Created by 김동준 on 2022/03/28.
//

import UIKit

class SignupViewController: UIViewController {
    
    private var navigation: SignupNavigationUsable?
    private var signupManagable: SignManagable?
    
    @IBOutlet weak var idTextField: DebounceableTextField!
    @IBOutlet weak var passwordTextField: DebounceableTextField!
    @IBOutlet weak var passwordCheckTextField: DebounceableTextField!
    @IBOutlet weak var nameTextField: DebounceableTextField!
    
    func setNavigationController(navigation: SignupNavigationUsable){
        self.navigation = navigation
    }
    
    func setSignManagable(signupManagable: SignManagable){
        self.signupManagable = signupManagable
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        setTextfieldsDelegate()
    }
    
    private func setTextfieldsDelegate(){
        idTextField.setDelegate(signupTextFieldDelegate: self)
        passwordTextField.setDelegate(signupTextFieldDelegate: self)
        passwordCheckTextField.setDelegate(signupTextFieldDelegate: self)
        nameTextField.setDelegate(signupTextFieldDelegate: self)
    }
}


extension SignupViewController: SignupTextFieldDelegate{
    func editedPasswordTextField(password: String) {
        signupManagable?.verifyPassword(password: password)
    }
    
    func editedPasswordCheckTextField(passwordCheck: String) {
        signupManagable?.verifyPasswordCheck(password: passwordCheck)
    }
    
    func editedNameTextField(name: String) {
        //이름이 변경됐을때 로직 = state에 저장해야함.
    }
    
    func editedIdTextField(id: String) {
        signupManagable?.verifyid(id: id)
    }
}
