//
//  ResultViewController.swift
//  Tipsy
//
//  Created by VASILY IKONNIKOV on 16.04.2023.
//

import UIKit

class ResultViewController: UIViewController {
	
	let grayColor = UIColor(red: 149/255, green: 154/255, blue: 153/255, alpha: 1)
	let greenColor = UIColor(red: 0/255, green: 176/255, blue: 107/255, alpha: 1)
	
	var result: String?
	var numberOfPeople: String?
	var tipPercent: String?
	
    override func viewDidLoad() {
        super.viewDidLoad()
		addViews()
		addConstraints()
		updateUI()
    }
	
	func updateUI() {
		view.backgroundColor = UIColor(red: 248/255, green: 255/255, blue: 253/255, alpha: 1)
		amountLabel.text = result
		commentLabel.text = "Split between \(numberOfPeople!) people, with \(tipPercent!)% tip."
	}

	@objc func recalculate() {
		dismiss(animated: true)
	}

	// MARK: - Views
	lazy var totalPerPersonLabel = createLabel(title: "Total per person", color: grayColor, fontSize: 30)
	lazy var amountLabel = createLabel(title: "56.32", color: greenColor, fontSize: 45, weight: .bold)
	lazy var commentLabel = createLabel(title: "Split between 2 people, with 10% tip.", color: grayColor, fontSize: 25)

	lazy var amountView: UIView = {
		let view = UIView()
		view.backgroundColor = UIColor(red: 215/255, green: 249/255, blue: 235/255, alpha: 1)
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	lazy var recalculateButton: UIButton = {
		let button = UIButton(type: .system)
		button.setTitle("Recalculate", for: .normal)
		button.setTitleColor(.white, for: .normal)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 35)
		button.backgroundColor = greenColor
		button.layer.cornerRadius = 10
		button.addTarget(
			self,
			action: #selector(recalculate),
			for: .touchUpInside)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	
	func createLabel(title: String, color: UIColor, fontSize: CGFloat, weight: UIFont.Weight = .regular) -> UILabel {
		let label = UILabel()
		label.font = UIFont.systemFont(ofSize: fontSize, weight: weight)
		label.text = title
		label.textAlignment = .center
		label.textColor = color
		label.numberOfLines = 0
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}
	
	// MARK: - Constraints
	
	func setViewConstraints() {
		NSLayoutConstraint.activate([
			amountView.topAnchor.constraint(equalTo: view.topAnchor),
			amountView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			amountView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			amountView.heightAnchor.constraint(equalToConstant: 300)
		])
	}
	
	func setTotalLabelConstraints() {
		NSLayoutConstraint.activate([
			totalPerPersonLabel.leadingAnchor.constraint(equalTo: amountView.leadingAnchor),
			totalPerPersonLabel.trailingAnchor.constraint(equalTo: amountView.trailingAnchor),
			totalPerPersonLabel.heightAnchor.constraint(equalToConstant: 36),
			totalPerPersonLabel.centerYAnchor.constraint(equalTo: amountView.centerYAnchor)
		])
	}
	
	func setAmountLabelConstraints() {
		NSLayoutConstraint.activate([
			amountLabel.heightAnchor.constraint(equalToConstant: 100),
			amountLabel.topAnchor.constraint(equalTo: totalPerPersonLabel.bottomAnchor),
			amountLabel.leadingAnchor.constraint(equalTo: amountView.leadingAnchor),
			amountLabel.trailingAnchor.constraint(equalTo: amountView.trailingAnchor),
		])
	}
	
	func setCommentConstraints() {
		NSLayoutConstraint.activate([
			commentLabel.heightAnchor.constraint(equalToConstant: 117),
			commentLabel.topAnchor.constraint(equalTo: amountView.bottomAnchor, constant: 5),
			commentLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
			commentLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
		])
	}
	
	func setRecalculateButtonConstraints() {
		NSLayoutConstraint.activate([
			recalculateButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 200),
			recalculateButton.heightAnchor.constraint(equalToConstant: 54),
			recalculateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
			recalculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
		])
	}
	
	// MARK: - Add subviews and Constraints
	func addViews() {
		view.addSubview(amountView)
		amountView.addSubview(totalPerPersonLabel)
		amountView.addSubview(amountLabel)
		view.addSubview(commentLabel)
		view.addSubview(recalculateButton)
	}
	
	func addConstraints() {
		setViewConstraints()
		setTotalLabelConstraints()
		setAmountLabelConstraints()
		setCommentConstraints()
		setRecalculateButtonConstraints()
	}
}
