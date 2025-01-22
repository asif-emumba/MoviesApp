//
//  UpComingMovieSectionCellItem.swift
//  Movie-app
//
//  Created by Asif-emumba on 21/01/2025.
//

import Foundation
import UIKit

protocol UpComingMovieCollectionViewCellItemDelegate: AnyObject {
    func upComingMovieCollectionViewCellItemDidSelect(cell: UpComingMovieCollectionViewCell, cellItem: UpComingMovieSectionCellItem)
}

final class UpComingMovieSectionCellItem: CollectionViewCellItem {
    
    let item: MovieDetails
    weak var delegate: UpComingMovieCollectionViewCellItemDelegate? = nil
    
    init(item: MovieDetails, delegate: UpComingMovieCollectionViewCellItemDelegate? = nil) {
        self.item = item
        self.delegate = delegate
    }
    func cellForItem(at indexPath: IndexPath, in collectionView: UICollectionView) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UpComingMovieCollectionViewCell.identifier, for: indexPath) as? UpComingMovieCollectionViewCell else {
            fatalError("Unsupported")
        }
        cell.configure(with: item)
        cell.delegate = self
        return cell
    }
}

extension UpComingMovieSectionCellItem: UpComingMovieCollectionViewCellDelegate{
    func upComingMovieCollectionViewCellDidSelect(cell: UpComingMovieCollectionViewCell) {
        delegate?.upComingMovieCollectionViewCellItemDidSelect(cell: cell, cellItem: self)
    }
}
