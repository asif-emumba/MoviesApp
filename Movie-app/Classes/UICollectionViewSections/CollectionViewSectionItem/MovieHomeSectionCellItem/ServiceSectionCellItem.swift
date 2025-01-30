//
//  ServiceSectionCellItem.swift
//  Movie-app
//
//  Created by Asif-emumba on 23/01/2025.
//

import Foundation
import UIKit

final class ServiceSectionCellItem: CollectionViewCellItem {
    
    let item: Service
    init(item: Service) {
        self.item = item
    }
    
    func cellForItem(at indexPath: IndexPath, in collectionView: UICollectionView) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ServicesCollectionViewCell.identifier, for: indexPath) as? ServicesCollectionViewCell else {
            fatalError("Unsupported")
        }
        cell.configure(with: item)
        return cell
    }
    
}
