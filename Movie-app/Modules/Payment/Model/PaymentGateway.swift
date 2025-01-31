//
//  PaymentGateway.swift
//  Movie-app
//
//  Created by Asif-emumba on 28/01/2025.
//

import Foundation

struct PaymentGateway: Codable {
    let id: Int
    let name: String
    let details: String
    let logo: String
    var isSelected: Bool
}

extension PaymentGateway {
    static var mockData: [PaymentGateway] {
        return [
            PaymentGateway(id: 1, name: "Zalo Pay", details: "", logo: Assets.Payment.icPayment1, isSelected: false),
            PaymentGateway(id: 2, name: "MoMo", details: "", logo: Assets.Payment.icPayment2, isSelected: false),
            PaymentGateway(id: 3, name: "Shopee Pay", details: "", logo: Assets.Payment.icPayment3, isSelected: false),
            PaymentGateway(id: 4, name: "ATM Card", details: "", logo: Assets.Payment.icPayment4, isSelected: false),
            PaymentGateway(id: 5, name: "Internation payments", details: "(Visa, Master, JCB, Amex)", logo: Assets.Payment.icPayment5, isSelected: false)
        ]
    }
}
