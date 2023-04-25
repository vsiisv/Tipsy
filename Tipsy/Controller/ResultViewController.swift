//
//  ResultViewController.swift
//  Tipsy
//
//  Created by VASILY IKONNIKOV on 16.04.2023.
//

import UIKit

class ResultViewController: UIViewController {
	
	private let grayColor = UIColor(named: Colors.gray)
	private let greenColor = UIColor(named: Colors.green)
	
	var result: String?
	var numberOfPeople: String?
	var tipPercent: String?
	
	private lazy var amountView = PerPersonView()
	private lazy var commentLabel: CustomLabel = {
		let label = CustomLabel(text: "", fontSize: 25, textAlignment: .center, color: UIColor(named: Colors.gray)!)
		label.numberOfLines = 0
		return label
	}()
	
	private lazy var recalculateButton: CustomButton = {
		let button = CustomButton(title: "Recalculate")
		button.addTarget(self, action: #selector(recalculate), for: .touchUpInside)
		return button
	}()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		addSubviews()
		setupConstraints()
		updateUI()
    }
	
	func updateUI() {
		view.backgroundColor = UIColor(named: Colors.white)
		amountView.setupTotal(result)
		commentLabel.text = "Split between \(numberOfPeople!) people, with \(tipPercent!)% tip."
	}

	@objc
	func recalculate() {
		dismiss(animated: true)
	}

}

private extension ResultViewController {
	// MARK: - add subviews
	func addSubviews() {
		view.addSubview(amountView)
		view.addSubview(commentLabel)
		view.addSubview(recalculateButton)
	}
	
	// MARK: - add constraints
	func setupConstraints() {
		NSLayoutConstraint.activate([
			amountView.topAnchor.constraint(equalTo: view.topAnchor),
			amountView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			amountView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			amountView.heightAnchor.constraint(equalToConstant: 300),
			
			commentLabel.heightAnchor.constraint(equalToConstant: 117),
			commentLabel.topAnchor.constraint(equalTo: amountView.bottomAnchor, constant: 5),
			commentLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
			commentLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
			
			recalculateButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 200),
			recalculateButton.heightAnchor.constraint(equalToConstant: 54),
			recalculateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
			recalculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
		])
	}
}
