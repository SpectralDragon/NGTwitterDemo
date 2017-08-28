//
//  UIImage+Blur.swift
//  NGTwitterDemo
//
//  Created by Владислав Прусаков on 27/08/2017.
//  Copyright © 2017 CraftGuys. All rights reserved.
//

import UIKit

extension UIImage {
	
	///
	/// Describe errors for blur
	///
	enum BlurringError: LocalizedError {
		/// If image have nullable size
		case nullableSize
		/// If UIImage don't have CIImage
		case ciImageFail
		/// If can't output CIImage representation
		case outputFail
		/// If can't create CGImage from context
		case cgImageCreateFail
		
		var errorDescription: String? {
			switch self {
			case .cgImageCreateFail:
				return "Can't create CGImage instance"
			case .ciImageFail:
				return "UIImage can't get CIImage instance"
			case .nullableSize:
				return "UIImage have nullable size"
			case .outputFail:
				return "Can't get output CIIMage from filter"
			}
		}
	}
	
	///
	/// Create blur image with radius.
	/// - author: Vladislav Prusakov
	///
	/// - parameter radius: Blur radius.
	/// - returns: Return blur image.
	///
	func blurredImage(radius: CGFloat) throws -> UIImage {
		
		// Check image size
		if (floorf(Float(self.size.width)) * floorf(Float(self.size.height))) <= 0.0 {
			throw BlurringError.nullableSize
		}
		
		let context = CIContext()
		guard let inputImage = CIImage(image: self) else { throw BlurringError.ciImageFail }
		
		let filter = CIFilter(name: "CIGaussianBlur")
		filter?.setValue(inputImage, forKey: kCIInputImageKey)
		filter?.setValue(radius, forKey: "inputRadius")
		
		guard let result = filter?.value(forKey: kCIOutputImageKey) as? CIImage else { throw BlurringError.outputFail }
		
		guard let cgImage = context.createCGImage(result, from: inputImage.extent) else { throw BlurringError.cgImageCreateFail }
		let finishImage = UIImage(cgImage: cgImage)
		
		return finishImage
	}
}
