//
//  SeatGridSection.swift
//  Movie-app
//
//  Created by Asif-emumba on 27/01/2025.
//

import Foundation
import UIKit

final class SeatGridSection: CollectionViewSection {
    
    var headerTitle: String?
    var items: [CollectionViewCellItem]
    
    init(headerTitle: String, items: [CollectionViewCellItem]) {
        self.items = items
        self.headerTitle = headerTitle
    }
    
    var layoutSection: NSCollectionLayoutSection {
            // Define item size for each seat
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .absolute(28),
            heightDimension: .absolute(28)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
            // Set spacing between items
        item.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4)
        
            // Group items into rows (row-wise grouping)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(28)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitem: item,
            count: 12 // Number of seats per row (columns)
        )
        
            // Set section configuration
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 8 // Space between rows
        section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 0, bottom: 10, trailing: 0)
        return section
    }

}
