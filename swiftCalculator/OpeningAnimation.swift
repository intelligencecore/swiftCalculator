
//TODO: Set this view as the default view so is pressented when the app is being opened.






import SwiftUI

struct OpeningAnimation: View {
	

	var body: some View {
		
		
		VStack {
				NavigationStack {
				Image(systemName: "iphone") // there is no calculator SF symbol
					
					
					.fontWeight(.bold)
					.frame(width: 200, height: 200)
					.font(.system(size: 200))
					.foregroundStyle(RadialGradient(colors: [.white, .orange], center: .center, startRadius: 50, endRadius: 150))
				
			}
		
		}
		
		
		
        Text("This view  will be the default of the app and show an animation of opening the app")
    }
}




#Preview {
    OpeningAnimation()
}
