
import SwiftUI


// TODO: Add screen to see previous calculations that the user has made before


struct CalculationList: View {
	@State private var showContentView: Bool = false
	@Binding var history: [String]
	
	
	var body: some View {
		VStack {
			ScrollView {
					// Using spacing: 10 keeps them tight together
				VStack(spacing: 10) {
					ForEach(history, id: \.self) { result in
						Button {
							UIPasteboard.general.string = result
						} label: {
							Text("Result: \(result)")
								.frame(maxWidth: .infinity, alignment: .leading)
						}
						.buttonStyle(.bordered)
						.textSelection(.enabled)
						.foregroundColor(Color.white)
					}
				}
				.padding()
			}
			
			if !history.isEmpty {
				Button("Remove all") {
					history.removeAll()
				}
				.buttonStyle(GlassButtonStyle())
				.padding(.bottom, 10)
			}
		}
	}
	
}
        


#Preview {
	CalculationList(history: .constant([""]))
}
