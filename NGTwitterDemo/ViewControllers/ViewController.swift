//
//  ViewController.swift
//  NGTwitterDemo
//
//  Created by Владислав Прусаков on 26/08/2017.
//  Copyright © 2017 CraftGuys. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
	
	// MARK: -
	// MARK: IBOutlets
	@IBOutlet weak var backBarButtonItem: TwitterNavigationBarItem!
	@IBOutlet weak var writeTwittBarButtonItem: TwitterNavigationBarItem!
	@IBOutlet weak var avatarImageView: TwitterUserAvatar!
	@IBOutlet weak var header: TwitterHeaderView!
	@IBOutlet weak var scrollView: UIScrollView!
	@IBOutlet weak var followButton: TwitterRoundedButton!
	@IBOutlet weak var tableView: UITableView! {
		willSet (tableView) {
			tableView.delegate = self
			tableView.dataSource = self
			tableView.tableFooterView = UIView(frame: .zero)
			tableView.registerReusableCell(TwitterCell.self)
		}
	}
	@IBOutlet weak var categoryCollectionView: UICollectionView! {
		willSet (collectionView) {
			collectionView.delegate = self
			collectionView.dataSource = self
			collectionView.registerReusableCell(CategoryCell.self)
		}
	}
	
	// MARK: Private consts
	fileprivate let offsetWhenHeaderStop: CGFloat = 35.0
	fileprivate let offsetBlackLabelHeader: CGFloat = 35.0
	fileprivate let offsetWhiteLabelHeader: CGFloat = 100.0
	fileprivate lazy var categories: [String] = {
		return ["Tweets", "Tweets & replies", "Media", "Likes"]
	}()
	
	// MARK: User data
	fileprivate var twits: [CellViewAnyModel]?
	
	
	// MARK: -
	// MARK: Life cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		self.header.backgroundImage = #imageLiteral(resourceName: "twitter_user_background")
		self.twits = ProfileData.profile
		self.categoryCollectionView.selectItem(at: IndexPath(row: 0, section: 0),
		                                       animated: false,
		                                       scrollPosition: .centeredHorizontally)
	}
	
	// MARK: -
	// MARK: Overrides
	override var preferredStatusBarStyle: UIStatusBarStyle {
		return .lightContent
	}

}

// MARK: -
// MARK: UIScrollViewDelegate
extension ViewController: UIScrollViewDelegate {
	
	func scrollViewDidScroll(_ scrollView: UIScrollView) {
		
		if scrollView != self.scrollView { return }
		
		let offset = scrollView.contentOffset.y
		var avatarTransform = CATransform3DIdentity
		var headerTransform = CATransform3DIdentity
		
		// Scroll down
		if offset < 0 {
			
			// Change header scale
			let headerScaleFactor = -offset / self.header.bounds.height
			let headerSize = ((self.header.bounds.height * (1.0 + headerScaleFactor)) - self.header.bounds.height) / 2.0
			headerTransform = CATransform3DTranslate(headerTransform, 0, headerSize, 0)
			headerTransform = CATransform3DScale(headerTransform, 1.0 + headerScaleFactor, 1.0 + headerScaleFactor, 0)
			
			self.header.layer.transform = headerTransform
			
			self.header.blurImageView.alpha = headerScaleFactor
			
		} else {
			
			// Scroll up
			
			// Change header scale
			headerTransform = CATransform3DTranslate(headerTransform, 0, max(-self.offsetWhenHeaderStop, -offset), 0)
			
			// Change Username label scale
			let usernameTransform = CATransform3DMakeTranslation(0, max(-self.offsetBlackLabelHeader, self.offsetWhiteLabelHeader - offset), 0)
			
			// Change alpha Username label
			self.header.usernameLabel.alpha = min(1.0, (offset - self.offsetBlackLabelHeader) / self.offsetWhiteLabelHeader)
			
			self.header.imageView.alpha = min(1.0, 1.0 - (offset - self.offsetBlackLabelHeader) / self.offsetWhiteLabelHeader)
			self.header.blurImageView.alpha = min(0.4, 1.0 - (offset - self.offsetBlackLabelHeader) / self.offsetWhiteLabelHeader)
			self.header.gradientView.alpha = min(1.0, 1.0 - (offset - self.offsetBlackLabelHeader) / self.offsetWhiteLabelHeader)
			
			self.header.usernameLabel.layer.transform = usernameTransform
			
			// Change avatar scale
			let avatarScaleFactor = min(self.offsetWhenHeaderStop, offset) / self.avatarImageView.bounds.height / 1.4
			let avatarSize = ((self.avatarImageView.bounds.height * (1.0 + avatarScaleFactor)) - self.avatarImageView.bounds.height) / 2.0
			avatarTransform = CATransform3DTranslate(avatarTransform, 0, avatarSize, 0)
			avatarTransform = CATransform3DScale(avatarTransform, 1.0 - avatarScaleFactor, 1.0 - avatarScaleFactor, 0)
		}
		
		// Change pozition for header elements
		if offset <= self.offsetWhenHeaderStop {
			if self.avatarImageView.layer.zPosition < self.header.layer.zPosition {
				self.header.layer.zPosition = 0
				self.backBarButtonItem.layer.zPosition = 0
				self.writeTwittBarButtonItem.layer.zPosition = 0
			}
		} else {
			if self.avatarImageView.layer.zPosition >= self.header.layer.zPosition {
				self.header.layer.zPosition = 2
				self.backBarButtonItem.layer.zPosition = 2
				self.writeTwittBarButtonItem.layer.zPosition = 2
			}
		}
		
		// Apply transforms
		self.header.layer.transform = headerTransform
		self.avatarImageView.layer.transform = avatarTransform
	}
}

// MARK: -
// MARK: UITableViewDelegate
extension ViewController: UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return UITableViewAutomaticDimension
	}
	
	func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
		return UITableViewAutomaticDimension
	}
	
}

// MARK: -
// MARK: UITableViewDataSource
extension ViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.twits?.count ?? 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let twitViewModel = self.twits?[indexPath.row] else {
			fatalError("Can't get twits by indexPath")
		}
		return tableView.dequeueReusableCell(withModel: twitViewModel, for: indexPath)
	}
}

// MARK: -
// MARK: UICollectionViewDelegateFlowLayout
extension ViewController: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		if indexPath.row == 1 {
			return CGSize(width: 130, height: collectionView.frame.height)
		}
		return CGSize(width: 90, height: collectionView.frame.height)
	}
}

// MARK: -
// MARK: UICollectionViewDataSource
extension ViewController: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return categories.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(CategoryCell.self, indexPath: indexPath)
		cell.categoryName.text = self.categories[indexPath.row]
		return cell
	}
}
