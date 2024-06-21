//
//  NoteManager.swift
//  PopcornSwirl
//
//  Created by Alexandra Ivanova on 21/06/2024.
//

import SwiftUI
import Combine

class NoteManager: ObservableObject {
    static let shared = NoteManager()
    
    @Published var notes: [Int: String] = [:] {
        didSet {
            saveNotes()
        }
    }
    
    let notesKey = "movieNotes"
    private var userDefaults: UserDefaults
    
    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
        loadNotes()
    }
    
    func saveNotes() {
        do {
            let encodedData = try JSONEncoder().encode(notes)
            userDefaults.set(encodedData, forKey: notesKey)
        } catch {
            print("Failed to encode notes: \(error)")
        }
    }
    
    func loadNotes() {
        guard let data = userDefaults.data(forKey: notesKey) else {
            return
        }
        
        do {
            notes = try JSONDecoder().decode([Int: String].self, from: data)
        } catch {
            print("Failed to decode notes: \(error)")
        }
    }
}
