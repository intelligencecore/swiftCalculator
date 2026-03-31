import SwiftUI

struct ContentView: View {
		// MARK: - Property Wrappers
	@State private var dividingByZero = false
	@State private var showCalculationsheet: Bool = false
	@State private var hapticBinding = false
	@State private var buttonTaps = 0
	@ObservedObject var viewModel = CalculatorViewModel()
	@State private var showMoneyExchange = false
	let buttons = [
		["Del", "AC", "%", "÷"],
		["7", "8", "9", "×"],
		["4", "5", "6", "-"],
		["1", "2", "3", "+"],
		["0", ".", "="],
	]
	
	var body: some View {
		TabView {
			NavigationStack {
				VStack {
					HStack {
						Button {
							showCalculationsheet.toggle()
						} label: {
							Image(systemName: "person.badge.clock")
								.font(.system(size: 25))
								.foregroundStyle(Color.primary)
						}
						.buttonStyle(.glass)
						.frame(maxWidth: .infinity, alignment: .leading)
						.padding(.leading)
						
						Button {
							showMoneyExchange = true
						} label: {
							Image(
								systemName:
									"dollarsign"
							)
							.font(.system(size: 25))
							.foregroundStyle(Color.primary)
						}
						.buttonStyle(.glass)
						.frame(maxWidth: .infinity, alignment: .trailing)
						.padding(.trailing)
					}
					
					VStack(alignment: .trailing) {
						Text(viewModel.displayText)
							.textSelection(.enabled)
							.lineLimit(1)
							.minimumScaleFactor(0.5)
							.font(.system(size: 78, weight: .bold))
							.padding(.horizontal, 20)
							.frame(
								maxWidth: .infinity,
								minHeight: 100,
								alignment: .trailing
							)
							.background(Color(.systemGray6))
							.cornerRadius(15)
					}
					.onChange(of: viewModel.displayText) {
						oldValue, newValue in
						if newValue == "Error" {
							dividingByZero = true
						}
					}
					.sensoryFeedback(.error, trigger: dividingByZero) {
						oldValue, newValue in
						newValue == true
					}
					.padding(.horizontal)
					
					Spacer()
					
					ForEach(buttons, id: \.self) { row in
						HStack {
							ForEach(row, id: \.self) { title in
								Button {
									viewModel.handleTap(title)
									if hapticBinding {
										if viewModel.displayText != "Error" {
											buttonTaps += 1
										}
									}
								} label: {
									switch title {
										case "Del":
											Image(systemName: "delete.left")
												.foregroundColor(Color.red)
										case "÷":
											Image(systemName: "divide")
										case "×":
											Image(systemName: "multiply")
										case "-":
											Image(systemName: "minus")
										default:
											Text(title)
									}
								}
								.buttonStyle(GlassButtonStyle())
								.frame(
									maxWidth: (title == "=" || title == "0")
									? .infinity : 80
								)
								.font(.system(size: 40))
								.foregroundStyle(Color.primary)
								.sensoryFeedback(
									.impact,
									trigger: buttonTaps
								)
							}
						}
					}
					.padding()
				}
					// MARK: - Sheets
				.sheet(isPresented: $showCalculationsheet) {
					CalculationList(history: $viewModel.calculationHistory)
				}
				.sheet(isPresented: $showMoneyExchange) {
					MoneyExchange()
				}
				.alert("Cannot Divide by Zero", isPresented: $dividingByZero) {
					Button("OK") { viewModel.displayText = "0" }
				} message: {
					Text("Division by zero is not allowed!")
				}
			}
			.tabItem {
				Image(systemName: "plus.forwardslash.minus")
				Text("Calculator")
			}
			
			SettingsView(hapticFeedback: $hapticBinding)
				.tabItem {
					Image(systemName: "gear")
					Text("Settings")
				}
		}
	}
}

#Preview {
	ContentView()
}
