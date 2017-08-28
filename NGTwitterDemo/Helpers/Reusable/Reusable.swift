//
//  Reusable.swift
//  NGTwitterDemo
//
//  Created by Владислав Прусаков on 27/08/2017.
//  Copyright © 2017 CraftGuys. All rights reserved.
//

import UIKit

///
/// Protocol for work with reusable components.
///
/// - author: Vladislav Prusakov
///
protocol Reusable: class {
	
	///
	/// Return component identifier by type.
	///
	/// - author: Vladislav Prusakov
	///
	static var reusableIdentifier: String { get }
	
	
	///
	/// Return Nib by type.
	///
	/// - author: Vladislav Prusakov
	///
	static var nib: UINib? { get }
}


extension Reusable {
	
	static var reusableIdentifier: String { return .init(describing: self) }
	
	static var nib: UINib?  {
		if Bundle.main.path(forResource: .init(describing: self), ofType: "nib") == nil {
			return nil
		}
		return UINib(nibName: .init(describing: self), bundle: nil)
	}
	
}

extension UITableViewCell: Reusable {}
extension UICollectionViewCell: Reusable {}
