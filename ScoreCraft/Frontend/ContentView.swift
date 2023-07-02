import SwiftUI

struct ContentView: View {
    @State private var popupState: PopupState = .createScore
    @State private var selectedGeneralOption = "Choose Template"
    @State private var selectedInstruments: [String] = []
    
    let generalOptions = ["Choose Template", "General"]
    let woodwinds = ["Piccolo", "Flute", "Recorder", "Oboe", "Bb Clarinet", "Bb Bass Clarinet", "Bassoon", "Soprano Saxophone", "Alto Saxophone", "Tenor Saxophone", "Baritone Saxophone"]
    
    enum PopupState {
        case createScore
        case chooseTemplate
        case chooseInstruments
        case chooseKeySignature
    }
    
    var instruments: [String] {
        return ["Woodwinds"] + woodwinds
    }
    
    var body: some View {
        VStack {
            Text("Create New Score")
                .font(.title)
                .padding(.bottom, 16)
            
            switch popupState {
            case .createScore:
                createScorePopup() // Show the create score popup
            case .chooseTemplate:
                chooseTemplatePopup() // Show the choose template popup
            case .chooseInstruments:
                chooseInstrumentsSubOptions() // Show the choose instruments sub-options
            case .chooseKeySignature:
                chooseKeySignaturePopup() // Show the choose key signature popup
            }
            
            Spacer()
            
            HStack {
                // Back button
                Button(action: {
                    switch popupState {
                    case .chooseTemplate:
                        popupState = .createScore // Go back to create score popup
                    case .chooseInstruments:
                        popupState = .chooseTemplate // Go back to choose template popup
                    default:
                        break
                    }
                }) {
                    Text("Back")
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .disabled(popupState == .createScore)
                
                Spacer()
                
                // Next button
                Button(action: {
                    if popupState == .createScore {
                        popupState = .chooseTemplate // Go to choose template popup
                    }
                }) {
                    Text("Next")
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .disabled(popupState != .createScore)
                
                Spacer()
                
                // Finish button
                Button(action: {
                    // Handle finish action
                }) {
                    Text("Finish")
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .disabled(true)
                
                Spacer()
                
                // Cancel button
                Button(action: {
                    popupState = .createScore // Close the popup and go back to create score popup
                }) {
                    Text("Cancel")
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding(.horizontal)
            .padding(.bottom)
        }
    }
    
    // View for creating score
    func createScorePopup() -> some View {
        VStack(alignment: .leading) {
            Text("Create Score")
                .font(.headline)
                .padding(.bottom, 8)
            
            TextField("Title", text: .constant(""))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom, 8)
            
            TextField("Subtitle", text: .constant(""))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom, 8)
            
            TextField("Composer", text: .constant(""))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom, 8)
            
            TextField("Lyricist", text: .constant(""))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom, 8)
            
            TextField("Copyright", text: .constant(""))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom, 16)
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
    }
    
    
    // View for choosing template
    func chooseTemplatePopup() -> some View {
        VStack(alignment: .leading) {
            Text("Choose Template")
                .font(.headline)
                .padding(.bottom, 8)
            
            DisclosureGroup(
                content: {
                    VStack(alignment: .leading) {
                        Button(action: {
                            popupState = .chooseInstruments // Go to choose instruments tab
                        }) {
                            HStack {
                                Text("Choose Instruments")
                                    .font(.body)
                                    .padding(.leading, 16) // Add indentation
                                
                                Spacer()
                            }
                        }
                        .padding(.bottom, 8)
                        .font(.headline)
                        
                        Button(action: {
                            // Handle "Treble Clef" selection
                        }) {
                            HStack {
                                Text("Treble Clef")
                                    .font(.body)
                                    .padding(.leading, 16) // Add indentation
                                
                                Spacer()
                            }
                        }
                        .padding(.bottom, 8)
                        .font(.headline)
                        
                        Button(action: {
                            // Handle "Bass Clef" selection
                        }) {
                            HStack {
                                Text("Bass Clef")
                                    .font(.body)
                                    .padding(.leading, 16) // Add indentation
                                
                                Spacer()
                            }
                        }
                        .padding(.bottom, 8)
                        .font(.headline)
                        
                        Button(action: {
                            // Handle "Grand Staff" selection
                        }) {
                            HStack {
                                Text("Grand Staff")
                                    .font(.body)
                                    .padding(.leading, 16) // Add indentation
                                
                                Spacer()
                            }
                        }
                        .padding(.bottom, 8)
                        .font(.headline)
                    }
                },
                label: {
                    HStack {
                        Text("General")
                            .font(.body)
                        
                        Spacer()
                    }
                }
            )
            .padding(.bottom, 8)
            .font(.headline)
            
            Spacer()
            
            HStack {
                // Back button (goes to Score Information tab)
                Button(action: {
                    popupState = .createScore // Go back to create score popup
                }) {
                    Text("Back")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                
                Spacer()
                
                // Next button (grayed-out)
                Button(action: {
                    // Nothing to do here
                }) {
                    Text("Next")
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                .disabled(true)
                
                Spacer()
                
                // Finish button (grayed-out)
                Button(action: {
                    // Nothing to do here
                }) {
                    Text("Finish")
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                .disabled(true)
                
                // Cancel button (closes the popup)
                Button(action: {
                    popupState = .createScore // Go back to create score popup
                }) {
                    Text("Cancel")
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
            }
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
    }
    
    
    // View for choosing instruments
    func chooseInstrumentsSubOptions() -> some View {
        VStack {
            HStack {
                Button(action: {
                    withAnimation {
                        toggleDropdownVisibility() // Toggle visibility of the dropdown content
                    }
                }) {
                    HStack(spacing: 4) {
                        Image(systemName: isDropdownVisible ? "chevron.up" : "chevron.down")
                            .rotationEffect(.degrees(isDropdownVisible ? 0 : -90))
                            .animation(.easeInOut)
                            .font(.headline)
                        
                        Text("Woodwind")
                            .font(.body)
                    }
                    .padding(.trailing, 8)
                    .foregroundColor(.primary)
                }
                
                Spacer()
            }
            .padding(.top)
            
            if isDropdownVisible {
                ScrollView {
                    VStack(alignment: .leading) {
                        ForEach(woodwinds, id: \.self) { instrument in
                            Button(action: {
                                toggleInstrumentSelection(instrument) // Toggle instrument selection
                            }) {
                                HStack {
                                    Text(instrument)
                                        .font(.body)
                                    
                                    Spacer()
                                }
                            }
                            .padding(.bottom, 8)
                            .font(.headline)
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
        .overlay(
            VStack(alignment: .trailing, spacing: 4) {
                Text("Selected Instruments")
                    .font(.headline)
                    .padding(.bottom, 8)
                
                ForEach(selectedInstruments, id: \.self) { instrument in
                    Button(action: {
                        removeInstrumentSelection(instrument) // Remove instrument from selected instruments stack
                    }) {
                        Text(instrument)
                            .padding(8)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
            }
            .padding(.top, 16)
            .padding(.trailing, 16),
            alignment: .topTrailing
        )
    }

    @State private var isDropdownVisible = false

    // Toggle dropdown visibility
    func toggleDropdownVisibility() {
        isDropdownVisible.toggle()
    }


    // Remove instrument from selected instruments stack
    func removeInstrumentSelection(_ instrument: String) {
        if let index = selectedInstruments.firstIndex(of: instrument) {
            selectedInstruments.remove(at: index)
        }
    }


    // Check if sub-options are visible for the given option
    func isSubOptionsVisible(_ option: String) -> Bool {
        return selectedGeneralOption == option
    }
    
    // Toggle instrument selection
    func toggleInstrumentSelection(_ instrument: String) {
        selectedInstruments.append(instrument)
    }

    
    // View for choosing key signature
    func chooseKeySignaturePopup() -> some View {
        VStack(alignment: .leading) {
            Text("Choose Key Signature")
                .font(.headline)
                .padding(.bottom, 8)
            
            // Key signature selection view (e.g., buttons, picker, etc.)
            // Add your implementation here
            
            Spacer()
            
            HStack {
                Spacer()
                
                // Back button to go back to the Choose Instruments tab
                Button(action: {
                    popupState = .chooseInstruments // Go back to choose instruments tab
                }) {
                    Text("Back")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                
                Spacer()
                
                // Next button (grayed-out)
                Button(action: {
                    // Nothing to do here
                }) {
                    Text("Next")
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                .disabled(true)
                
                Spacer()
                
                // Finish button (grayed-out)
                Button(action: {
                    // Nothing to do here
                }) {
                    Text("Finish")
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                .disabled(true)
                
                // Cancel button (closes the popup)
                Button(action: {
                    popupState = .createScore // Go back to create score popup
                }) {
                    Text("Cancel")
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
            }
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
