//
//  NotesAPIProtocol.swift
//  WA7_Chatterjee_5185
//
//  Created by agni on 11/3/24.
//

protocol NoteAPIProtocol {
    func getAllNotes(token: String)
    func addNote()
    func deleteNote()
}
