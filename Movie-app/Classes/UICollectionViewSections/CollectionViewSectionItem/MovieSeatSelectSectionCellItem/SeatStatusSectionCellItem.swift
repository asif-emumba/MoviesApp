//
//  SeatStatusSectionCellItem.swift
//  Movie-app
//
//  Created by Asif-emumba on 27/01/2025.
//

import Foundation
import UIKit

final class SeatStatusSectionCellItem: CollectionViewCellItem {
    
    let item: ReservationStatus
    
    init(item: ReservationStatus) {
        self.item = item
    }
    
    func cellForItem(at indexPath: IndexPath, in collectionView: UICollectionView) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StatusViewCollectionViewCell.identifier, for: indexPath) as? StatusViewCollectionViewCell else {
            fatalError("Unsupported")
        }
        cell.configure(with: item)
        return cell
    }
    
}
