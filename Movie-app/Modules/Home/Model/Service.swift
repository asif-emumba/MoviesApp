//
//  Service.swift
//  Movie-app
//
//  Created by Asif-emumba on 23/01/2025.
//

import Foundation
import UIKit

struct Service: Codable {
    let id: Int
    let name: String
    let image: String?
}

extension Service {
    static var mockData: [Service] {
        return [
            Service(id: 1, name: "Retal", image: Assets.Services.icService1),
            Service(id: 2, name: "Imax", image: Assets.Services.icService2),
            Service(id: 3, name: "4DX", image: Assets.Services.icService3),
            Service(id: 4, name: "Sweetbox", image: Assets.Services.icService4)
        ]
    }
}



