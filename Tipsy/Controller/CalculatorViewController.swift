//
//  ViewController.swift
//  Tipsy
//
//  Created by VASILY IKONNIKOV on 16.04.2023.
//

import UIKit

class CalculatorViewController: UIViewController {
	
	var calculator = Calculator()
	
	// MARK: - Views
	private lazy var billStackView = BillStackView()
	
	private lazy var viewParameter: ViewParameter = {
		let view = ViewParameter()
		return view
	}()
	
	private lazy var calculateButton: CustomButton = {
		let button = CustomButton(title: "Calculate")
		button.addTarget(self, action: #selector(calculate), for: .touchUpInside)
		return button
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		viewParameter.delegate = self
		view.backgroundColor = UIColor(named: Colors.white)
		addSubviews()
		setupConstraints()
	}
}

private extension CalculatorViewController {
	// MARK: - Constraints
	func setupConstraints() {
		NSLayoutConstraint.activate([
			viewParameter.topAnchor.constraint(equalTo: billStackView.bottomAnchor, constant: 40),
			viewParameter.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			viewParameter.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
			viewParameter.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			
			billStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
			billStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			billStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
			
			calculateButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 200),
			calculateButton.heightAnchor.constraint(equalToConstant: 54),
			calculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			calculateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
		])
	}
	
	// MARK: - add subviews
	func addSubviews() {
		view.addSubview(billStackView)
		view.addSubview(viewParameter)
		view.addSubview(calculateButton)
	}
	
	@objc
	private func calculate(_ sender: UIButton) {
		calculator.userInput(billStackView.getTextFieldText())
		presentView()
	}
	
	private func presentView() {
		let destinationVC = ResultViewController()
		destinationVC.result = calculator.getResult()
		destinationVC.tipPercent = calculator.getPercent()
		destinationVC.numberOfPeople = calculator.getNumberOfPeople()
		present(destinationVC, animated: true)
	}
}

// MARK: - ViewParameter Delegate
extension CalculatorViewController: ViewParameterDelegate {
	func percentPressed(_ percent: String) {
		calculator.calculatePercent(percent: percent)
		billStackView.endEditing()
	}
	
	func stepperPressed(value: Double, numberOfPeople: CustomLabel) {
		calculator.stepperValue(value)
		numberOfPeople.text = calculator.getNumberOfPeople()
	}
}
