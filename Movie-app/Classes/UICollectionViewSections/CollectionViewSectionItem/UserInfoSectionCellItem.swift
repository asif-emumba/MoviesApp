//
//  UserInfoSectionCellItem.swift
//  Movie-app
//
//  Created by Asif-emumba on 20/01/2025.
//

import Foundation
import UIKit

final class UserInfoSectionCellItem: CollectionViewCellItem {
    
    let item: String
    
    init(item: String ){
        self.item = item
    }
    
    func cellForItem(at indexPath: IndexPath, in collectionView: UICollectionView) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UserInfoCollectionViewCell.identifier, for: indexPath) as? UserInfoCollectionViewCell else {
            fatalError("Unsupported")
        }
        cell.configure(with: item)
        return cell
    }
    
}

