//
//  MovieSectionCellItem.swift
//  Movie-app
//
//  Created by Asif-emumba on 19/01/2025.
//

import Foundation
import UIKit

protocol MovieCollectionViewCellItemDelegate: AnyObject {
    func movieCollectionViewCellItemDidSelect(cell: MovieCollectionViewCell, cellItem: MovieSectionCellItem)
}

final class MovieSectionCellItem: CollectionViewCellItem {
    
    let item: MovieDetails
    weak var delegate: MovieCollectionViewCellItemDelegate? = nil
    
    init(item: MovieDetails, delegate:  MovieCollectionViewCellItemDelegate? = nil){
        self.item = item
        self.delegate = delegate
    }
    
    func cellForItem(at indexPath: IndexPath, in collectionView: UICollectionView) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifier, for: indexPath) as? MovieCollectionViewCell else {
            fatalError("Unsupported")
        }
        cell.configure(with: item)
        cell.delegate = self
        return cell
    }
    
}

extension MovieSectionCellItem: MoviesSectionCellDelegate {
    func movieCollectionViewCellDidSelect(cell: MovieCollectionViewCell) {
        delegate?.movieCollectionViewCellItemDidSelect(cell: cell, cellItem: self)
    }
}
