//
//  TwitImage.swift
//  NGTwitterDemo
//
//  Created by Владислав Прусаков on 27/08/2017.
//  Copyright © 2017 CraftGuys. All rights reserved.
//

import UIKit

final class TwitImage: TwitBase {
	
	private(set) var twitImage: UIImage?
	
	init(avatar: UIImage? = nil,
	     username: String? = nil,
	     twit: String? = nil,
	     twitImage: UIImage? = nil,
	     likes: String? = nil,
	     comments: String? = nil,
	     retweets: String? = nil) {
		self.twitImage = twitImage
		super.init(avatar: avatar, username: username, twit: twit, likes: likes, comments: comments, retweets: retweets)
	}
	
	override func setup(cell: TwitterCell) {
		super.setup(cell: cell)
		cell.twitContentConstraint.constant = 150
		let imageView = UIImageView()
		imageView.contentMode = .scaleAspectFill
		imageView.image = self.twitImage
		imageView.frame = CGRect(x: 0, y: 75, width: cell.twitContent.bounds.width, height: cell.twitContent.bounds.height)
		imageView.layer.cornerRadius = 5
		imageView.layer.masksToBounds = false
		cell.twitContent.addSubview(imageView)

	}
	
}
