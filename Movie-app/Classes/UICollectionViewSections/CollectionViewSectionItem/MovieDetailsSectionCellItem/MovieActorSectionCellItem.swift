//
//  MovieActorSectionCellItem.swift
//  Movie-app
//
//  Created by Asif-emumba on 27/01/2025.
//

import Foundation
import UIKit

final class MovieActorSectionCellItem: CollectionViewCellItem {
    
    let item: Cast
    
    init(item: Cast) {
        self.item = item
    }
    
    func cellForItem(at indexPath: IndexPath, in collectionView: UICollectionView) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieDirectorCollectionViewCell.identifier, for: indexPath) as? MovieDirectorCollectionViewCell else {
            fatalError("Unsupported")
        }
        cell.configure(with: item)
        return cell
    }
    
}
