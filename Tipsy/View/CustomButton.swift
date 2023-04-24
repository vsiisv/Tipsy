//
//  PercentButton.swift
//  Tipsy
//
//  Created by VASILY IKONNIKOV on 21.04.2023.
//

import UIKit

class CustomButton: UIButton {
	
	let color = UIColor(named: Colors.green)
	
	convenience init(title: String, type: UIButton.ButtonType = .system) {
		self.init(type: type)
		setupButton(with: title)
	}
	
	private func setupButton(with title: String) {
		setTitle(title, for: .normal)
		titleLabel?.font = UIFont.systemFont(ofSize: 35)

		if title == "Calculate" || title == "Recalculate" {
			backgroundColor = color
			layer.cornerRadius = 10
			setTitleColor(.white, for: .normal)
		} else {
			tintColor = color
			setTitleColor(color, for: .normal)
		}
		translatesAutoresizingMaskIntoConstraints = false
	}
}
