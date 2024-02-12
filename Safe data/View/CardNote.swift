//
//  CardNote.swift
//  Safe data
//
//  Created by Ilia Ilinskii on 08/03/2024.
//

import SwiftUI

struct CardNote: View {
    let note: Note

    var body: some View {
        ScrollView {
            VStack(spacing: 5) {
                TextEditor(text: Binding<String>(
                    get: { note.titleText ?? "" },
                    set: { newValue in
                        // Update the value of note.content
                        note.titleText = newValue
                    }
                ))
                .font(.headline)
                /// Custom Hint
                .overlay(alignment: .center, content: {
                    Text("Card Name")
                        .foregroundStyle(.gray)
                        .padding(.leading, 5)
                        .opacity((note.titleText ?? "").isEmpty ? 1 : 0)
                        .allowsHitTesting(false)
                })
                .scrollContentBackground(.hidden)
                .multilineTextAlignment(.center)
                .padding(.top,5)
                .padding(.horizontal, 15)

                VStack() {
    
                    TextEditor(text: Binding<String>(
                        get: { note.cardNumber ?? "" },
                        set: { newValue in
                            // Update the value of note.content
                            note.cardNumber = newValue
                        }
                    ))
                    .font(.body)
                    /// Custom Hint
                    .overlay(alignment: .topLeading, content: {
                        Text("Card number")
                            .foregroundStyle(.gray)
                            .padding(.leading, 5)
                            .opacity((note.cardNumber ?? "").isEmpty ? 1 : 0)
                            .allowsHitTesting(false)
                    })
                    .scrollContentBackground(.hidden)
                    .multilineTextAlignment(.leading)
                    .padding()
                    
                    TextEditor(text: Binding<String>(
                        get: { note.cardName ?? "" },
                        set: { newValue in
                            // Update the value of note.content
                            note.cardName = newValue
                        }
                    ))
                    .font(.body)
                    /// Custom Hint
                    .overlay(alignment: .topLeading, content: {
                        Text("Name")
                            .foregroundStyle(.gray)
                            .padding(.leading, 5)
                            .opacity((note.cardName ?? "").isEmpty ? 1 : 0)
                            .allowsHitTesting(false)
                    })
                    .scrollContentBackground(.hidden)
                    .multilineTextAlignment(.leading)
                    .padding()
                    
                    TextEditor(text: Binding<String>(
                        get: { note.cardDate ?? "" },
                        set: { newValue in
                            // Update the value of note.content
                            note.cardDate = newValue
                        }
                    ))
                    .font(.body)
                    /// Custom Hint
                    .overlay(alignment: .topLeading, content: {
                        Text("Date")
                            .foregroundStyle(.gray)
                            .padding(.leading, 5)
                            .opacity((note.cardDate ?? "").isEmpty ? 1 : 0)
                            .allowsHitTesting(false)
                    })
                    .scrollContentBackground(.hidden)
                    .multilineTextAlignment(.leading)
                    .padding(.top,5)
                    .padding(.bottom,5)
                    .padding(.horizontal, 15)
                    
                    
                    
                    }
                .frame(width: 400, height: 250)
                .background(.gray)
                .cornerRadius(12)
                
                VStack() {
                    
                    TextEditor(text: Binding<String>(
                        get: { note.cardCvv ?? "" },
                        set: { newValue in
                            // Update the value of note.content
                            note.cardCvv = newValue
                        }
                    ))
                    .font(.body)
                    /// Custom Hint
                    .overlay(alignment: .topLeading, content: {
                        Text("CVV")
                            .foregroundStyle(.gray)
                            .padding(.leading, 5)
                            .opacity((note.cardCvv ?? "").isEmpty ? 1 : 0)
                            .allowsHitTesting(false)
                    })
                    .scrollContentBackground(.hidden)
                    .multilineTextAlignment(.leading)
                    .padding(.top,5)
                    .padding(.bottom,5)
                    .padding(.horizontal, 15)
                    
                    TextEditor(text: Binding<String>(
                        get: { note.cardPin ?? "" },
                        set: { newValue in
                            // Update the value of note.content
                            note.cardPin = newValue
                        }
                    ))
                    .font(.body)
                    /// Custom Hint
                    .overlay(alignment: .topLeading, content: {
                        Text("Pin")
                            .foregroundStyle(.gray)
                            .padding(.leading, 5)
                            .opacity((note.cardPin ?? "").isEmpty ? 1 : 0)
                            .allowsHitTesting(false)
                    })
                    .scrollContentBackground(.hidden)
                    .multilineTextAlignment(.leading)
                    .padding(.top,5)
                    .padding(.bottom,5)
                    .padding(.horizontal, 15)
                    
                }
            .frame(width: 400, height: 250)
            .background(.gray)
            .cornerRadius(12)
                
            }
        }
        .navigationTitle(note.titleText ?? "Title")
    }
}


#Preview {
    CardNote(note: Note(
        titleText: "Test name",
        timeValue: Date().timeIntervalSince1970,
        cardNumber: "4485215990995839",
        cardName: "Ilia Ilinskii",
        cardDate: "06/27",
        cardCvv: "523",
        cardPin: "0000",
        type: NoteType(typeValue: "card")
        ))
}


