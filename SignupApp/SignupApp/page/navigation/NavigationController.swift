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
        let signupStoryboard = UIStoryboard(name: "SignupStoryboard", bundle: nil)
        guard let signupViewController = signupStoryboard.instantiateViewController(withIdentifier: "SignupViewController") as? SignupViewController else { return }
        signupViewController.setNavigationController(navigation: self)
        pushViewController(signupViewController, animated: true)
    }
    
    private func presentPersonalDataInputViewController(){
        let signupStoryboard = UIStoryboard(name: "PersonalDataInputStoryboard", bundle: nil)
        guard let personalDataInputViewController = signupStoryboard.instantiateViewController(withIdentifier: "PersonalDataInputViewController") as? PersonalDataInputViewController else { return }
        pushViewController(personalDataInputViewController, animated: true)
    }
    
}

extension NavigationController: NavigationPushable{
    func pushPersonalDataInputViewController() {
        presentPersonalDataInputViewController()
    }
}
