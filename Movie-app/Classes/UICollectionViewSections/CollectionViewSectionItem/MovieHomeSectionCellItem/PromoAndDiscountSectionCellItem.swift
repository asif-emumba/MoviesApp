//
//  PromoAndDiscountSectionCellItem.swift
//  Movie-app
//
//  Created by Asif-emumba on 23/01/2025.
//

import Foundation
import UIKit

final class PromoAndDiscountSectionCellItem: CollectionViewCellItem {
    
    func cellForItem(at indexPath: IndexPath, in collectionView: UICollectionView) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PromoAndDiscountCollectionViewCell.identifier, for: indexPath) as! PromoAndDiscountCollectionViewCell
        return cell
    }
    
}
