//
//  SignupNetwork.swift
//  SignupApp
//
//  Created by 김동준 on 2022/03/28.
//

import Foundation

class SignupNetworkModel{
    private let baseURL = "https://api.codesquad.kr/signup"
    var idCheckDelegate: SignupIDNetworkDelegate?
    
    private func checkIDDuplicate(){
        print("hi")
        guard let url = URL(string: baseURL) else { return }
        URLSession(configuration: URLSessionConfiguration.default)
            .dataTask(with: url) { (data, response, error) in
                guard let data = data else { return }
                self.idDecodeIDs(serverIDdata: data)
            }.resume()
    }
    
    private func idDecodeIDs(serverIDdata: Data){
        guard let decodeData = try? JSONDecoder().decode(UserIDs.self, from: serverIDdata) else { return }
        idCheckDelegate?.fetchUserIDs(userIDs: decodeData)
    }
}

extension SignupNetworkModel: NetworkModelUsable{
    func idDuplicateConfirm(id: String) {
        checkIDDuplicate()
    }
}

protocol SignupIDNetworkDelegate{
    func fetchUserIDs(userIDs: UserIDs)
}

typealias UserIDs = [String]

enum NetworkError: Error{
    case decodeError
}
