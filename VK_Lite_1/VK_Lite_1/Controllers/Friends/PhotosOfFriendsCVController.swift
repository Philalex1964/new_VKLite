//
//  PhotosOfFriendsCVController.swift
//  VK_Lite_1
//
//  Created by Александр Филиппов on 07.04.2019.
//  Copyright © 2019 Philalex. All rights reserved.
//

import UIKit

class PhotosOfFriendsCVController: UICollectionViewController {

    public var friendName = ""
    
    public var friendImageName = ""
    
    public var friendImage: UIImage?
  
    var friends: [Friend] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = friendName
        NetworkingService().loadPhotos(token: Account.shared.token)
    }
    
    // MARK: - UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 10
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.reuseId, for: indexPath) as? PhotoCell else { fatalError()}
        cell.likeControl.addTarget(self, action: #selector(cellLikePressed(_:)), for: .valueChanged)
        cell.photoImageView.image = friendImage
        
        return cell
    }
    
    //MARK _ Private
    @objc func cellLikePressed(_ sender: LikeControl) {
        
        
        print("The cell liked status set to: \(sender.isLiked)")
    }
}

