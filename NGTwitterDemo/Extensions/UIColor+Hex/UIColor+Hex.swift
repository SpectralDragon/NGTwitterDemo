//
//  UIColor+Hex.swift
//  NGTwitterDemo
//
//  Created by Владислав Прусаков on 26/08/2017.
//  Copyright © 2017 CraftGuys. All rights reserved.
//

import UIKit.UIColor

///
/// Describe all error for initialize UIColor.
///
/// - author: Vladislav Prusakov
///
enum UIColorError: LocalizedError {
	case invalidHex
	case missingHashMark
	
	var errorDescription: String? {
		switch self {
		case .invalidHex:
			return "Can't initialize UIColor because hex has incorrect value"
		case .missingHashMark:
			return "Can't initialize UIColor bacause hex don't have hash prefix"
		}
	}
}

extension UIColor {
	
	///
	/// Initialize inctance UIColor use Hex.
	///
	/// - author: Vladislav Prusakov
	///
	/// - note: Return error, if don't set character '#' in Hex interpritation.
	///
	convenience init(hex: String) throws {
		
		if !hex.hasPrefix("#") {
			throw UIColorError.missingHashMark
		}
		
		let colorString = hex.replacingOccurrences(of: "#", with: "")
		
		var hexInt: UInt32 = 0
		
		let scanner = Scanner(string: colorString)
		scanner.scanHexInt32(&hexInt)
		
		switch colorString.characters.count {
		case 3:
			// #RGB
			self.init(hex3: UInt16(hexInt))
		case 4:
			// #ARGB
			self.init(hex4: UInt16(hexInt))
		case 6:
			// #RRGGBB
			self.init(hex6: hexInt)
		case 8:
			// #AARRGGBB
			self.init(hex8: hexInt)
		default:
			throw UIColorError.invalidHex
		}
	}
	
	private convenience init(hex8: UInt32) {
		let divisor = CGFloat(255)
		let red     = CGFloat((hex8 & 0xFF000000) >> 24) / divisor
		let green   = CGFloat((hex8 & 0x00FF0000) >> 16) / divisor
		let blue    = CGFloat((hex8 & 0x0000FF00) >>  8) / divisor
		let alpha   = CGFloat( hex8 & 0x000000FF       ) / divisor
		self.init(red: red, green: green, blue: blue, alpha: alpha)
	}
	
	private convenience init(hex6: UInt32) {
		let divisor = CGFloat(255)
		let red     = CGFloat((hex6 & 0xFF0000) >> 16) / divisor
		let green   = CGFloat((hex6 & 0x00FF00) >>  8) / divisor
		let blue    = CGFloat( hex6 & 0x0000FF       ) / divisor
		self.init(red: red, green: green, blue: blue, alpha: 1)
	}
	
	private convenience init(hex4: UInt16) {
		let divisor = CGFloat(15)
		let red     = CGFloat((hex4 & 0xF000) >> 12) / divisor
		let green   = CGFloat((hex4 & 0x0F00) >>  8) / divisor
		let blue    = CGFloat((hex4 & 0x00F0) >>  4) / divisor
		let alpha   = CGFloat( hex4 & 0x000F       ) / divisor
		self.init(red: red, green: green, blue: blue, alpha: alpha)
	}
	
	private convenience init(hex3: UInt16) {
		let divisor = CGFloat(15)
		let red     = CGFloat((hex3 & 0xF00) >> 8) / divisor
		let green   = CGFloat((hex3 & 0x0F0) >> 4) / divisor
		let blue    = CGFloat( hex3 & 0x00F      ) / divisor
		self.init(red: red, green: green, blue: blue, alpha: 1)
	}
	
}
