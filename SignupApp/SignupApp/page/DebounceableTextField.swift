//
//  DebounceableTextField.swift
//  SignupApp
//
//  Created by 김동준 on 2022/03/28.
//

import Foundation
import UIKit

class DebounceableTextField: UITextField{
    private var inputableDelegate: InputableDelegate?
    private var protocolType: Any.Type?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        debounce(delay: 0.5)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        debounce(delay: 0.5)
    }
    
    func setDelegate(inputableDelegate: InputableDelegate, protocolType: Any){
        self.protocolType = protocolType as? Any.Type
        self.inputableDelegate = inputableDelegate
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
            
            guard let protocolType = self.protocolType else { return }
            if protocolType == IDInputable.self{
                let inputableDelegate = self.inputableDelegate as? IDInputable
                inputableDelegate?.editedIdTextField(id: text)
            }
            
            if protocolType == PasswordInputable.self{
                let inputableDelegate = self.inputableDelegate as? PasswordInputable
                inputableDelegate?.editedPasswordTextField(password: text)
            }
            
            if protocolType == PasswordCheckInputable.self{
                let inputableDelegate = self.inputableDelegate as? PasswordCheckInputable
                inputableDelegate?.editedPasswordCheckTextField(passwordCheck: text)
            }
            
            if protocolType == NameInputable.self{
                let inputableDelegate = self.inputableDelegate as? NameInputable
                inputableDelegate?.editedNameTextField(name: text)
            }
        })
        self.workItem = workItem
        DispatchQueue.main.asyncAfter(deadline: .now() + self.delay, execute: workItem)
    }
}
