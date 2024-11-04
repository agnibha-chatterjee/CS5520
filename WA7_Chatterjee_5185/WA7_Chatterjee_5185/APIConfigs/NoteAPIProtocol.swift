//
//  NotesAPIProtocol.swift
//  WA7_Chatterjee_5185
//
//  Created by agni on 11/3/24.
//

protocol NoteAPIProtocol {
    func getAllNotes()
    func addNote(newNoteText: String)
    func deleteNote(noteId: String)
}
