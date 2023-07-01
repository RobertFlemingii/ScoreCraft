import SwiftUI

enum PopupState {
    case createScore
    case enterScoreInformation
    case chooseTemplate
    case chooseInstruments
}

struct ContentView: View {
    // State variable to track the current state of the popup
    @State private var popupState: PopupState = .createScore
    
    // Score information fields
    @State private var title = ""
    @State private var subtitle = ""
    @State private var composer = ""
    @State private var lyricist = ""
    @State private var copyright = ""
    
    // Selected general option for the template
    @State private var selectedGeneralOption = "Choose Instruments"
    
    // Available general options for the template
    @State private var generalOptions = ["Choose Instruments", "Treble Clef", "Bass Clef", "Grand Staff"]
    @State private var woodwinds = ["Piccolo", "Flute", "Recorder", "Oboe", "Bb Clarinet", "Bb Bass Clarinet", "Bassoon", "Soprano Saxophone", "Alto Saxophone", "Tenor Saxophone", "Baritone Saxophone"]
    
    var body: some View {
        VStack {
            Button(action: {
                popupState = .enterScoreInformation
            }) {
                Text("Create Score")
            }
            .padding()
            
            Button("Open Score") {
                // Handle open score button tap
            }
            .padding()
        }
        .sheet(isPresented: shouldShowPopup(), onDismiss: {
            // Handle actions after the popup is dismissed
        }) {
            switch popupState {
            case .createScore:
                createScorePopup()
            case .enterScoreInformation:
                enterScoreInformationPopup()
            case .chooseTemplate:
                chooseTemplatePopup()
            case .chooseInstruments:
                chooseInstrumentsPopup()
            }
        }
    }
    
    // Determine if the popup should be shown based on the current state
    private func shouldShowPopup() -> Binding<Bool> {
        return Binding<Bool>(
            get: {
                popupState != .createScore
            },
            set: { _ in }
        )
    }
    
    // Main score creation popup view
    func createScorePopup() -> some View {
        VStack {
            if popupState == .enterScoreInformation {
                enterScoreInformationPopup()
            } else if popupState == .chooseTemplate {
                chooseTemplatePopup()
            } else if popupState == .chooseInstruments {
                chooseInstrumentsPopup()
            }
        }
        .padding()
    }
    
    // View for entering score information
    func enterScoreInformationPopup() -> some View {
        VStack {
            Text("Enter Score Information")
                .font(.title)
                .padding()
            
            // Text fields to enter score information
            TextField("Title", text: $title)
                .padding()
            
            TextField("Subtitle", text: $subtitle)
                .padding()
            
            TextField("Composer", text: $composer)
                .padding()
            
            TextField("Lyricist", text: $lyricist)
                .padding()
            
            TextField("Copyright", text: $copyright)
                .padding()
            
            HStack {
                Spacer()
                
                // Back button (currently disabled)
                Button(action: {}) {
                    Text("Back")
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                .disabled(true)
                
                Spacer()
                
                // Next button to move to the Choose Template tab
                Button(action: {
                    popupState = .chooseTemplate
                }) {
                    Text("Next")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                
                // Finish button (currently disabled)
                Button(action: {}) {
                    Text("Finish")
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                .disabled(true)
                
                // Cancel button to close the popup
                Button(action: {
                    popupState = .createScore
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
    }
    
    // View for choosing a template
    func chooseTemplatePopup() -> some View {
        VStack {
            VStack(alignment: .leading) {
                HStack {
                    Text("General")
                        .font(.headline)
                    Spacer()
                    Image(systemName: popupState == .chooseTemplate ? "chevron.up" : "chevron.down")
                        .font(Font.body.weight(.semibold))
                        .foregroundColor(.gray)
                        .rotationEffect(.degrees(popupState == .chooseTemplate ? 0 : -90))
                }
                .padding(.bottom, 8)
                .onTapGesture {
                    popupState = popupState == .chooseTemplate ? .enterScoreInformation : .chooseTemplate
                }
                
                if popupState == .chooseTemplate {
                    VStack(alignment: .leading, spacing: 8) {
                        ForEach(generalOptions, id: \.self) { option in
                            Button(action: {
                                if option == "Choose Instruments" {
                                    popupState = .chooseInstruments // Set popup state to chooseInstruments when "Choose Instruments" is selected
                                } else {
                                    // Handle selection of other general options
                                }
                            }) {
                                Text(option)
                                    .font(.body)
                            }
                        }
                    }
                    .padding(.leading, 16)
                }
            }
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
            
            
            // Other template options (Choral, Chamber Music, Solo, Jazz, Popular, Band and Percussion, Orchestral)
            VStack(alignment: .leading) {
                Text("Other Options")
                    .font(.headline)
                    .padding(.bottom, 8)
                
                // Replace the buttons with a spreadsheet-like layout
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                    ForEach(0..<6) { _ in
                        Button(action: {}) {
                            Text("Option")
                                .font(.body)
                                .padding()
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(10)
                        }
                    }
                }
                .padding(.horizontal)
            }
            
            HStack {
                Spacer()
                
                // Back button to go back to the Enter Score Information tab
                Button(action: {
                    popupState = .enterScoreInformation
                }) {
                    Text("Back")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                
                Spacer()
                
                // Next button (currently disabled)
                Button(action: {}) {
                    Text("Next")
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                .disabled(true)
                
                // Finish button (currently disabled)
                Button(action: {}) {
                    Text("Finish")
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                .disabled(true)
                
                // Cancel button to close the popup
                Button(action: {
                    popupState = .createScore
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
    }
    
    // View for choosing instruments
    func chooseInstrumentsPopup() -> some View {
        VStack {
            VStack(alignment: .leading) {
                HStack {
                    Text("Woodwinds")
                        .font(.headline)
                    Spacer()
                    Image(systemName: popupState == .chooseInstruments ? "chevron.up" : "chevron.down")
                        .font(Font.body.weight(.semibold))
                        .foregroundColor(.gray)
                        .rotationEffect(.degrees(popupState == .chooseInstruments ? 0 : -90))
                }
                .padding(.bottom, 8)
                .onTapGesture {
                    popupState = popupState == .chooseInstruments ? .chooseTemplate : .chooseInstruments
                }
                
                if popupState == .chooseInstruments {
                    VStack(alignment: .leading, spacing: 8) {
                        ForEach(woodwinds, id: \.self) { instrument in
                            Button(action: {
                                // Handle instrument selection
                            }) {
                                Text(instrument)
                                    .font(.body)
                            }
                        }
                    }
                    .padding(.leading, 16)
                }
            }
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
            
            HStack {
                Spacer()
                
                // Back button to go back to the Choose Template tab
                Button(action: {
                    popupState = .chooseTemplate
                }) {
                    Text("Back")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                
                Spacer()
                
                // Next button (currently disabled)
                Button(action: {}) {
                    Text("Next")
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                .disabled(true)
                
                // Finish button (currently disabled)
                Button(action: {}) {
                    Text("Finish")
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                .disabled(true)
                
                // Cancel button to close the popup
                Button(action: {
                    popupState = .createScore
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
    }
}
