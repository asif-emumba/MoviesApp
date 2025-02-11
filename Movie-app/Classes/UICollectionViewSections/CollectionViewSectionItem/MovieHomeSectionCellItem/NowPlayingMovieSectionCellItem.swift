//
//  NowPlayingMovieSectionCellItem.swift
//  Movie-app
//
//  Created by Asif-emumba on 19/01/2025.
//

import Foundation
import UIKit

protocol NowPlayingMovieCollectionViewCellItemDelegate: AnyObject {
    func movieCollectionViewCellItemDidSelect(cell: NowPlayingMoviesCollectionViewCell, cellItem: NowPlayingMovieSectionCellItem)
}

final class NowPlayingMovieSectionCellItem: CollectionViewCellItem {
    
    let item: MovieDetails
    weak var delegate: NowPlayingMovieCollectionViewCellItemDelegate? = nil
    
    init(item: MovieDetails, delegate:  NowPlayingMovieCollectionViewCellItemDelegate? = nil) {
        self.item = item
        self.delegate = delegate
    }
    
    func cellForItem(at indexPath: IndexPath, in collectionView: UICollectionView) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NowPlayingMoviesCollectionViewCell.identifier, for: indexPath) as? NowPlayingMoviesCollectionViewCell else {
            fatalError("Unsupported")
        }
        cell.configure(with: item)
        cell.delegate = self
        return cell
    }
    
}

extension NowPlayingMovieSectionCellItem: NowPlayingMoviesSectionCellDelegate {
    func movieCollectionViewCellDidSelect(cell: NowPlayingMoviesCollectionViewCell) {
        delegate?.movieCollectionViewCellItemDidSelect(cell: cell, cellItem: self)
    }
}
