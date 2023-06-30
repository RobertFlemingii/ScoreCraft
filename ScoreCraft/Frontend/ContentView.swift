import SwiftUI

struct ContentView: View {
    // State variables to track the current state of the score creation process
    @State private var isCreatingScore = false
    @State private var isSelectingGeneral = false
    
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
    
    var body: some View {
        VStack {
            Button(action: {
                isCreatingScore = true
            }) {
                Text("Create Score")
            }
            .padding()
            
            Button("Open Score") {
                // Handle open score button tap
            }
            .padding()
        }
        .sheet(isPresented: $isCreatingScore, onDismiss: {
            // Handle actions after the popup is dismissed
        }) {
            createScorePopup()
        }
    }
    
    // Main score creation popup view
    func createScorePopup() -> some View {
        if isSelectingGeneral {
            return AnyView(chooseTemplatePopup())
        } else {
            return AnyView(enterScoreInformationPopup())
        }
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
                    isSelectingGeneral = true
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
                    isCreatingScore = false
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
            Text("Choose Template")
                .font(.title)
                .padding()
            
            // Title for the general options section
            Text("General Options")
                .font(.headline)
                .padding(.top)
            
            // Picker to select a general option for the template
            Picker(selection: $selectedGeneralOption, label: Text("General Options")) {
                ForEach(generalOptions, id: \.self) { option in
                    Text(option)
                }
            }
            .pickerStyle(.wheel)
            .padding()
            
            HStack {
                Spacer()
                
                // Back button to go back to the Enter Score Information tab
                Button(action: {
                    isSelectingGeneral = false
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
                    isCreatingScore = false
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
