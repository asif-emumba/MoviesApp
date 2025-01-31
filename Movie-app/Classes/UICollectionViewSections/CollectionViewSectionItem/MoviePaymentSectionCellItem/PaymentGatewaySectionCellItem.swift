//
//  PaymentGatewaySectionCellItem.swift
//  Movie-app
//
//  Created by Asif-emumba on 28/01/2025.
//

import Foundation
import UIKit

protocol PaymentGatewaySectionCellItemDelegate: AnyObject {
    func paymentGatewaySectionCellItemDidSelect(cell: PaymentGatewayCollectionViewCell, cellItem: PaymentGatewaySectionCellItem)
}

final class PaymentGatewaySectionCellItem: CollectionViewCellItem {
    
    let item: PaymentGateway
    var isSelected: Bool
    weak var delegate: PaymentGatewaySectionCellItemDelegate?
    init(item: PaymentGateway, isSelected: Bool, delegate: PaymentGatewaySectionCellItemDelegate? = nil) {
        self.item = item
        self.isSelected = isSelected
        self.delegate = delegate
    }
    func cellForItem(at indexPath: IndexPath, in collectionView: UICollectionView) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PaymentGatewayCollectionViewCell.identifier, for: indexPath) as? PaymentGatewayCollectionViewCell else {
            fatalError("Unsupported")
        }
        cell.configure(with: item, isSelected: isSelected)
        cell.delegate = self
        return cell
    }
}

extension PaymentGatewaySectionCellItem: PaymentGatewayCollectionViewCellDelegate {
    func isSelectedPaymentMethod(cell: PaymentGatewayCollectionViewCell) {
        delegate?.paymentGatewaySectionCellItemDidSelect(cell: cell, cellItem: self)
    }
}
