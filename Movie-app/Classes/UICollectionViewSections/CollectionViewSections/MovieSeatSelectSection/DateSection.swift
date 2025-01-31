//
//  DateSection.swift
//  Movie-app
//
//  Created by Asif-emumba on 27/01/2025.
//

import Foundation
import UIKit

final class DateSection: CollectionViewSection {
    
    var headerTitle: String?
    var items: [CollectionViewCellItem]
    
    init(headerTitle: String, items: [CollectionViewCellItem]) {
        self.items = items
        self.headerTitle = headerTitle
    }
    
    var layoutSection: NSCollectionLayoutSection {
        // Define the item size for the category buttons
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(52),
                                              heightDimension: .absolute(104))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        // Define the group size for the horizontal scrollable category buttons
        let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(1200),
                                               heightDimension: .estimated(104))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        // Define the section and its boundary supplementary items
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 16
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 16, bottom: 20, trailing: 16)
        section.orthogonalScrollingBehavior = .continuous
        // Add a header to the section
        if headerTitle != nil {
            let headerSize = NSCollectionLayoutSize(widthDimension: .absolute(300),
                                                    heightDimension: .absolute(47))
            let header = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: headerSize,
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .top
            )
            
            header.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 50, bottom: 0, trailing: 0)
            section.boundarySupplementaryItems = [header]
        }
        return section
    }
    
}
