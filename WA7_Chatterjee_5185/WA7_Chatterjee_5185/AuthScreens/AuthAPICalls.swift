//
//  AuthAPICalls.swift
//  WA7_Chatterjee_5185
//
//  Created by agni on 11/3/24.
//

import Alamofire

extension LoginViewController: AuthAPIProtocol {
    func register(name: String, email: String, password: String) {
    }
    
    func logout() {
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
                                self.defaults.set(receivedData.token, forKey: "accessToken")
                                self.resetFields()
                                let notesViewController = NotesViewController()
                                self.navigationController?.pushViewController(notesViewController, animated: true)
                            } catch {
                                
                            }
                            break
                        case 400...499:
                            let decoder = JSONDecoder()
                            do {
                                let receivedData = try decoder.decode(LoginAPIResponse.self, from: data)
                                if !receivedData.auth && receivedData.token == nil {
                                    self.showAlert(message: "Incorrect password!")
                                }
                            } catch {
                                self.showAlert(message: "User with email \(email) not found")
                            }
                            break
                        default:
                            self.showAlert(message: "Invalid email/password")
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
        if let url = URL(string: APIConfig.authAPIBaseURL + "me"){
            AF.request(url, method: .get, headers: [
                "x-access-token": token
            ]).responseData(completionHandler: { response in
                let status = response.response?.statusCode
                switch response.result{
                case .success:
                    if let uwStatusCode = status{
                        switch uwStatusCode{
                        case 200...299:
                            let notesViewController = NotesViewController()
                            self.navigationItem.setHidesBackButton(true, animated: true)
                            self.navigationController?.pushViewController(notesViewController, animated: true)
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

extension RegistratonViewController: AuthAPIProtocol {
    func logout() {
    }
    
    func register(name: String, email: String, password: String) {
        if let url = URL(string: APIConfig.authAPIBaseURL + "register"){
            AF.request(url, method: .post, parameters: [
                "name": name,
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
                                let receivedData = try decoder.decode(RegisterAPIResponse.self, from: data)
                                self.defaults.set(receivedData.token, forKey: "accessToken")
                                self.resetFields()
                                let notesViewController = NotesViewController()
                                self.navigationController?.pushViewController(notesViewController, animated: true)
                            } catch {
                                print("error decoding response")
                            }
                            break
                        case 400...499:
                            self.showAlert(message: "User already exists!")
                            break
                        default:
                            self.showAlert(message: "User already exists!")
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
                case .success:
                    if let uwStatusCode = status{
                        switch uwStatusCode{
                        case 200...299:
                            let notesViewController = NotesViewController()
                            self.navigationController?.pushViewController(notesViewController, animated: true)
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
