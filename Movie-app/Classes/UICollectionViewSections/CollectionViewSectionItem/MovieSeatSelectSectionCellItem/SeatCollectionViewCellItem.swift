//
//  SeatCollectionViewCellItem.swift
//  Movie-app
//
//  Created by Asif-emumba on 27/01/2025.
//

import Foundation
import UIKit

protocol SeatCollectionViewCellItemDelegate: AnyObject {
    func seatCollectionViewCellItemDidSelect(cell: SeatCollectionViewCell, cellItem: SeatCollectionViewCellItem)
}

final class SeatCollectionViewCellItem: CollectionViewCellItem {
    
    var seat: Seat
    weak var delegate: SeatCollectionViewCellItemDelegate?
    
    init(seat: Seat, delegate: SeatCollectionViewCellItemDelegate? = nil) {
        self.seat = seat
        self.delegate = delegate
        
    }
    
    func cellForItem(at indexPath: IndexPath, in collectionView: UICollectionView) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SeatCollectionViewCell.identifier, for: indexPath) as? SeatCollectionViewCell else {
            fatalError("Unsupported")
        }
        
        cell.configure(with: seat)
        cell.delegate = self
        return cell
    }
}

extension SeatCollectionViewCellItem: SeatCollectionViewCellDelegate {
    func seatCollectionViewCellDidSelect(cell: SeatCollectionViewCell) {
        delegate?.seatCollectionViewCellItemDidSelect(cell: cell, cellItem: self)
    }
}
