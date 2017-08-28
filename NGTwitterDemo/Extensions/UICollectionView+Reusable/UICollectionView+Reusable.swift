//
//  UICollectionView+Reusable.swift
//  NGTwitterDemo
//
//  Created by Владислав Прусаков on 28/08/2017.
//  Copyright © 2017 CraftGuys. All rights reserved.
//

import UIKit

///
/// Helper for work with Reusable protocol.
/// - author: Vladislav Prusakov
///
extension UICollectionView {
	
	///
	/// Register UICollectionViewCell by cell type.
	///
	/// - author: Vladislav Prusakov
	///
	/// - parameter type: Cell type.
	///
	func registerReusableCell<Cell: UICollectionViewCell>(_: Cell.Type) {
		if let nib = Cell.nib {
			self.register(nib, forCellWithReuseIdentifier: Cell.reusableIdentifier)
		} else {
			self.register(Cell.self, forCellWithReuseIdentifier: Cell.reusableIdentifier)
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
	func dequeueReusableCell<Cell: UICollectionViewCell>(_: Cell.Type, indexPath: IndexPath) -> Cell {
		return self.dequeueReusableCell(withReuseIdentifier: Cell.reusableIdentifier, for: indexPath) as! Cell
	}
	
}

