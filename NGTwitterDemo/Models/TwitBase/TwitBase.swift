//
//  TwitSimple.swift
//  NGTwitterDemo
//
//  Created by Владислав Прусаков on 27/08/2017.
//  Copyright © 2017 CraftGuys. All rights reserved.
//

import UIKit

class TwitBase: CellViewModel {
	
	private(set) var avatarImage: UIImage?
	private(set) var username: String?
	private(set) var twit: String?
	
	private(set) var likes: String?
	private(set) var comments: String?
	private(set) var retweets: String?
	
	init(avatar: UIImage? = nil,
	     username: String? = nil,
	     twit: String? = nil,
	     likes: String? = nil,
	     comments: String? = nil,
	     retweets: String? = nil) {
		self.avatarImage = avatar
		self.username = username
		self.twit = twit
		
		if let likes = likes {
			self.likes = " \(likes)"
		}
		
		if let comments = comments {
			self.comments = " \(comments)"
		}
		
		if let retweets = retweets {
			self.retweets = " \(retweets)"
		}
		
	}
	
	func setup(cell: TwitterCell) {
		cell.avatarImageView.image = self.avatarImage
		cell.usernamaLabel.text = self.username
		cell.twitLabel.text = self.twit
		
		cell.likeButton.setTitle(self.likes, for: .normal)
		cell.commentButton.setTitle(self.comments, for: .normal)
		cell.retweetButton.setTitle(self.retweets, for: .normal)
	}
	
}
