//
//  NoteManagerTests.swift
//  PopcornSwirlTests
//
//  Created by Alexandra Ivanova on 21/06/2024.
//

import XCTest
import Combine
@testable import PopcornSwirl

class NoteManagerTests: XCTestCase {

    var noteManager: NoteManager!
    var mockUserDefaults: UserDefaults!
    
    override func setUp() {
        super.setUp()
        // Create a mock UserDefaults instance
        mockUserDefaults = UserDefaults(suiteName: "MockUserDefaults")
        mockUserDefaults.removePersistentDomain(forName: "MockUserDefaults")
        
        // Inject mock UserDefaults into NoteManager
        noteManager = NoteManager(userDefaults: mockUserDefaults)
    }

    override func tearDown() {
        noteManager = nil
        mockUserDefaults = nil
        super.tearDown()
    }
    
    func testAddNote() {
        let movieId = 1
        let noteText = "Great movie!"
        
        noteManager.notes[movieId] = noteText
        XCTAssertEqual(noteManager.notes[movieId], noteText)
    }

    func testSaveNotes() {
        let movieId = 1
        let noteText = "Great movie!"
        
        noteManager.notes[movieId] = noteText
        noteManager.saveNotes()
        
        guard let savedData = mockUserDefaults.data(forKey: noteManager.notesKey) else {
            XCTFail("No data was saved in UserDefaults")
            return
        }
        
        do {
            let savedNotes = try JSONDecoder().decode([Int: String].self, from: savedData)
            XCTAssertEqual(savedNotes[movieId], noteText)
        } catch {
            XCTFail("Failed to decode saved notes: \(error)")
        }
    }
    
    func testLoadNotes() {
        let movieId = 1
        let noteText = "Great movie!"
        let notes = [movieId: noteText]
        
        do {
            let encodedData = try JSONEncoder().encode(notes)
            mockUserDefaults.set(encodedData, forKey: noteManager.notesKey)
        } catch {
            XCTFail("Failed to encode notes: \(error)")
        }
        
        noteManager.loadNotes()
        XCTAssertEqual(noteManager.notes[movieId], noteText)
    }
}
