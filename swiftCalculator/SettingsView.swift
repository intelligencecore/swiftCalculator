// TODO: Make the reset button reset the values to 0 when is pressed

import SwiftUI
import WebKit

struct SettingsView: View {

	@State private var showGithubView = false
	@State private var showAboutView = false
	@State private var isGlowing = false
	@State private var howManytimesUserOpenedApp = 0
	@Binding var hapticFeedback: Bool

	var body: some View {
		VStack {
			Text("Version")
				.font(.title)
				.bold()
				.padding(30)

			Text("0.0.22")
				.font(.largeTitle)
				.bold()
				.padding(30)

			Text("BETA")
				.font(.system(size: 80, weight: .heavy))
				.foregroundColor(.white)
				.padding(.horizontal, 30)
				.padding(.vertical, 15)
				.shadow(
					color: .orange.opacity(isGlowing ? 100 : 0),
					radius: isGlowing ? 50 : 100
				)
				.background(
					RoundedRectangle(cornerRadius: 15)
				.fill(
					  LinearGradient(
					  colors: [.orange, .orange],
					  startPoint: .topLeading,
					  endPoint: .bottomTrailing
					)
					)
				.shadow(
					color: .orange.opacity(isGlowing ? 100 : 0),
					radius: isGlowing ? 50 : 100
				)
				
				.onAppear {
							isGlowing = true
						  }
				)
				.rotationEffect(.degrees(-25))
				.frame(width: 350, height: 150)

				.padding(.bottom, 30)
			
			

			//List of buttons
			List {
				//Button to show the 🚀 nice Swift Logo view😎❤️✨
				Button {
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
				
				//Button to enable haptic feedback on calculations

				// Button to show the Github view with a "X" button on the view
				Button {
					showGithubView.toggle()
				} label: {
					Label("Github Page", systemImage: "cat")
				}
				.foregroundStyle(Color("CustomGreen"))
				.sheet(isPresented: $showGithubView) {
					NavigationStack {
						WebView(
							url: URL(
								string:
									"https://github.com/intelligencecore/swiftCalculator"
							)!
						)
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
			}
				.scrollContentBackground(.automatic)
			    .background(.ultraThinMaterial)
			    .cornerRadius(20)
			    .padding()
				.sensoryFeedback(.impact, trigger: 1)
			
			
			
			
			
			VStack{
				Toggle(isOn: $hapticFeedback){
					Label("Haptic Feedback", systemImage: "command")
						
					}
				}
			.padding()
		}

	}
}

#Preview {
	@Previewable @State var tempHaptic = false
	SettingsView(hapticFeedback: $tempHaptic)
}
