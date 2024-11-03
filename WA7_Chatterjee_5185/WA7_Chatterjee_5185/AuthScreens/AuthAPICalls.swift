//
//  AuthAPICalls.swift
//  WA7_Chatterjee_5185
//
//  Created by agni on 11/3/24.
//

import Alamofire

extension LoginViewController: AuthAPIProtocol {
    func register(_ newUser: User) {
    }
    
    func login(email: String, password: String) {
        if let url = URL(string: APIConfig.authAPIBaseURL + "login"){
            AF.request(url, method: .post, parameters: [
                "email": email,
                "password": password,
            ]).responseData(completionHandler: { response in
                let status = response.response?.statusCode
                switch response.result{
                case .success(let data):
                    if let uwStatusCode = status{
                        switch uwStatusCode{
                        case 200...299:
                            let decoder = JSONDecoder()
                            do {
                                let receivedData = try decoder.decode(LoginAPIResponse.self, from: data)
                                self.defaults.set("accessToken", forKey: receivedData.token)
                                let notesViewController = NotesViewController()
                                self.navigationController?.pushViewController(notesViewController, animated: true)
                            } catch {
                                
                            }
                            break
                        case 400...499:
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
    
    func getUserDetails(token: String) {
         
    }
}

extension RegistratonViewController: AuthAPIProtocol {
    func register(_ newUser: User) {
        if let url = URL(string: APIConfig.authAPIBaseURL + "register"){
            AF.request(url, method: .post, parameters: [
                "name": newUser.name,
                "email": newUser.email,
                "password": newUser.password,
            ]).responseData(completionHandler: { response in
                let status = response.response?.statusCode
                switch response.result{
                case .success(let data):
                    if let uwStatusCode = status{
                        switch uwStatusCode{
                        case 200...299:
                            let decoder = JSONDecoder()
                            do {
                                let receivedData = try decoder.decode(RegisterAPIResponse.self, from: data)
                                self.defaults.set("accessToken", forKey: receivedData.token)
                                let notesViewController = NotesViewController()
                                self.navigationController?.pushViewController(notesViewController, animated: true)
                            } catch {
                                print("error decoding response")
                            }
                            break
                        case 400...499:
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
    
    func getUserDetails(token: String){
        if let url = URL(string: APIConfig.authAPIBaseURL + "me"){
            AF.request(url, method: .post, headers: [
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
                                let receivedData = try decoder.decode(User.self, from: data)
                                let notesViewController = NotesViewController()
                                self.navigationController?.pushViewController(notesViewController, animated: true)
                            } catch {
                                print("error decoding response")
                            }
                            break
                        case 400...499:
                            // unauth
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
