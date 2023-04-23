//
//  BillStackView.swift
//  Tipsy
//
//  Created by VASILY IKONNIKOV on 20.04.2023.
//

import UIKit

class BillStackView: UIStackView {
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupStackView()
		addSubviews()
		setupConstraints()
	}
	
	required init(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private lazy var titleLabel: UILabel = {
		let label = UILabel()
		label.text = "Enter bill total"
		label.font = UIFont.systemFont(ofSize: 25)
		label.textColor = .lightGray
		return label
	}()
	
	private lazy var textField: UITextField = {
		let textField = UITextField()
		textField.textColor = UIColor(named: "Green")
		textField.font = UIFont.systemFont(ofSize: 40)
		textField.textAlignment = .center
		textField.placeholder = "e.g. 123.56"
		textField.keyboardType = .decimalPad
		textField.tintColor = .darkGray
		return textField
	}()
	
	func endEditing() {
		textField.endEditing(true)
	}
	
	func getTextFieldText() -> String {
		guard let text = textField.text else { return "Oooops" }
		return text
	}
	
}

private extension BillStackView {
	func addSubviews() {
		addArrangedSubview(titleLabel)
		addArrangedSubview(textField)
		
	}
	
	func setupConstraints() {
		NSLayoutConstraint.activate([
			titleLabel.heightAnchor.constraint(equalToConstant: 30),
			titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
			titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50)
		])
	}
	
	func setupStackView() {
		axis = .vertical
		alignment = .center
		distribution = .fill
		spacing = 26
		translatesAutoresizingMaskIntoConstraints = false
	}
	
}
