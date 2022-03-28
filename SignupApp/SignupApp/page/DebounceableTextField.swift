//
//  DebounceableTextField.swift
//  SignupApp
//
//  Created by 김동준 on 2022/03/28.
//

import Foundation
import UIKit

class DebounceableTextField: UITextField{
    private var signupTextFieldDelegate: SignupTextFieldDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        debounce(delay: 0.5)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        debounce(delay: 0.5)
    }
    
    func setDelegate(signupTextFieldDelegate: SignupTextFieldDelegate?){
        self.signupTextFieldDelegate = signupTextFieldDelegate
    }
    
    deinit {
        self.removeTarget(self, action: #selector(self.editingChanged(_:)), for: .editingChanged)
    }
    
    private var workItem: DispatchWorkItem?
    private var delay: Double = 0
    private var callback: ((String?) -> Void)? = nil
    
    func debounce(delay: Double) {
        self.delay = delay
        self.addTarget(self, action: #selector(self.editingChanged(_:)), for: .editingChanged)
    }
    
    @objc private func editingChanged(_ sender: UITextField) {
        self.workItem?.cancel()
        let workItem = DispatchWorkItem(block: { [weak self] in
            guard let self = self else { return }
            guard let text = sender.text else { return }
            guard let textFieldId = sender.restorationIdentifier else { return }
            print("textFieldId \(textFieldId)")
            switch textFieldId{
            case "idTextField":
                self.signupTextFieldDelegate?.editedIdTextField(id: text)
            case "passwordTextField":
                self.signupTextFieldDelegate?.editedPasswordTextField(password: text)
            case "passwordCheckTextField":
                self.signupTextFieldDelegate?.editedPasswordCheckTextField(passwordCheck: text)
            case "nameTextField":
                self.signupTextFieldDelegate?.editedNameTextField(name: text)
            default: break
            }
        })
        self.workItem = workItem
        DispatchQueue.main.asyncAfter(deadline: .now() + self.delay, execute: workItem)
    }
}
