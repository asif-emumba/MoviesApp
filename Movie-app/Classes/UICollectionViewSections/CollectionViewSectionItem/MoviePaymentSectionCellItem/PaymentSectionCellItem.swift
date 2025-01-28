//
//  PaymentSectionCellItem.swift
//  Movie-app
//
//  Created by Asif-emumba on 28/01/2025.
//

import Foundation
import UIKit

final class PaymentSectionCellItem: CollectionViewCellItem {
    
    let item: MovieInfo
    init(item: MovieInfo) {
        self.item = item
    }
    
    func cellForItem(at indexPath: IndexPath, in collectionView: UICollectionView) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PaymentMovieCoverCollectionViewCell.identifier, for: indexPath) as? PaymentMovieCoverCollectionViewCell else {
            fatalError("Unsupported")
        }
        cell.configure(with: item)
        return cell
    }
    
}
