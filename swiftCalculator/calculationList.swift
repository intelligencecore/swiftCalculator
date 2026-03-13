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
					
					
					if history.isEmpty {
					Text("Nothing to see here...")
					} else {
						ForEach(history, id: \.self) { result in
							Button {
								UIPasteboard.general.string = result
							} label: {
								HStack {
									
									
									Text("Result: \(result)")
										.textSelection(.enabled)
										.foregroundColor(Color.primary)
										.textSelection(.enabled)
										.frame(
											width: 350,
											height: 50,
											alignment: .leading
										)
								}
							}
							
						}
						.buttonStyle(GlassButtonStyle())
						
						
						
					}

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
			.tint(Color.red)
		}
	}
}

#Preview {
	CalculationList(history: .constant([""]))
}
