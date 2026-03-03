import SwiftUI



struct AboutView: View {
	@State private var glowingSwift = false
	
	
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
				.frame(width: 800, height: 300) // lock the image in place
				.shadow(color: .orange.opacity(glowingSwift ? 0.8 : 0.0), radius: 40) // glowing shadow for the swift icon
				.animation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true), value: glowingSwift)
				.onAppear {
					glowingSwift = true
				}
		}
			    .padding()
            Text("The Swift Programming Language")
                .font(.title2)
                .bold()
                        
                    }
			}
		}
    }

    
#Preview {
    AboutView()
}
