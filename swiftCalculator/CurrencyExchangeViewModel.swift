//
//  CurrencyExchangeViewModel.swift
//  swiftCalculator
//
//  Created by Richier on 3/31/26.
//
import Combine
import Foundation


class CurrencyExchangeViewModel: ObservableObject {
	@Published var fromCurrency: String = "American Dollar"
	@Published var toCurrency: String = "Euro"
	@Published var amount: String = ""
	@Published var result: String = ""
	
	let currencies = ["American Dollar", "Canadian Dollar", "Euro"]
	
	let rates: [String: Double] = [
		"American Dollar": 1.0,
		"Canadian Dollar": 0.74,
		"Euro": 1.08
	]
	
	func convert() {
		guard let input = Double(amount),
			  let fromRate = rates[fromCurrency],
			  let toRate = rates[toCurrency] else {
			result = "Invalid amount"
			return
		}
		let converted = input / fromRate * toRate
		result = String(format: "%.2f", converted)
	}
}


