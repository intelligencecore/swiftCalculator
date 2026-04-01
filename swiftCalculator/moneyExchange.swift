import SwiftUI

struct MoneyExchange: View {
	@StateObject var viewModel = CurrencyExchangeViewModel()
	
	var body: some View {
		VStack {
			Text("Money Exchange")
				.bold()
		}
	}
}

#Preview {
	MoneyExchange()
}
