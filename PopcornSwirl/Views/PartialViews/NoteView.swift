//
//  NoteView.swift
//  PopcornSwirl
//
//  Created by Alexandra Ivanova on 21/06/2024.
//

import SwiftUI

struct NoteView: View {
    let movieId: Int
    @State var noteText: String
    @ObservedObject private var noteManager = NoteManager.shared
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Your Note")
                .font(.headline)
            
            TextEditor(text: $noteText)
                .frame(height: 150)
                .padding()
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(10)
                .onDisappear {
                    saveNote()
                }
                .toolbar {
                    ToolbarItem(placement: .keyboard) {
                        HStack {
                            Spacer()
                            Button("Done") {
                                UIApplication.shared.endEditing()
                            }
                        }
                    }
                }
            
        }
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
        .onAppear {
            loadNote()
        }
    }
    
    private func loadNote() {
        noteText = noteManager.notes[movieId] ?? ""
    }
    
    private func saveNote() {
        noteManager.notes[movieId] = noteText
    }
}

#Preview {
    NoteView(movieId: Movie.stubbedMovie.id, noteText: "Test note")
}
