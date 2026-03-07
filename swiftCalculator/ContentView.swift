import SwiftUI

struct ContentView: View {
	// MARK:  - Property Wrappers
	@State private var displayText = ""
	@State private var firstNumber = 0.0
	@State private var currentOperation: Operation? = nil
	@State private var calculationHistory: [String] = []  // array to save the results


	// enumeration to use use in the calculations.
	enum Operation {
		case add
		case subtract
		case multiply
		case divide
	}

	// MARK: - Buttons
	let buttons = [
		["Del", "AC", "%", "÷"],
		["7", "8", "9", "×"],
		["4", "5", "6", "-"],
		["1", "2", "3", "+"],
		["0", ".", "="],
	]

	// MARK: Button handle tap

	func handleTap(_ button: String) {  // has to be debugged
		switch button {
		case "C", "AC":
			displayText = "0"
			firstNumber = 0.0
			currentOperation = nil
		case "1", "2", "3", "4", "5", "6", "7", "8", "9":
			if displayText == "0" {
				displayText = button  // replace the 0
			} else {
				displayText += button  // append
			}
		case "0":
			if displayText != "0" {  // prevent "00000"
				displayText += button
			}
		case ".":
			if !displayText.contains(".") {  // prevent "3.5.2"
				displayText += "."
			}
		case "+":
			operationTapped(.add)
		case "-":
			operationTapped(.subtract)
		case "×":
			operationTapped(.multiply)
		case "÷":
			operationTapped(.divide)
		case "=":
			equalsTapped()
		case "Del":
			if displayText.count > 1 {
				displayText.removeLast()
			} else {
				displayText = "0"
			}
		default:
			break
		}
	}

	func operationTapped(_ op: Operation) {
		firstNumber = Double(displayText) ?? 0
		currentOperation = op
		displayText = "0"
	}

	// function to format the result
	func formatResult(_ number: Double) -> String {
		if number == number.rounded() && !number.isInfinite {
			return String(Int(number))
		}
		return String(number)
	}

	// function  to handle when the equal button is pressed
	func equalsTapped() {
		let secondNumber = Double(displayText) ?? 0

		switch currentOperation {
		case .add:
			displayText = formatResult(firstNumber + secondNumber)
		case .subtract:
			displayText = formatResult(firstNumber - secondNumber)
		case .multiply:
			displayText = formatResult(firstNumber * secondNumber)
		case .divide:
			if secondNumber == 0 {
				displayText = "Error"
			} else {
				displayText = formatResult(firstNumber / secondNumber)
			}
		case .none:
			break
		}

		calculationHistory.append(displayText)
	}

	var body: some View {

		TabView {
			NavigationStack {
				HStack {
					if !calculationHistory.isEmpty {
						NavigationLink {
							CalculationList(history: $calculationHistory)
						} label: {
							Image(systemName: "person.badge.clock")
						.font(.system(size: 25))
						.foregroundStyle(Color.primary)
						}
						.buttonStyle(.glass)
						.frame(maxWidth: .infinity, alignment: .leading)
						.padding(.leading)
					}
				}

				VStack(alignment: .trailing) {
					Text(displayText)
						.textSelection(.enabled)
						.lineLimit(1)
						.minimumScaleFactor(0.5)
						.font(.system(size: 78, weight: .bold))
						.padding(.horizontal, 20)  // Give it space from the edges
						.frame(
							maxWidth: .infinity,
							minHeight: 100,
							alignment: .trailing
						)  // Grow to fill screen
						.background(Color(.systemGray6))
						.cornerRadius(15)
						.padding(.horizontal)
				}

				Spacer()

				// For each button in the array of buttons make a HStack.
				// For each button in the array [buttons] with the id (.self) make a row with a HStack.
				//For each row with the id (.self) with the title in the button (Show the item as the buttom title)
				// call the handleTap function with the title as input

				ForEach(buttons, id: \.self) { row in
					HStack {
						ForEach(row, id: \.self) { title in
							Button {
								handleTap(title)
							} label: {
								// Logic to swap text strings for SF Symbols
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

						}
					}
				}
				.padding()
			}

			                .tabItem {
				Image(systemName: "plus.forwardslash.minus")
				Text("Calculator")
							.buttonStyle(.glassProminent)
			}

			// Second Tab: Settings
			SettingsView()
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
