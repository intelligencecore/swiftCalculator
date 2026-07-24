
//TODO: Set this view as the default view so is pressented when the app is being opened.



//TODO: Setup a new button array, make it more like the real calculator. (With grids and all of that)

//TODO: Set up the ipad mode so it doesnt look like an enlarged ipad app


import SwiftUI

enum AppState {
	case launching
	case active
}

struct OpeningAnimation: View {
	@State private var currentState: AppState = .launching // checking the app state to make sure that the animation is not shown when is not needed
	@State private var logoScale = 0.5
	@State private var logoOpacity = 0.0
	
	var body: some View {
		ZStack {
			if currentState == .launching {
				
				VStack {
					Image(systemName: "plus")
						.font(.system(size: 100))
						.foregroundStyle(.orange)
						
					
						Text("A Swiftly Calculator!")
							.font(.system(size: 20))
							.padding(.bottom, 80)
							.bold()
				}
				.scaleEffect(logoScale)
				.opacity(logoOpacity)
				.frame(maxWidth: .infinity, maxHeight: .infinity)
				.background(Color.black)
				.onAppear {
						// Start the opening animation
					withAnimation(.spring(duration: 1.0, bounce: 1.5)) {
						logoScale = 1.0
						logoOpacity = 0.9
					}
					
					
					
						// Transition to main app after 0.5 seconds
					DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
						withAnimation(.easeOut(duration: 0.3)) {
							currentState = .active
						}
					}
				}
			} else {
				ContentView() // main content
					.transition(.opacity.combined(with: .scale))
			}
		}
	}
}




#Preview {
OpeningAnimation()
}

