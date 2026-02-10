import SwiftUI

struct otherView: View {
    @State private var count = 1
    
    var body: some View {
        TabView {
            // First Tab: Counter
            VStack(spacing: 16) {
                Spacer()
                
                Text("\(count)")
                    .font(.system(size: 80, weight: .bold))
                    .foregroundColor(count > 0 ? .green : (count < 0 ? .red : .white))
                    .padding(.top, 20)
                
                Button("Add +1") {
                    count += 1
                }
                .buttonStyle(GlassButtonStyle())
                .glassEffect(in: .rect(cornerRadius: 20.0))
                
                Button("Subtract -1") {
                    count -= 1
                }
                .buttonStyle(GlassButtonStyle())
                .glassEffect(in: .rect(cornerRadius: 20.0))
                
                Button("Reset to Zero") {
                    count = 0
                }
                .buttonStyle(GlassButtonStyle())
                .glassEffect(in: .rect(cornerRadius: 20.0))
                
                Spacer()
                
                
                Spacer()
            }
            .tabItem {
                Image(systemName: "plus.forwardslash.minus")
                Text("Counter")
            }
            
            InternetView()
                 .tabItem{
                     Image(systemName: "globe")
                     Text("Internet")
                 }
            
            // Second Tab: Icon View
            IconView()
                .tabItem {
                    Image(systemName: "swift")
                    Text("Swift")
                }
        
        }
    }
}

#Preview {
    otherView()
}
