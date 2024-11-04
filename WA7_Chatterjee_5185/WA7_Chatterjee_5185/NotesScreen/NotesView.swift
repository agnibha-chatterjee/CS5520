//
//  NotesView.swift
//  WA7_Chatterjee_5185
//
//  Created by agni on 11/3/24.
//

import UIKit

class NotesView: UIView {
    var tableNotes: UITableView!
    var bottomAddView:UIView!
    var newNoteTextField:UITextView!
    var buttonAdd:UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        
        setupTableNotes()
        
        setupBottomAddView()
        setupTextFieldAddPhone()
        setupButtonAdd()
        
        initConstraints()
    }
    
    func setupTableNotes(){
        tableNotes = UITableView()
        tableNotes.register(NoteTableViewCell.self, forCellReuseIdentifier: "notes")
        tableNotes.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableNotes)
    }
    
    func setupBottomAddView(){
        bottomAddView = UIView()
        bottomAddView.backgroundColor = .white
        bottomAddView.layer.cornerRadius = 6
        bottomAddView.layer.shadowColor = UIColor.lightGray.cgColor
        bottomAddView.layer.shadowOffset = .zero
        bottomAddView.layer.shadowRadius = 4.0
        bottomAddView.layer.shadowOpacity = 0.7
        bottomAddView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(bottomAddView)
    }
    
    func setupTextFieldAddPhone(){
        newNoteTextField = UITextView()
        newNoteTextField.text = "Type note here..."
        newNoteTextField.textColor = .black
        newNoteTextField.layer.borderWidth = 1.0
        newNoteTextField.layer.borderColor = UIColor.systemGray4.cgColor
        newNoteTextField.layer.cornerRadius = 8
        newNoteTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        newNoteTextField.translatesAutoresizingMaskIntoConstraints = false
        bottomAddView.addSubview(newNoteTextField)
    }
    
    func setupButtonAdd(){
        buttonAdd = UIButton(type: .system)
        buttonAdd.titleLabel?.font = .boldSystemFont(ofSize: 16)
        buttonAdd.setTitle("Add Note", for: .normal)
        buttonAdd.translatesAutoresizingMaskIntoConstraints = false
        bottomAddView.addSubview(buttonAdd)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            bottomAddView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor,constant: -8),
            bottomAddView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            bottomAddView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            
            buttonAdd.bottomAnchor.constraint(equalTo: bottomAddView.bottomAnchor, constant: -8),
            buttonAdd.leadingAnchor.constraint(equalTo: bottomAddView.leadingAnchor, constant: 4),
            buttonAdd.trailingAnchor.constraint(equalTo: bottomAddView.trailingAnchor, constant: -4),
            
            newNoteTextField.bottomAnchor.constraint(equalTo: buttonAdd.topAnchor, constant: -8),
            newNoteTextField.leadingAnchor.constraint(equalTo: buttonAdd.leadingAnchor, constant: 4),
            newNoteTextField.trailingAnchor.constraint(equalTo: buttonAdd.trailingAnchor, constant: -4),
            
            
            bottomAddView.topAnchor.constraint(equalTo: newNoteTextField.topAnchor, constant: -8),
            
            tableNotes.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32),
            tableNotes.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            tableNotes.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            tableNotes.bottomAnchor.constraint(equalTo: bottomAddView.topAnchor, constant: -8),
            
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
