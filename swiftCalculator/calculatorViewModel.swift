import Foundation
import Combine

class CalculatorViewModel: ObservableObject {
	@Published var displayText = ""
	@Published var firstNumber = 0.0
	@Published var currentOperation: Operation? = nil
	@Published var calculationHistory: [String] = []
	
	
	//enum for the operation
	enum Operation {
		case add
		case subtract
		case multiply
		case divide
	}

	
		// MARK: Button handle tap
	func handleTap(_ button: String) {
		
		
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
			return String(Float(number)) // changed from Int to Float to adjust it to a higher number
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
	
	
	
	
}
