
import SwiftUI

struct ContentView: View {
		// MARK:  - Property Wrappers
	@State private var displayText = ""
	@State private var firstNumber = 0.0
	@State private var currentOperation: Operation? = nil
	@State private var calculationHistory: [String] = []
	@State private var dividingByZero = false
	@State private var showCalculationsheet: Bool = false
	@State private var hapticBinding = false
	@State private var buttonTaps = 0
	
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
	func handleTap(_ button: String) {
		
		
		//Add haptic feedback to the buttons
			if hapticBinding {  // ← Is hapticBinding true? NO!
				buttonTaps += 1  // ← This line does NOT run!
			}
			
			
		
		switch button {
			case "C", "AC":
				displayText = "0"
				firstNumber = 0.0
				currentOperation = nil
			case "1", "2", "3", "4", "5", "6", "7", "8", "9":
				if displayText == "0" {
					displayText = button
				} else {
					displayText += button
				}
			case "0":
				if displayText != "0" {
					displayText += button
				}
			case ".":
				if !displayText.contains(".") {
					displayText += "."
				}
			case "+":
				operationTapped(.add)
			case "-":
				operationTapped(.subtract)
			case "×":
				operationTapped(.multiply)
			case "%":
				displayText = formatResult((Double(displayText) ?? 0.0) / 100)
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
	
		// function to handle when the equal button is pressed
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
					dividingByZero = true
				} else {
					displayText = formatResult(firstNumber / secondNumber)
				}
			case .none:
				break
		}
		if displayText != "Error" {
			calculationHistory.append(displayText)
		}
	}
	
	var body: some View {
		TabView {
			NavigationStack {
				VStack {
					ZStack {
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
						.sheet(isPresented: $showCalculationsheet) {
							CalculationList(history: $calculationHistory)
							//	.glassEffect()
						}
					}
					
					VStack(alignment: .trailing) {
						Text(displayText)
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
					.padding(.horizontal)
					
					Spacer()
					
					ForEach(buttons, id: \.self) { row in
						HStack {
							ForEach(row, id: \.self) { title in
								Button {
									handleTap(title)
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
								.sensoryFeedback(.impact, trigger: buttonTaps)
							}
						}
					}
					.padding()
				}
			}
			.alert("Cannot Divide by Zero", isPresented: $dividingByZero) {
				Button("OK") { displayText = "0" }
			} message: {
				Text("Division by zero is not allowed.")
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

