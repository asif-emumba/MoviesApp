//
//  LoadingSectionCellItem.swift
//  Movie-app
//
//  Created by Asif-emumba on 19/01/2025.
//

import Foundation
import UIKit

final class LoadingSectionCellItem: CollectionViewCellItem {
    
    func cellForItem(at indexPath: IndexPath, in collectionView: UICollectionView) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LoadingIndicatorCell.identifier, for: indexPath) as! LoadingIndicatorCell
        cell.activityIndicator.startAnimating()
        return cell
    }
    
}
