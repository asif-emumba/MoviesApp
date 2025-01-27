//
//  MovieStoryLineSectionCellItem.swift
//  Movie-app
//
//  Created by Asif-emumba on 25/01/2025.
//

import Foundation
import UIKit

protocol MovieStoryLineSectionCellItemDelegate: AnyObject {
    func movieStoryLineCollectionViewCellItemDidSelect(cell: MovieStoryLineCollectionViewCell, cellItem: MovieStoryLineSectionCellItem)
}

final class MovieStoryLineSectionCellItem: CollectionViewCellItem {
    
    let item: MovieDetails
    weak var delegate: MovieStoryLineSectionCellItemDelegate?
    
    init(item: MovieDetails, delegate:  MovieStoryLineSectionCellItemDelegate? = nil) {
        self.item = item
        self.delegate = delegate
    }
    
    func cellForItem(at indexPath: IndexPath, in collectionView: UICollectionView) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieStoryLineCollectionViewCell.identifier, for: indexPath) as? MovieStoryLineCollectionViewCell else {
            fatalError("Unsupported")
        }
        cell.configure(with: item)
        return cell
    }
    
}

extension MovieStoryLineSectionCellItem: MovieStoryLineSectionCellDelegate {
    func didTapOnMoreButton(in cell: MovieStoryLineCollectionViewCell) {
        delegate?.movieStoryLineCollectionViewCellItemDidSelect(cell: cell, cellItem: self)
    }
}

