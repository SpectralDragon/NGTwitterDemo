//
//  GradientView.swift
//  NGTwitterDemo
//
//  Created by Владислав Прусаков on 27/08/2017.
//  Copyright © 2017 CraftGuys. All rights reserved.
//

import UIKit

final class GradientView: UIView {
	
	override open class var layerClass: AnyClass {
		return CAGradientLayer.self
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		backgroundColor = .clear
		let gradientLayer = self.layer as! CAGradientLayer
		gradientLayer.locations = [0.0, 1.0]
		gradientLayer.colors = [UIColor.black.withAlphaComponent(0.3).cgColor, UIColor.clear.cgColor]
	}
	
}
