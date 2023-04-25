//
//  ViewParameter.swift
//  Tipsy
//
//  Created by VASILY IKONNIKOV on 24.04.2023.
//

import UIKit

protocol ViewParameterDelegate: AnyObject {
	func stepperPressed(value: Double, numberOfPeople: CustomLabel)
	func percentPressed(_ percent: String)
}

class ViewParameter: UIView {
	
	weak var delegate: ViewParameterDelegate?

	//MARK: - subviews
	private lazy var tipLabel = CustomLabel(text: "Select tip")
	private lazy var splitLabel = CustomLabel(text: "Choose Split")
	private lazy var splitNumberLabel = CustomLabel(text: "2", fontSize: 35, textAlignment: .center, color: UIColor(named: Colors.green)!)
	
	private lazy var stepper: UIStepper = {
		let stepper = UIStepper()
		stepper.value = 2
		stepper.minimumValue = 2
		stepper.maximumValue = 25
		stepper.stepValue = 1
		stepper.addTarget(
			self,
			action: #selector(stepperValueChanged),
			for: .touchUpInside)
		stepper.translatesAutoresizingMaskIntoConstraints = false
		return stepper
	}()
	
	private lazy var tipSplitStackView: UIStackView = {
		let stackView = UIStackView()
		stackView.axis = .vertical
		stackView.alignment = .center
		stackView.distribution = .fill
		stackView.spacing = 26
		stackView.translatesAutoresizingMaskIntoConstraints = false
		return stackView
	}()
	
	private lazy var percentStackView: UIStackView = {
		let stackView = UIStackView()
		stackView.axis = .horizontal
		stackView.alignment = .fill
		stackView.distribution = .fillProportionally
		stackView.spacing = 0
		stackView.translatesAutoresizingMaskIntoConstraints = false
		return stackView
	}()
	
	private lazy var stepperStackView: UIStackView = {
		let stackView = UIStackView()
		stackView.axis = .horizontal
		stackView.alignment = .fill
		stackView.distribution = .fill
		stackView.spacing = 27
		stackView.translatesAutoresizingMaskIntoConstraints = false
		return stackView
	}()
	
	private lazy var zeroButton: CustomButton = {
		let button = CustomButton(title: "0%")
		button.addTarget(self, action: #selector(tipChanged), for: .touchUpInside)
		return button
	}()
	
	private lazy var tenButton: CustomButton = {
		let button = CustomButton(title: "10%")
		button.addTarget(self, action: #selector(tipChanged), for: .touchUpInside)
		return button
	}()
	
	private lazy var twentyButton: CustomButton = {
		let button = CustomButton(title: "20%")
		button.addTarget(self, action: #selector(tipChanged), for: .touchUpInside)
		return button
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		addSubviews()
		setupConstraints()
		setupView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

}

private extension ViewParameter {

	func setupConstraints() {
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
			tipSplitStackView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
			tipSplitStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
			tipSplitStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
		
			tipLabel.heightAnchor.constraint(equalToConstant: 30),
			tipLabel.leadingAnchor.constraint(equalTo: tipSplitStackView.leadingAnchor, constant: 30),
			tipLabel.trailingAnchor.constraint(equalTo: tipSplitStackView.trailingAnchor, constant: -30),
			splitLabel.heightAnchor.constraint(equalToConstant: 30),
			splitLabel.leadingAnchor.constraint(equalTo: tipSplitStackView.leadingAnchor, constant: 30),
			splitLabel.trailingAnchor.constraint(equalTo: tipSplitStackView.trailingAnchor, constant: -30),
			
			percentStackView.leadingAnchor.constraint(equalTo: tipSplitStackView.leadingAnchor),
			percentStackView.trailingAnchor.constraint(equalTo: tipSplitStackView.trailingAnchor),
			percentStackView.heightAnchor.constraint(equalToConstant: 54),
			
			zeroButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 60),
			widthTwentyButton,
			
			stepper.heightAnchor.constraint(equalToConstant: 29),
			stepper.widthAnchor.constraint(equalToConstant: 94),
			splitNumberLabel.heightAnchor.constraint(equalToConstant: 29),
			splitNumberLabel.widthAnchor.constraint(equalToConstant: 94)
		])
	}
	
	func addSubviews() {
		addSubview(tipSplitStackView)
		tipSplitStackView.addArrangedSubview(tipLabel)
		tipSplitStackView.addArrangedSubview(percentStackView)
		tipSplitStackView.addArrangedSubview(splitLabel)
		tipSplitStackView.addArrangedSubview(stepperStackView)
		percentStackView.addArrangedSubview(zeroButton)
		percentStackView.addArrangedSubview(tenButton)
		percentStackView.addArrangedSubview(twentyButton)
		stepperStackView.addArrangedSubview(splitNumberLabel)
		stepperStackView.addArrangedSubview(stepper)
	}
	
	@objc
	func stepperValueChanged(_ sender: UIStepper) {
		delegate?.stepperPressed(value: sender.value, numberOfPeople: splitNumberLabel)
	}
	
	@objc
	func tipChanged(_ sender: UIButton) {
		zeroButton.isSelected = false
		tenButton.isSelected = false
		twentyButton.isSelected = false
		
		sender.isSelected = true

		delegate?.percentPressed(sender.currentTitle!)
	}
	
	func setupView() {
		backgroundColor = UIColor(named: Colors.lightGreen)
		translatesAutoresizingMaskIntoConstraints = false
	}

}
