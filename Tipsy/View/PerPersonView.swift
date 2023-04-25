//
//  PerPersonView.swift
//  Tipsy
//
//  Created by VASILY IKONNIKOV on 24.04.2023.
//

import UIKit

class PerPersonView: UIView {
	
	lazy var titleLabel = CustomLabel(text: "Total per person", fontSize: 30, textAlignment: .center, color: UIColor(named: Colors.gray)!)
	
	lazy var totalLabel: CustomLabel = {
		let label = CustomLabel(text: "56", textAlignment: .center, color: UIColor(named: Colors.green)!
		)
		label.font = UIFont.systemFont(ofSize: 45, weight: .bold)
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	init() {
		super.init(frame: .zero)
		setupView()
		addSubviews()
		setupConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}

private extension PerPersonView {
	func addSubviews() {
		addSubview(titleLabel)
		addSubview(totalLabel)
	}
	
	func setupConstraints() {
		NSLayoutConstraint.activate([
			titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
			titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
			titleLabel.heightAnchor.constraint(equalToConstant: 36),
			titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
			
			totalLabel.heightAnchor.constraint(equalToConstant: 100),
			totalLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
			totalLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
			totalLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
		])
	}
	
	func setupView() {
		backgroundColor = UIColor(named: Colors.lightGreen)
		translatesAutoresizingMaskIntoConstraints = false
	}
}

extension PerPersonView {
	func setupTotal(_ money: String?) {
		guard let money else { return }
		totalLabel.text = money
	}
}
