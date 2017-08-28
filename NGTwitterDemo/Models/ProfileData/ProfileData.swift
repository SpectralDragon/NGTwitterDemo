//
//  ProfileData.swift
//  NGTwitterDemo
//
//  Created by Владислав Прусаков on 27/08/2017.
//  Copyright © 2017 CraftGuys. All rights reserved.
//

import UIKit

final class ProfileData {
	static var profile: [CellViewAnyModel] {
		return [
			TwitBase(avatar: #imageLiteral(resourceName: "twitter_user_avatar"), username: "Vladislav Prusakov", twit: "Hello everyone! This base twit cell", likes: "3", comments: "5", retweets: "2"),
			TwitImage(avatar: #imageLiteral(resourceName: "twitter_user_avatar"), username: "Vladislav Prusakov", twit: "Hello everyone! This twit cell with image content. I think that look like twitter. I want belive.", twitImage: #imageLiteral(resourceName: "twitter_user_background"), likes: "5", comments: "32", retweets: "3"),
		TwitBase(avatar: #imageLiteral(resourceName: "twitter_user_avatar"), username: "Vladislav Prusakov", twit: "Hello everyone! This base twit containt more text. That test on content size in TableView. This base twit containt more text. That test on content size in TableView. ", likes: "3", comments: "5", retweets: "2")]
	}
}
