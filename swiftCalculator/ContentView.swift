import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                    VStack {
                        Image(systemName: "iphone")
                            .frame(width: 100, height: 80)
                            .foregroundStyle(
                                LinearGradient(colors: [Color.blue, Color.green, Color.yellow], startPoint: .center, endPoint: .bottomLeading))
                            .font(.system(size: 100))
                    }
                    .padding(20)
                
                
                NavigationLink("Other view") {
                    otherView()
                }
                .buttonStyle(GlassButtonStyle())
                .padding()
                .ignoresSafeArea(.all)
                
                NavigationLink("Icon View"){
                    IconView()
                }
                .buttonStyle(GlassButtonStyle())
                .padding()
                .ignoresSafeArea(.all)
            }
        }
    }
}






#Preview {
    ContentView()
}
