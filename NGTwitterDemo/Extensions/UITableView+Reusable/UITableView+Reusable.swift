//
//  UITableView+Reusable.swift
//  NGTwitterDemo
//
//  Created by Владислав Прусаков on 27/08/2017.
//  Copyright © 2017 CraftGuys. All rights reserved.
//

import UIKit

///
/// Helper for work with Reusable protocol.
/// - author: Vladislav Prusakov
///
extension UITableView {
	
	///
	/// Register UITableViewCell by cell type.
	///
	/// - author: Vladislav Prusakov
	///
	/// - parameter type: Cell type.
	///
	func registerReusableCell<Cell: UITableViewCell>(_: Cell.Type) {
		if let nib = Cell.nib {
			self.register(nib, forCellReuseIdentifier: Cell.reusableIdentifier)
		} else {
			self.register(Cell.self, forCellReuseIdentifier: Cell.reusableIdentifier)
		}
	}
	
	
	///
	/// Dequeue cell by type.
	///
	/// - author: Vladislav Prusakov
	///
	/// - parameter type: Cell type for dequeue.
	/// - parameter indexPath: IndexPath for dequeue.
	///
	/// - returns: Return cell instance.
	///
	func dequeueReusableCell<Cell: UITableViewCell>(_: Cell.Type, indexPath: IndexPath) -> Cell {
		return self.dequeueReusableCell(withIdentifier: Cell.reusableIdentifier, for: indexPath) as! Cell
	}
	
}

