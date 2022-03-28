//
//  NavigationPushable.swift
//  SignupApp
//
//  Created by 김동준 on 2022/03/28.
//

import Foundation
import UIKit

protocol NavigationPushable: UINavigationController, SignupNavigationUsable{
    
}

protocol SignupNavigationUsable{
    func pushPersonalDataInputViewController()
}
