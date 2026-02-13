

import SwiftUI




// TODO: Make this app the main app that the app will show when the user opens the app
// TODO: Make an array of buttons in the screen
// TODO: Make a bar with to show the result of the calculation in the screen




struct ContentView: View {
    // MARK:  - Property Wrappers
    @State private var result = 0.0
  
    
    
    // MARK: - Buttons
    let buttons = [
        ["del", "AC", "%","÷"],
        ["7", "8", "9", "X"],
        ["4", "5", "6", ""],
        ["1", "2", "3", "+"],
        ["0", "C", "  ", "="]
    ]
    
    func handleTap(_ button: String) {
        switch button {
        case "C":
            result = 0
        case "+":
            result += 1
        case "-":
            result -= 1
        default:
            if let num = Double(button) {
                result = num
            }
        }
    }
    
    
    var body: some View {
        
        TabView {
            VStack {
                VStack(alignment: .trailing){
                    Text(result.formatted())
                        .frame(width: 385, height: 100, alignment: .trailing)
                        .font(.system(size: 80, weight: .bold))
                        .padding(.trailing, 16)
                        .foregroundColor(result > 0.0 ? .green : (result < 0.0 ? .red : .gray))
                        .background(RoundedRectangle(cornerRadius: 15)
                            .frame(width: 385, height: 100, alignment: .center)
                            .foregroundStyle(Color.primary)
                        )
                    
                        .padding(.top, 20)
                }
                
                Spacer()
                
                ForEach(buttons, id: \.self) { row in
                    HStack(spacing: 12) {
                        ForEach(row, id: \.self) { title in
                            Button(title) {
                                handleTap(title)
                            }
                            .frame(width: 75.5, height: 60)
                            .font(.system(size: 30))
                            .buttonStyle(GlassButtonStyle())
                        }
                    }
            }
                .padding()
        }
            .padding(.horizontal)
                        
                        .tabItem {
                            Image(systemName: "plus.forwardslash.minus")
                            Text("Calculator")
                        }
                        
                        // Second Tab: Settings
                        SettingsView()
                            .tabItem {
                                Image(systemName: "gear")
                                Text("Settings")
                            }
                    }
                    
                }
             }

            
        


#Preview {
    ContentView()
}
