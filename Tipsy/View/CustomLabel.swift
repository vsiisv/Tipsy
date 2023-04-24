//
//  CustomLabel.swift
//  Tipsy
//
//  Created by VASILY IKONNIKOV on 23.04.2023.
//

import UIKit

class CustomLabel: UILabel {
	init(text: String, fontSize: CGFloat = 25, textAlignment: NSTextAlignment = .left, color: UIColor = .lightGray) {
		super.init(frame: .zero)
		
		self.text = text
		self.textAlignment = textAlignment
		font = UIFont.systemFont(ofSize: fontSize)
		textColor = color
		setupLabel()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setupLabel() {
		translatesAutoresizingMaskIntoConstraints = false
	}
}
