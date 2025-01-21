//
//  CollectionViewCellItem.swift
//  Movie-app
//
//  Created by Asif-emumba on 19/01/2025.
//

import Foundation
import UIKit

protocol CollectionViewCellItem {
    func cellForItem(at indexPath: IndexPath, in collectionView: UICollectionView) -> UICollectionViewCell
}
