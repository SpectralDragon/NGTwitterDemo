//
//  CategoryCell.swift
//  NGTwitterDemo
//
//  Created by Владислав Прусаков on 28/08/2017.
//  Copyright © 2017 CraftGuys. All rights reserved.
//

import UIKit

final class CategoryCell: UICollectionViewCell {
	
	@IBOutlet weak var categoryName: UILabel!
	@IBOutlet weak var dashLine: UIView!
	
	override var isSelected: Bool {
		get { return super.isSelected }
		set (selected) {
			self.categoryName?.textColor = selected ? UIColor.MainTheme.activeElement : UIColor.MainTheme.inactiveElement
			self.dashLine?.isHidden = !selected
			super.isSelected = selected
		}
	}
	
}
