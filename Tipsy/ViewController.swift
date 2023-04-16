//
//  ViewController.swift
//  Tipsy
//
//  Created by VASILY IKONNIKOV on 16.04.2023.
//

import UIKit

class ViewController: UIViewController {
	
	let color = UIColor(red: 0/255, green: 176/255, blue: 107/255, alpha: 1)

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = UIColor(red: 248/255, green: 255/255, blue: 253/253, alpha: 1)
		addSubviews()
		addConstraints()
		
	}
	
	// MARK: - Views
	lazy var billStackView = createStackView(axis: .vertical, alignment: .center, distribution: .fill, spacing: 26)
	lazy var billLabel = createLabel(title: "Enter bill total")
	
	lazy var tipSplitStackView = createStackView(axis: .vertical, alignment: .center, distribution: .fill, spacing: 26)
	lazy var tipLabel = createLabel(title: "Select tip")
	lazy var percentStackView = createStackView(axis: .horizontal, alignment: .fill, distribution: .fillProportionally, spacing: 0)
	lazy var zeroButton = createButton(title: "0%")
	lazy var tenButton = createButton(title: "10%")
	lazy var twentyButton = createButton(title: "20%")
	lazy var splitLabel = createLabel(title: "Choose Split")
	lazy var stepperStackView = createStackView(axis: .horizontal, alignment: .fill, distribution: .fill, spacing: 27)
	lazy var amountPersonLabel = createLabel(title: "2", fontSize: 35, color: color)
	
	lazy var calculateButton = createButton(title: "Calculate")
	
	lazy var stepper: UIStepper = {
		let stepper = UIStepper()
		stepper.minimumValue = 2
		stepper.maximumValue = 25
		stepper.stepValue = 1
		return stepper
	}()
	
	lazy var viewParameter: UIView = {
		let view = UIView()
		view.backgroundColor = UIColor(red: 215/255, green: 249/255, blue: 235/255, alpha: 1)
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	lazy var billTextfield: UITextField = {
		let textField = UITextField()
		textField.textColor = color
		textField.font = UIFont.systemFont(ofSize: 40)
		textField.textAlignment = .center
		textField.placeholder = "e.g. 123.56"
		textField.keyboardType = .decimalPad
		textField.tintColor = .darkGray
		return textField
	}()
	
	func createStackView(axis: NSLayoutConstraint.Axis, alignment: UIStackView.Alignment, distribution: UIStackView.Distribution, spacing: CGFloat) -> UIStackView {
		let stackView = UIStackView()
		stackView.axis = axis
		stackView.alignment = alignment
		stackView.distribution = distribution
		stackView.spacing = spacing
		stackView.translatesAutoresizingMaskIntoConstraints = false
		return stackView
	}
	
	func createLabel(title: String, fontSize: CGFloat = 25, color: UIColor = .lightGray) -> UILabel {
		let label = UILabel()
		label.text = title
		label.font = UIFont.systemFont(ofSize: fontSize)
		label.textColor = color
		return label
	}
	
	func createButton(title: String) -> UIButton {
		let button = UIButton()
		button.setTitle(title, for: .normal)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 35)
//		button.isSelected = true
		
		button.tintColor = .red
//		button.isSelected = true
		button.setTitleColor(color, for: .normal)
		
		return button
	}
	
	
	// MARK: - Constraints' functions
	func setViewParameterConstraints() {
		NSLayoutConstraint.activate([
			viewParameter.topAnchor.constraint(equalTo: billStackView.bottomAnchor, constant: 40),
			viewParameter.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			viewParameter.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
			viewParameter.bottomAnchor.constraint(equalTo: view.bottomAnchor)
		])
	}
	
	func setBillStackViewConstraints() {
		NSLayoutConstraint.activate([
			billStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
			billStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			billStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
		])
	}
	
	func setTipSplitStackViewConstraints() {
		NSLayoutConstraint.activate([
			tipSplitStackView.topAnchor.constraint(equalTo: viewParameter.topAnchor, constant: 20),
			tipSplitStackView.leadingAnchor.constraint(equalTo: viewParameter.leadingAnchor),
			tipSplitStackView.trailingAnchor.constraint(equalTo: viewParameter.trailingAnchor)
		])
	}
	
	func setTipSplitLabelConstraints() {
		NSLayoutConstraint.activate([
			tipLabel.heightAnchor.constraint(equalToConstant: 30),
			tipLabel.leadingAnchor.constraint(equalTo: tipSplitStackView.leadingAnchor, constant: 30),
			tipLabel.trailingAnchor.constraint(equalTo: tipSplitStackView.trailingAnchor, constant: -30),
			splitLabel.heightAnchor.constraint(equalToConstant: 30),
			splitLabel.leadingAnchor.constraint(equalTo: tipSplitStackView.leadingAnchor, constant: 30),
			splitLabel.trailingAnchor.constraint(equalTo: tipSplitStackView.trailingAnchor, constant: -30),
			billLabel.heightAnchor.constraint(equalToConstant: 30),
			billLabel.leadingAnchor.constraint(equalTo: billStackView.leadingAnchor, constant: 50),
			billLabel.trailingAnchor.constraint(equalTo: billStackView.trailingAnchor, constant: -50)
		])
	}
	
	func setButtonStackViewConstraint() {
		NSLayoutConstraint.activate([
			percentStackView.leadingAnchor.constraint(equalTo: tipSplitStackView.leadingAnchor),
			percentStackView.trailingAnchor.constraint(equalTo: tipSplitStackView.trailingAnchor),
			percentStackView.heightAnchor.constraint(equalToConstant: 54)
		])
	}
	
	func buttonConstraints() {
		let widthTwentyButton = NSLayoutConstraint(
			item: twentyButton,
			attribute: .width,
			relatedBy: .equal,
			toItem: zeroButton,
			attribute: .width,
			multiplier: 1,
			constant: 0
		)
		NSLayoutConstraint.activate([
			zeroButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 60),
			widthTwentyButton
		])
	}
	
	func splitStackViewConstraints() {
		NSLayoutConstraint.activate([
			stepperStackView.heightAnchor.constraint(equalToConstant: 29)
		])
	}
	
	func calculateButtonConstraints() {
		calculateButton.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			calculateButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 200),
			calculateButton.heightAnchor.constraint(equalToConstant: 54),
			calculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			calculateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
			
		])
	}
	
	// MARK: - add subviews and constraints
	func addSubviews() {
		view.addSubview(viewParameter)
		view.addSubview(billStackView)
		billStackView.addArrangedSubview(billLabel)
		billStackView.addArrangedSubview(billTextfield)
		
		viewParameter.addSubview(tipSplitStackView)
		tipSplitStackView.addArrangedSubview(tipLabel)
		tipSplitStackView.addArrangedSubview(percentStackView)
		tipSplitStackView.addArrangedSubview(splitLabel)
		tipSplitStackView.addArrangedSubview(stepperStackView)
		percentStackView.addArrangedSubview(zeroButton)
		percentStackView.addArrangedSubview(tenButton)
		percentStackView.addArrangedSubview(twentyButton)
		stepperStackView.addArrangedSubview(amountPersonLabel)
		stepperStackView.addArrangedSubview(stepper)
		view.addSubview(calculateButton)
	}
	
	func addConstraints() {
		setViewParameterConstraints()
		setBillStackViewConstraints()
		setTipSplitStackViewConstraints()
		setTipSplitLabelConstraints()
		setButtonStackViewConstraint()
		buttonConstraints()
		splitStackViewConstraints()
		calculateButtonConstraints()
	}
}

