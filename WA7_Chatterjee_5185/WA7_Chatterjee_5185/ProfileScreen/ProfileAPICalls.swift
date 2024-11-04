//
//  ProfileAPICalls.swift
//  WA7_Chatterjee_5185
//
//  Created by agni on 11/3/24.
//

import Alamofire

extension ProfileViewController: AuthAPIProtocol {
    func register(name: String, email: String, password: String) {
    }
    
    func logout() {
        if let url = URL(string: APIConfig.authAPIBaseURL + "logout"){
            AF.request(url, method: .get).responseData(completionHandler: { response in
                let status = response.response?.statusCode
                switch response.result{
                case .success:
                    if let uwStatusCode = status{
                        switch uwStatusCode{
                        case 200...299:
                            self.defaults.removeObject(forKey: "accessToken")
                            self.navigationController?.popToRootViewController(animated: true)
                            break
                        case 400...499:
                            // not authenticated
                            // don't do anything
                            break
                        default:
                            break
                        }
                    }
                    break
                case .failure(let error):
                    print(error)
                    break
                }
            })
        }
    }
    
    func login(email: String, password: String) {
    }
    
    func getUserDetails(token: String) {
        if let url = URL(string: APIConfig.authAPIBaseURL + "me"){
            AF.request(url, method: .get, headers: [
                "x-access-token": token
            ]).responseData(completionHandler: { response in
                let status = response.response?.statusCode
                switch response.result{
                case .success(let data):
                    if let uwStatusCode = status{
                        switch uwStatusCode{
                        case 200...299:
                            let decoder = JSONDecoder()
                            do {
                                let userDetails = try decoder.decode(User.self, from: data)
                                self.displayProfileData(user: userDetails)
                            } catch {
                                
                            }
                            break
                        case 400...499:
                            // not authenticated
                            // don't do anything
                            break
                        default:
                            break
                        }
                    }
                    break
                case .failure(let error):
                    print(error)
                    break
                }
            })
        }
    }
}
