//
//  AppDependency.swift
//  SignupApp
//
//  Created by 김동준 on 2022/03/30.
//

import Foundation
import UIKit

struct ComposeDependency{
    static func pull(viewController: UIViewController){
        if let signupViewController = viewController as? SignupViewController{
            signupViewController.injectDependency(signupDependency: SignupDependency(signManager: SignupManager(signupNetworkUsable: SignupNetworkModel(), signupExpressionCheckable: RegularExpressionCheck())))
        }
        
        if let personalDataInputViewController  = viewController as? PersonalDataInputViewController{
            
        }
        
    }
}
