//
//  ViewController.swift
//  SignupApp
//
//  Created by 김동준 on 2022/03/28.
//

import UIKit

class SignupViewController: UIViewController {
    
    private var signupManagable: SignManagable?
    
    @IBOutlet weak var idTextField: DebounceableTextField!
    @IBOutlet weak var passwordTextField: DebounceableTextField!
    @IBOutlet weak var passwordCheckTextField: DebounceableTextField!
    @IBOutlet weak var nameTextField: DebounceableTextField!
    
    func injectDependency(signupDependency: SignupDependencyUsable){
        self.signupManagable = signupDependency.getManagable()
    }
    
    private func pullDependency(){
        ComposeDependency.pull(viewController: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pullDependency()
        view.backgroundColor = .systemGray5
        setTextfieldsDelegate()
    }
    
    private func setTextfieldsDelegate(){
        idTextField.setDelegate(inputableDelegate: self as IDInputable, protocolType: IDInputable.self)
        passwordTextField.setDelegate(inputableDelegate: self, protocolType: PasswordInputable.self)
        passwordCheckTextField.setDelegate(inputableDelegate: self, protocolType: PasswordCheckInputable.self)
        nameTextField.setDelegate(inputableDelegate: self, protocolType: NameInputable.self)
    }
}


extension SignupViewController: SignupInputDelegate{
    func editedPasswordTextField(password: String) {
        signupManagable?.verifyPassword(password: password)
    }
    
    func editedPasswordCheckTextField(passwordCheck: String) {
        signupManagable?.verifyPasswordCheck(password: passwordCheck)
    }
    
    func editedNameTextField(name: String) {
        
    }
    
    func editedIdTextField(id: String) {
        signupManagable?.verifyid(id: id)
    }
}
