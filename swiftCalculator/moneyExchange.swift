import Foundation
import SwiftUI

struct MoneyExchange: View {

	var body: some View {
		VStack {

			
			Text("Money Exchange")
				.bold()
			
			Menu("Select Currency") {
				Button("American Dollar") {
					// calculation
				}
				Button("Canadian Dollar") {
					// calculation
				}
				Button("Euro") {
					// calculation
				}

			}
			.tint(Color.blue)
		}
		.padding(.top, 20)

		Spacer()
		VStack {
			Menu("Select Currency") {
				Button("American Dollar") {
					// calculation
				}
				Button("Canadian Dollar") {
					// calculation
				}
				Button("Euro") {
					// calculation
				}
			}
			.tint(Color.blue)

		}
		.padding(.bottom, 500)
	}
		
}

#Preview {
	MoneyExchange()
}
