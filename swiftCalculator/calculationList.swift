import SwiftUI

// TODO: Add screen to see previous calculations that the user has made before

struct CalculationList: View {
	@State private var showContentView: Bool = false
	@Binding var history: [String]
	
	var body: some View {
		VStack {
			ScrollView {
				VStack(spacing: 5) {
					if history.isEmpty {
						Text("You haven't made any calculations yet...")
							.bold()
							.padding(.top, 50)
					} else {
						ForEach(history, id: \.self) { result in
							Button {
								UIPasteboard.general.string = result
							} label: {
								HStack {
									Text("Result: \(result)")
									.foregroundColor(Color.primary)
									.buttonBorderShape(.buttonBorder)
									.frame(maxWidth: 280, minHeight: 50, alignment: .leading)
									.padding(.horizontal)
								}
							}
						}
						.buttonStyle(GlassButtonStyle())
					}
				}
			}
			.padding()
			
			if !history.isEmpty {
				Button("Remove all") {
					history.removeAll()
				}
				.buttonStyle(GlassButtonStyle())
				.padding(.bottom, 10)
				.tint(Color.red)
			}
		}
		.background(Color.clear)
	}
}
	 


#Preview {
	CalculationList(history: .constant([""]))
}
