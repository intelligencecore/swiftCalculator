
// TODO: Make this app the main app that the app will show when the user opens the app
// TODO: Make an array of buttons in the screen 






import SwiftUI


struct ContentView: View {
    // here goes the property wrappers
    @State private var result = 0
    
    
    
    var body: some View {
            
            HStack(alignment: .firstTextBaseline, spacing: 10){
                Text("\(result)")
                    .font(.system(size: 80, weight: .bold))
                    .foregroundColor(result > 0 ? .green : (result < 0 ? .red : .white))
                    .padding(.top, 20)
            }
            
                   
        TabView {
            // First Tab: Counter
            VStack(spacing: 16) {
   
                Button("+") {
                    result += 1
                }
                .buttonStyle(GlassButtonStyle())
                
                Button("Subtract -1") {
                    result -= 1
                }
                
                Button("Reset to Zero") {
                    result = 0
                }
                .font(.title)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, maxHeight:.infinity)
                                .aspectRatio(1, contentMode: .fit) // Keeps it square
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .clipShape(Circle()) // For the classic look
                Spacer()
                
               
                
            }
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
