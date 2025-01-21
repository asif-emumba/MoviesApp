//
//  MovieSectionCellItem.swift
//  Movie-app
//
//  Created by Asif-emumba on 19/01/2025.
//

import Foundation
import UIKit

protocol MovieCollectionViewCellItemDelegate: AnyObject {
    func MovieCollectionViewCellItemDidSelect(cell: MoviesSectionCell, cellItem: MoviesCellItem)
}

final class MoviesCellItem: CollectionViewCellItem {
    
    let item: MovieDetails
    weak var delegate: MovieCollectionViewCellItemDelegate? = nil
    
    init(item: MovieDetails, delegate:  MovieCollectionViewCellItemDelegate? = nil){
        self.item = item
        self.delegate = delegate
    }
    
    func cellForItem(at indexPath: IndexPath, in collectionView: UICollectionView) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoviesSectionCell.identifier, for: indexPath) as? MoviesSectionCell else {
            fatalError("Unsupported")
        }
        cell.configure(with: item)
        cell.delegate = self
        return cell
    }
    
}

extension MoviesCellItem: MoviesSectionCellDelegate {
    func MovieCollectionViewCellDidSelect(cell: MoviesSectionCell) {
        delegate?.MovieCollectionViewCellItemDidSelect(cell: cell, cellItem: self)
    }
}
