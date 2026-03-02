//
//  ShippingCost.swift
//  Stripe
//
//  Created by Jonathan Holland on 6/5/22.
//

import Foundation

public struct ShippingCost: Codable, Sendable {
    /// Total shipping cost before any discounts or taxes are applied.
    public let amountSubtotal: Int
    /// Total tax amount applied due to shipping costs. If no tax was applied, defaults to 0.
    public let amountTax: Int
    /// Total shipping cost after discounts and taxes are applied.
    public let amountTotal: Int
    /// The ID of the ShippingRate for this order.
    public let shippingRate: String
    /// The taxes applied to the shipping rate. This field is not included by default. To include it in the response, [expand](https://stripe.com/docs/api/expanding_objects) the taxes field.
    public let taxes: [Tax]
    
    /// Designated initializer
    public init(amountSubtotal: Int, amountTax: Int, amountTotal: Int, shippingRate: String, taxes: [Tax]) {
        self.amountSubtotal = amountSubtotal
        self.amountTax = amountTax
        self.amountTotal = amountTotal
        self.shippingRate = shippingRate
        self.taxes = taxes
    }
    
    public enum CodingKeys: String, CodingKey {
        case amountSubtotal = "amount_subtotal", amountTax = "amount_tax", amountTotal = "amount_total", shippingRate = "shipping_rate", taxes
    }
}
