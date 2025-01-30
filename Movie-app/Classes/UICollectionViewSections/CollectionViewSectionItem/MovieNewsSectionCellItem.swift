//
//  MovieNewsSectionCellItem.swift
//  Movie-app
//
//  Created by Asif-emumba on 23/01/2025.
//

import Foundation
import UIKit

final class MovieNewsSectionCellItem: CollectionViewCellItem {
    
    let item: MovieNews
    init(item: MovieNews) {
        self.item = item
    }
    
    func cellForItem(at indexPath: IndexPath, in collectionView: UICollectionView) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieNewsCollectionViewCell.identifier, for: indexPath) as? MovieNewsCollectionViewCell else {
            fatalError("Unsupported")
        }
        cell.configure(with: item)
        return cell
    }
    
}
