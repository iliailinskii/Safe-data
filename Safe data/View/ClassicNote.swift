//
//  ClassicNote.swift
//  Safe data
//
//  Created by Ilia Ilinskii on 06/03/2024.
//

import SwiftUI

struct ClassicNote: View {
    let note: Note

    var body: some View {
        ScrollView {
            VStack(spacing: 5) {
                Text(note.type?.typeValue ?? "")
                TextEditor(text: Binding<String>(
                    get: { note.titleText ?? "" },
                    set: { newValue in
                        // Update the value of note.content
                        note.titleText = newValue
                    }
                ))
                .font(.headline)
                /// Custom Hint
                .overlay(alignment: .topLeading, content: {
                    Text("Title")
                        .foregroundStyle(.gray)
                        .padding(.leading, 5)
                        .opacity((note.titleText ?? "").isEmpty ? 1 : 0)
                        .allowsHitTesting(false)
                })
                .scrollContentBackground(.hidden)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, maxHeight: 15)
                .padding(.top,5)
                .padding(.bottom,0)
                .padding(.horizontal, 15)
                
                TextEditor(text: Binding<String>(
                    get: { note.content ?? "" },
                    set: { newValue in
                        // Update the value of note.content
                        note.content = newValue
                    }
                ))
                .font(.body)
                /// Custom Hint
                .overlay(alignment: .topLeading, content: {
                    Text("Empty")
                        .foregroundStyle(.gray)
                        .padding(.leading, 5)
                        .opacity((note.content ?? "").isEmpty ? 1 : 0)
                        .allowsHitTesting(false)
                })
                .scrollContentBackground(.hidden)
                .multilineTextAlignment(.leading)
                .padding(.top,5)
                .padding(.bottom,5)
                .padding(.horizontal, 15)
            }
        }
        .navigationTitle(note.titleText ?? "Title")
    }
}

