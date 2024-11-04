//
//  NoteAPICalls.swift
//  WA7_Chatterjee_5185
//
//  Created by agni on 11/3/24.
//

import Alamofire

extension NotesViewController: NoteAPIProtocol {
    func getAllNotes() {
        let token = self.defaults.string(forKey: "accessToken")!
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
    
    func addNote(newNoteText: String) {
        let token = self.defaults.string(forKey: "accessToken")!
        if let url = URL(string: APIConfig.noteAPIBaseURL + "post"){
            AF.request(url, method: .post, parameters: [
                "text": newNoteText
            ], headers: [
                "x-access-token": token
            ]).responseData(completionHandler: { response in
                let status = response.response?.statusCode
                switch response.result{
                case .success:
                    if let uwStatusCode = status{
                        switch uwStatusCode{
                        case 200...299:
                            self.getAllNotes()
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
    
    func deleteNote(noteId: String) {
        let token = self.defaults.string(forKey: "accessToken")!
        if let url = URL(string: APIConfig.noteAPIBaseURL + "delete"){
            AF.request(url, method: .post, parameters: [
                "id": noteId
            ], headers: [
                "x-access-token": token
            ]).responseData(completionHandler: { response in
                let status = response.response?.statusCode
                switch response.result{
                case .success:
                    if let uwStatusCode = status{
                        switch uwStatusCode{
                        case 200...299:
                            self.getAllNotes()
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
}
