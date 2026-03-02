//
//  TotalDetails.swift
//  Stripe
//
//  Created by Jonathan Holland on 6/5/22.
//

import Foundation

public struct TotalDetails: Codable, Sendable {
    /// This is the sum of all the discounts.
    public let amountDiscount: Int
    /// This is the sum of all the shipping amounts.
    public let amountShipping: Int
    /// This is the sum of all the tax amounts.
    public let amountTax: Int
    /// Breakdown of individual tax and discount amounts that add up to the totals. This field is not included by default. To include it in the response, [expand](https://stripe.com/docs/api/expanding_objects) the `breakdown` field.
    public let breakdown: Breakdown?
    
    /// Designated initializer
    public init(amountDiscount: Int, amountShipping: Int, amountTax: Int, breakdown: Breakdown?) {
        self.amountDiscount = amountDiscount
        self.amountShipping = amountShipping
        self.amountTax = amountTax
        self.breakdown = breakdown
    }
    
    public enum CodingKeys: String, CodingKey {
        case amountDiscount = "amount_discount"
        case amountShipping = "amount_shipping"
        case amountTax = "amount_tax"
        case breakdown
    }
    
    public struct Breakdown: Codable, Sendable {
        /// The aggregated discounts.
        public let discounts: [BreakdownDiscount]
        
        /// Designated initializer
        public init(discounts: [BreakdownDiscount]) {
            self.discounts = discounts
        }
        
        public struct BreakdownDiscount: Codable, Sendable {
            /// The amount discounted.
            public let amount: Int
            /// The discount applied.
            public let discount: Discount
            /// The aggregated tax amounts by rate.
            public let taxes: [Tax]
            
            /// Designated initializer
            public init(amount: Int, discount: Discount, taxes: [Tax]) {
                self.amount = amount
                self.discount = discount
                self.taxes = taxes
            }
        }
    }
}
