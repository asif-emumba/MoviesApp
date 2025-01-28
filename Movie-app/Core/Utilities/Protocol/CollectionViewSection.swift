//
//  CollectionViewSection.swift
//  Movie-app
//
//  Created by Asif-emumba on 19/01/2025.
//

import Foundation
import UIKit

protocol CollectionViewSection {
    var headerTitle: String? { set get }
    //number of items in a single section 
    var items: [CollectionViewCellItem] { set get }
    //section layout
    var layoutSection: NSCollectionLayoutSection { get }
}
