import SwiftUI

struct AboutView: View {
    var body: some View {

            // Design a view that the app was made with Swift
            
NavigationStack{
    ScrollView{
        VStack {
            Text("Made with ❤️ in Cupertino using")
                .padding(.top, 100)
                .padding(.bottom, 100)
                .bold()
                        
            Image(systemName: "swift")
                .font(.system(size: 250))
                .foregroundStyle(
            RadialGradient(
                colors: [.orange, .red],
                center: .center,
                startRadius: 50,
                endRadius: 150
                                )
                            )
                        
            Text("The Swift Programming Language")
                .font(.title2)
                .bold()
                        
                    }
        }
        }
    }
}
    
#Preview {
    AboutView()
}
