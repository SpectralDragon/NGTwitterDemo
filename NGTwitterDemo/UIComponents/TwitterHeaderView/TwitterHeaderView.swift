//
//  TwitterHeaderView.swift
//  NGTwitterDemo
//
//  Created by Владислав Прусаков on 26/08/2017.
//  Copyright © 2017 CraftGuys. All rights reserved.
//

import UIKit

final class TwitterHeaderView: UIView {
	
	// MARK: -
	// MARK: Private
	private(set) var imageView: UIImageView!
	private(set) var blurImageView: UIImageView!
	private(set) var gradientView: UIView!
	
	// MARK: IBOutlets
	@IBOutlet weak var usernameLabel: UILabel! {
		willSet (label) {
			self.insertSubview(self.imageView, belowSubview: label)
			self.insertSubview(self.blurImageView, belowSubview: label)
			
			label.layer.shadowColor = UIColor.gray.cgColor
			label.layer.shadowOffset = CGSize(width: 1, height: 1)
			label.layer.shadowRadius = 1
			label.layer.shadowOpacity = 1
		}
	}
	
	// MARK: Public
	var backgroundImage: UIImage? {
		willSet (image) {
			self.imageView.image = image
			do {
				self.blurImageView.image = try image?.blurredImage(radius: 15)
			} catch let error {
				print("Blurred image error: \(error.localizedDescription)")
			}
		}
	}
	
	// MARK: —
	// MARK: Initialize
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		self.initialize()
	}
	
	override func prepareForInterfaceBuilder() {
		super.prepareForInterfaceBuilder()
		self.initialize()
	}
	
	// MARK: -
	// MARK: Private methods
	private func initialize() {
		self.imageView = UIImageView(frame: self.frame)
		self.imageView.contentMode = .scaleAspectFill
		self.blurImageView = UIImageView(frame: self.frame)
		self.blurImageView.contentMode = .scaleAspectFill
		self.blurImageView.alpha = 0.0
		
		self.backgroundColor = UIColor.MainTheme.activeElement
		
		self.gradientView = GradientView(frame: self.bounds)
		self.addSubview(gradientView)
		
		self.clipsToBounds = true
	}
	
}
