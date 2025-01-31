//
//  TimeSectionCellItem.swift
//  Movie-app
//
//  Created by Asif-emumba on 28/01/2025.
//

import Foundation
import UIKit

protocol TimeSectionCellItemDelegate: AnyObject {
    func timeCollectionViewCellItemDidSelect(cell: TimeCollectionViewCell, cellItem: TimeSectionCellItem)
}

final class TimeSectionCellItem: CollectionViewCellItem {
    
    let item: SessionTime
    var isSelected: Bool
    weak var delegate: TimeSectionCellItemDelegate?
    
    init(item: SessionTime, isSelected: Bool, delegate:  TimeSectionCellItemDelegate? = nil) {
        self.item = item
        self.isSelected = isSelected
        self.delegate = delegate
    }
    
    func cellForItem(at indexPath: IndexPath, in collectionView: UICollectionView) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TimeCollectionViewCell.identifier, for: indexPath) as? TimeCollectionViewCell else {
            fatalError("Unsupported")
        }
        cell.configure(session: item, selected: isSelected)
        cell.delegate = self
        return cell
    }
    
}

extension TimeSectionCellItem: TimeSectionCellDelegate {
    func isSelectedTime(cell: TimeCollectionViewCell) {
        delegate?.timeCollectionViewCellItemDidSelect(cell: cell, cellItem: self)
    }
}
