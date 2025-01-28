//
//  Cinema.swift
//  Movie-app
//
//  Created by Asif-emumba on 27/01/2025.
//

import Foundation

struct Cinema: Codable {
    let id: Int
    let name: String
    let address: String
    let city: String
    let logo: String
    let price: String
    var isSelected: Bool
}

extension Cinema {
    static var mockData: [Cinema] {
        return [
            Cinema(id: 1, name: "Vincom Ocean Park CGV", address: "4.55 km | Da Ton, Gia Lam", city: "Ha Noi", logo: Assets.Cinema.icCinema, price: "210.000 VND", isSelected: false),
            Cinema(id: 2, name: "Aeon Mall CGV", address: "9.32 km | 27 Co Linh, Long Bien", city: "Ha Noi", logo: Assets.Cinema.icCinema2,price: "260.000 VND", isSelected: false),
            Cinema(id: 3, name: "Lotte Cinema Long Bien", address: "14.3 km | 7-9 Nguyen Van Linh, Long Bien", city: "Ha Noi", logo: Assets.Cinema.icCinema,price: "290.000 VND", isSelected: false)
        ]
    }
}
