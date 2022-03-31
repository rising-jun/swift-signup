//
//  NavigationController.swift
//  SignupApp
//
//  Created by 김동준 on 2022/03/28.
//

import Foundation
import UIKit

class NavigationController: UINavigationController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presentSignupViewController()
    }
    
    private func presentSignupViewController(){
        let signupStoryboard = UIStoryboard(name: "SignupStoryboard", bundle: Bundle(for: SignupViewController.self))
        guard let signupViewController = signupStoryboard.instantiateViewController(withIdentifier: "SignupViewController") as? SignupViewController else { return }
        pushViewController(signupViewController, animated: true)
    }
    
}
