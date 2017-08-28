//
//  TwitterRoundedButton.swift
//  NGTwitterDemo
//
//  Created by Владислав Прусаков on 26/08/2017.
//  Copyright © 2017 CraftGuys. All rights reserved.
//

import UIKit

@IBDesignable
final class TwitterRoundedButton: UIButton {

	override var isHighlighted: Bool {
		get { return super.isHighlighted }
		set {
			if newValue {
				self.backgroundColor = UIColor.MainTheme.activeElement.withAlphaComponent(0.3)
			} else {
				self.backgroundColor = .clear
			}
			
			super.isHighlighted = newValue
		}
	}
	
	override func awakeFromNib() {
		self.initialize()
	}
	
	override func prepareForInterfaceBuilder() {
		super.prepareForInterfaceBuilder()
		self.initialize()
	}
	
	// MARK: -
	// MARK: Private methods
	private func initialize() {
		self.layer.cornerRadius = self.frame.height / 2
		self.layer.borderColor = UIColor.MainTheme.activeElement.cgColor
		self.layer.borderWidth = 1.0
		self.titleEdgeInsets = .init(top: 5, left: 5, bottom: 5, right: 5)
		self.backgroundColor = .clear
		self.titleLabel?.textColor = UIColor.MainTheme.activeElement
		self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
	}

}
