//
//  LoadingCell.swift
//  Movie-app
//
//  Created by Asif-emumba on 19/01/2025.
//

import Foundation
import UIKit

final class LoadingCellItem: CollectionViewCellItem {
    func cellForItem(at indexPath: IndexPath, in collectionView: UICollectionView) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LoadingIndicatorCollectionViewCell.identifier, for: indexPath) as! LoadingIndicatorCollectionViewCell
        cell.activityIndicator.startAnimating()
        return cell
    }
}
