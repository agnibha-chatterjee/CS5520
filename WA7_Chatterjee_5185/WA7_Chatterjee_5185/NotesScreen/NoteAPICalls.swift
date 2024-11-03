//
//  NoteAPICalls.swift
//  WA7_Chatterjee_5185
//
//  Created by agni on 11/3/24.
//

import Alamofire

extension NotesViewController: NoteAPIProtocol {
    func getAllNotes(token: String) {
        if let url = URL(string: APIConfig.noteAPIBaseURL + "getall"){
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
                                let receivedData = try decoder.decode(GetAllNotesResponse.self, from: data)
                                self.notes = receivedData.notes
                                self.notesView.tableNotes.reloadData()
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
    
    func addNote() {
        
    }
    
    func deleteNote() {
        
    }
}
