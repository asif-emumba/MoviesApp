//
//  UserInfoSection.swift
//  Movie-app
//
//  Created by Asif-emumba on 20/01/2025.
//

import Foundation
import UIKit

final class UserInfoSection: CollectionViewSection {
    
    var headerTitle: String?
    var items: [CollectionViewCellItem]
    init(headerTitle: String, items: [CollectionViewCellItem]) {
        self.items = items
        self.headerTitle = headerTitle
    }
    
    var layoutSection: NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .absolute(63))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .estimated(70))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 16, bottom: 10, trailing: 16)
        section.orthogonalScrollingBehavior = .none // Ensures it's non-scrollable
        return section
    }
    
}

