//
//  CinemaSectionCellItem.swift
//  Movie-app
//
//  Created by Asif-emumba on 27/01/2025.
//

import Foundation
import UIKit

protocol CinemaSectionCellItemDelegate: AnyObject {
    func cinemaCollectionViewCellItemDidSelect(cell: CinemaCollectionViewCell, cellItem: CinemaSectionCellItem)
}

final class CinemaSectionCellItem: CollectionViewCellItem {
    
    let item: Cinema
    var isSelected: Bool
    weak var delegate: CinemaSectionCellItemDelegate?
    
    init(item: Cinema, isSelected: Bool, delegate:  CinemaSectionCellItemDelegate? = nil) {
        self.item = item
        self.delegate = delegate
        self.isSelected = isSelected
    }
    
    func cellForItem(at indexPath: IndexPath, in collectionView: UICollectionView) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CinemaCollectionViewCell.identifier, for: indexPath) as? CinemaCollectionViewCell else {
            fatalError("Unsupported")
        }
        cell.configure(with: item, isSelected: isSelected)
        cell.delegate = self
        return cell
    }
    
}

extension CinemaSectionCellItem: CinemaSectionCellDelegate {
    func isSelected(cell: CinemaCollectionViewCell) {
        delegate?.cinemaCollectionViewCellItemDidSelect(cell: cell, cellItem: self)
    }
}
