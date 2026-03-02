

// TODO: Make the reset button reset the values to 0 when is pressed






import SwiftUI
import WebKit

struct SettingsView: View {
	
    @State private var showGithubView = false
    @State private var showAboutView = false
	@State private var isGlowing = false
	
    var body: some View {
        VStack {
            Text("Version")
                .font(.title)
                .bold()
                .padding(30)
            
            Text("0.0.10")
                .font(.largeTitle)
                .bold()
                .padding(30)
        
            Text("ALPHA")
				.font(.system(size: 80, weight: .heavy))
				.foregroundColor(.white)
				.padding(.horizontal, 30)
				.padding(.vertical, 15)
				.background(
					RoundedRectangle(cornerRadius: 15)
						.fill(
							LinearGradient(
								colors: [.red, .orange],
								startPoint: .topLeading,
								endPoint: .bottomTrailing
							)
						)
						.shadow(color: .orange.opacity(isGlowing ? 0.8 : 0.2), radius: isGlowing ? 30 : 10, y: 5)
				)
				.rotationEffect(.degrees(-15))
				.frame(width: 350, height: 150)
				.animation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true), value: isGlowing)
				.onAppear {
					isGlowing = true
				}
				.padding(.bottom, 30)
			
			
				
			
            //List of buttons
            List {
			
			//Button to show the 🚀 nice Swift Logo view😎❤️✨
				Button{
					showAboutView.toggle()
				} label: {
					Label("About", systemImage: "swift")
				}
				.foregroundColor(Color.orange)
				.sheet(isPresented: $showAboutView) {
					NavigationStack {
						AboutView()
					}
				}
      
				
			// Button to show the Github view with a "X" button
                Button{
                    showGithubView.toggle()
                } label: {
                    Label("Github Page", systemImage: "staroflife.circle.fill")
                }
				.foregroundStyle(Color("CustomGreen"))
                .sheet(isPresented: $showGithubView) {
            NavigationStack {
                        WebView(url: URL(string: "https://github.com/intelligencecore/swiftCalculator")!)
                .navigationTitle("GitHub")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
             ToolbarItem(placement: .navigationBarTrailing) {
                 Button {
                                        showGithubView = false
                                    } label: {
                        Image(systemName: "xmark.circle.fill")
                .foregroundStyle(.gray)
                                    }
                                }
                            }
                    }
                }
		
				
				//Toggle("Change to white", isOn: $whiteColorIndicator) // trying a new concept
				//Toggle("Other option", isOn: $whiteColorIndicator) // trying a new concept
			
				
//                Button {
//                    // Reset action
//                } label: {
//                    Label("Reset to default", systemImage: "exclamationmark.arrow.trianglehead.counterclockwise.rotate.90")
//                }
//                .foregroundStyle(.red)
            }
            .scrollContentBackground(.hidden)
            .background(.ultraThinMaterial)
            .cornerRadius(20)
            .padding()
        }
    }
}

#Preview {
	SettingsView()
}
