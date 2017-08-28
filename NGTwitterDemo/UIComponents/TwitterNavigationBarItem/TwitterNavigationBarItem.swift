//
//  TwitterNavigationBarItem.swift
//  NGTwitterDemo
//
//  Created by Владислав Прусаков on 26/08/2017.
//  Copyright © 2017 CraftGuys. All rights reserved.
//

import UIKit

@IBDesignable
final class TwitterNavigationBarItem: UIButton {

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
		let buttonLayer = self.layer
		
		let bezier = UIBezierPath(roundedRect: self.bounds,
		                          byRoundingCorners: .allCorners,
		                          cornerRadii: self.bounds.size)
		
		let rounedLayer = CAShapeLayer()
		rounedLayer.frame = self.bounds
		rounedLayer.path = bezier.cgPath
		buttonLayer.mask = rounedLayer
		
		self.imageEdgeInsets = .init(top: 3, left: 3, bottom: 3, right: 3)
		self.imageView?.contentMode = .scaleAspectFit
		self.backgroundColor = UIColor.black.withAlphaComponent(0.4)
	}
	
}
