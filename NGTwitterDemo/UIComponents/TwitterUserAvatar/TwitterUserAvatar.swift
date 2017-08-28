//
//  TwitterUserAvatar.swift
//  NGTwitterDemo
//
//  Created by Владислав Прусаков on 26/08/2017.
//  Copyright © 2017 CraftGuys. All rights reserved.
//

import UIKit

final class TwitterUserAvatar: UIImageView {
	
	override func prepareForInterfaceBuilder() {
		super.prepareForInterfaceBuilder()
		self.initialize()
	}
	
	override func awakeFromNib() {
		self.initialize()
	}
	
	// MARK: -
	// MARK: Private methods
	private func initialize() {
		self.layer.masksToBounds = true
		self.layer.borderColor = UIColor.white.cgColor
		self.layer.borderWidth = 4.0
		self.layer.cornerRadius = self.frame.height / 2
	}

}
