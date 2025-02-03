//
//  TimeSection.swift
//  Movie-app
//
//  Created by Asif-emumba on 28/01/2025.
//

import Foundation
import UIKit

final class TimeSection: CollectionViewSection {
    
    var headerTitle: String?
    var items: [CollectionViewCellItem]
    
    init(headerTitle: String, items: [CollectionViewCellItem]) {
        self.items = items
        self.headerTitle = headerTitle
    }
    
    var layoutSection: NSCollectionLayoutSection {
        // Define the item size for the category buttons
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(89),
                                              heightDimension: .absolute(36))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        // Define the group size for the horizontal scrollable category buttons
        let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(1200),
                                               heightDimension: .estimated(36))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        // Define the section and its boundary supplementary items
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 16
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 16, bottom: 20, trailing: 16)
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
    
}
