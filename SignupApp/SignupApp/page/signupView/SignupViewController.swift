//
//  ViewController.swift
//  SignupApp
//
//  Created by 김동준 on 2022/03/28.
//

import UIKit

class SignupViewController: UIViewController {
    
    private var navigation: SingupNavigationUsable?

    func setNavigationController(navigation: SingupNavigationUsable){
        self.navigation = navigation
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }
}

