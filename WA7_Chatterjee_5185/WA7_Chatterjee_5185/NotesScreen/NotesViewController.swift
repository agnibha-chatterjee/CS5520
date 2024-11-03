//
//  ViewController.swift
//  WA7_Chatterjee_5185
//
//  Created by agni on 11/2/24.
//

import UIKit

class NotesViewController: UIViewController {
    
    let notesView = NotesView()
    let defaults = UserDefaults.standard
    var notes = [Note]()
    
    override func loadView() {
        self.view = notesView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "All Notes"
        
        notesView.tableNotes.delegate = self
        notesView.tableNotes.dataSource = self
    
        fetchAndPopulateNotes()
    }
    
    func fetchAndPopulateNotes() {
        let savedAccessToken = defaults.string(forKey: "accessToken")
        
        if savedAccessToken == nil {
            return
        }
        
        let accessToken: String = savedAccessToken!
        
        self.getAllNotes(token: accessToken)
    }

}

extension NotesViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "notes", for: indexPath) as! NoteTableViewCell
        print("HI", self.notes)
        cell.noteContents.text = self.notes[indexPath.row].text
        cell.selectionStyle = .none
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        fetchAndPopulateNotes()
//    }
    
//    func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
//        let name = self.contactNames[indexPath.row]
//        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { _ -> UIMenu? in
//            return self.editDeleteMenu(for: name)
//        }
//    }
}
