//
//  SeatAndPriceSectionCellItem.swift
//  Movie-app
//
//  Created by Asif-emumba on 28/01/2025.
//

import Foundation
import UIKit

final class SeatAndPriceSectionCellItem: CollectionViewCellItem {
    
    let item: MovieOrderInfo
    init(item: MovieOrderInfo) {
        self.item = item
    }
    
    func cellForItem(at indexPath: IndexPath, in collectionView: UICollectionView) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SeatAndPriceCollectionViewCell.identifier, for: indexPath) as? SeatAndPriceCollectionViewCell else {
            fatalError("Unsupported")
        }
        cell.configure(with: item)
        return cell
    }
    
}
