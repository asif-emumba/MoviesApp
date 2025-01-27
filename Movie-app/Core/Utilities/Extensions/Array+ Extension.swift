//
//  Array+ extension.swift
//  Movie-app
//
//  Created by Asif-emumba on 26/01/2025.
//

import Foundation

extension Array {
    func unique<T: Hashable>(by key: (Element) -> T) -> [Element] {
        var seen = Set<T>()
        return filter { seen.insert(key($0)).inserted }
    }
}

