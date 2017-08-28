//
//  TwitterCell.swift
//  NGTwitterDemo
//
//  Created by Владислав Прусаков on 27/08/2017.
//  Copyright © 2017 CraftGuys. All rights reserved.
//

import UIKit

final class TwitterCell: UITableViewCell {
	
	@IBOutlet weak var avatarImageView: TwitterUserAvatar!
	@IBOutlet weak var usernamaLabel: UILabel!
	@IBOutlet weak var twitLabel: UILabel!
	@IBOutlet weak var twitContent: UIView!
	@IBOutlet weak var twitContentConstraint: NSLayoutConstraint!
	
	@IBOutlet weak var commentButton: UIButton!
	@IBOutlet weak var retweetButton: UIButton!
	@IBOutlet weak var likeButton: UIButton!
	@IBOutlet weak var messageButton: UIButton!
	
	override func awakeFromNib() {
		super.awakeFromNib()
		self.twitLabel.numberOfLines = 0
		self.selectionStyle = .none
		self.twitContent.layer.cornerRadius = 5
	}
}
