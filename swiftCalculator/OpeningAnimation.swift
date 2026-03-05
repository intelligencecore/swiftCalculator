
//TODO: Set this view as the default view so is pressented when the app is being opened.






import SwiftUI

enum AppState {
	case launching
	case active
}

struct OpeningAnimation: View {
	@State private var currentState: AppState = .launching
	@State private var logoScale = 0.5
	@State private var logoOpacity = 0.0
	
	var body: some View {
		ZStack {
			if currentState == .launching {
					// Your Animation View
				VStack {
					Image(systemName: "swift")
						.font(.system(size: 100))
						.foregroundStyle(.orange)
						.scaleEffect(logoScale)
						.opacity(logoOpacity)
				}
				.frame(maxWidth: .infinity, maxHeight: .infinity)
				.background(Color.black)
				.onAppear {
						// Start the opening animation
					withAnimation(.spring(duration: 1.0, bounce: 0.5)) {
						logoScale = 1.0
						logoOpacity = 1.0
					}
					
						// Transition to main app after 2 seconds
					DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
						withAnimation(.easeOut(duration: 0.5)) {
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
