//
//  UITableView+ViewModel.swift
//  NGTwitterDemo
//
//  Created by Владислав Прусаков on 27/08/2017.
//  Copyright © 2017 CraftGuys. All rights reserved.
//

import UIKit

protocol CellViewAnyModel {
	static var cellAnyType: UIView.Type { get }
	func setupAny(cell: UIView)
}

protocol CellViewModel: CellViewAnyModel {
	associatedtype CellType: UIView
	func setup(cell: CellType)
}

extension CellViewModel {
	static var cellAnyType: UIView.Type {
		return CellType.self
	}
	
	func setupAny(cell: UIView) {
		setup(cell: cell as! CellType)
	}
	
}

extension UITableView {
	
	func dequeueReusableCell(withModel model: CellViewAnyModel, for indexPath: IndexPath) -> UITableViewCell {
		let identifier = String(describing: type(of: model).cellAnyType)
		let cell = self.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
		model.setupAny(cell: cell)
		return cell
	}
}
