//
//  MovieDetailsCoverSectionCellItem.swift
//  Movie-app
//
//  Created by Asif-emumba on 24/01/2025.
//

import Foundation
import UIKit

final class MovieDetailsCoverSectionCellItem: CollectionViewCellItem {
    
    let item: MovieDetails
    
    init(item: MovieDetails ) {
        self.item = item
    }
    
    func cellForItem(at indexPath: IndexPath, in collectionView: UICollectionView) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieDetailsCoverCollectionViewCell.identifier, for: indexPath) as? MovieDetailsCoverCollectionViewCell else {
            fatalError("Unsupported")
        }
        cell.configure(with: item)
        return cell
    }
    
}
