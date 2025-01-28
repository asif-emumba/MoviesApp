//
//  SeatStatusSection.swift
//  Movie-app
//
//  Created by Asif-emumba on 27/01/2025.
//

import Foundation
import UIKit

final class SeatStatusSection: CollectionViewSection {
    
    var headerTitle: String?
    var items: [CollectionViewCellItem]
    
    init(headerTitle: String, items: [CollectionViewCellItem]) {
        self.items = items
        self.headerTitle = headerTitle
    }
    
    var layoutSection: NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0 / 3.0),
            heightDimension: .absolute(24)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(24)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 16, bottom: 20, trailing: 0)
        section.orthogonalScrollingBehavior = .none
        return section
    }
}
