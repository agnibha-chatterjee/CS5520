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
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "person.circle"),
            style: .plain,
            target: self,
            action: #selector(onProfilePress)
        )
        
        notesView.buttonAdd.addTarget(self, action: #selector(onAddNote), for: .touchUpInside)
        
        notesView.tableNotes.delegate = self
        notesView.tableNotes.dataSource = self
        notesView.tableNotes.separatorStyle = .none
    
        self.getAllNotes()
    }
    
    @objc func onProfilePress() {
        let profileViewController = ProfileViewController()
        self.navigationController?.pushViewController(profileViewController, animated: true)
    }
    
    func showAlert(title: String = "Error", message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .default))
        present(alert, animated: true)
    }
    
    func isNoteEmpty() -> Bool {
        if self.notesView.newNoteTextField.text?.isEmpty == true {
            showAlert(message: "Note cannot be empty")
            return true
        }
        return false
    }
    
    @objc func onAddNote() {
        if isNoteEmpty() {
            return
        }
        
        let newNoteText = self.notesView.newNoteTextField.text!
        self.addNote(newNoteText: newNoteText)
        self.notesView.newNoteTextField.text = ""
    }
}

extension NotesViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "notes", for: indexPath) as! NoteTableViewCell
        cell.noteContents.text = self.notes[indexPath.row].text
        
        let buttonOptions = UIButton(type: .system)
        buttonOptions.sizeToFit()
        buttonOptions.showsMenuAsPrimaryAction = true
        buttonOptions.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        buttonOptions.menu = UIMenu(title: "Delete note?",
                            children: [
                                UIAction(title: "Delete",handler: {(_) in
                                    let noteId = self.notes[indexPath.row]._id
                                    self.deleteNote(noteId: noteId)
                                    }),
                                ])
        cell.accessoryView = buttonOptions
        return cell
    }
}
