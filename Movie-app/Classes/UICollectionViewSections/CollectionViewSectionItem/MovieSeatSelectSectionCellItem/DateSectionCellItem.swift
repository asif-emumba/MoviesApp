//
//  DateSectionCellItem.swift
//  Movie-app
//
//  Created by Asif-emumba on 27/01/2025.
//

import Foundation
import UIKit

protocol DateSectionCellItemDelegate: AnyObject {
    func dateCollectionViewCellItemDidSelect(cell: DateCollectionViewCell, cellItem: DateSectionCellItem)
}

final class DateSectionCellItem: CollectionViewCellItem {
    
    let item: Session
    var isSelected: Bool
    weak var delegate: DateSectionCellItemDelegate?
    
    init(item: Session, isSelected: Bool, delegate:  DateSectionCellItemDelegate? = nil) {
        self.item = item
        self.isSelected = isSelected
        self.delegate = delegate
    }
    
    func cellForItem(at indexPath: IndexPath, in collectionView: UICollectionView) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DateCollectionViewCell.identifier, for: indexPath) as? DateCollectionViewCell else {
            fatalError("Unsupported")
        }
        cell.configure(session: item, selected: isSelected)
        cell.delegate = self
        return cell
    }
    
}

extension DateSectionCellItem: DateSectionCellDelegate {
    func isSelectedDate(cell: DateCollectionViewCell) {
        delegate?.dateCollectionViewCellItemDidSelect(cell: cell, cellItem: self)
    }
}
