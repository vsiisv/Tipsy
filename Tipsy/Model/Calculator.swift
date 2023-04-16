//
//  Calculator.swift
//  Tipsy
//
//  Created by VASILY IKONNIKOV on 16.04.2023.
//

import Foundation

struct Calculator {
	var percent: Double?
	var numberOfPeople: Double = 2
	var userInput: Double?
	
	mutating func calculatePercent(percent: String?) {
		guard let percent else { return }
		guard let withoutPercentLetter = Double(String(percent.dropLast())) else { return }
		self.percent = withoutPercentLetter / 100
	}
	
	mutating func userInput(_ input: String?) {
		guard let input else { return }
		userInput = Double(input)
	}
	
	mutating func stepperValue(_ value: Double?) {
		guard let value else { return }
		numberOfPeople = value
	}
	
	func getResult() -> String {
		guard let percent, let userInput else { return "Oooops"}
		let percentOfBill = userInput * percent
		let amount = (percentOfBill + userInput) / numberOfPeople

		return String(format: "%.2f", amount)
	}
	
	func getPercent() -> String {
		guard let percent else { return "Oooops" }
		return String(format: "%.0f", percent * 100)
	}
	
	func getNumberOfPeople() -> String {
		return String(format: "%.0f", numberOfPeople)
	}
	
//	func getNumberOfPeople(count: String) -> String {
//		
//	}
}
