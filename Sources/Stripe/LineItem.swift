//
//  LineItem.swift
//  Stripe
//
//  Created by Jonathan Holland on 6/5/22.
//

import Foundation

public struct LineItem: Codable {
    /// String representing the object’s type.
    ///
    /// Objects of the same type share the same value. Always has the value `list`.
    public let object: String
    /// Details about each object.
    public let data: LineItemData
    /// True if this list has another page of items after this one that can be fetched.
    public let hasMore: Bool
    /// The `URL` where this list can be accessed.
    public let url: String
    
    /// Designated initializer
    public init(object: String, data: LineItemData, hasMore: Bool, url: String) {
        self.object = object
        self.data = data
        self.hasMore = hasMore
        self.url = url
    }
    
    public enum CodingKeys: String, CodingKey {
        case object,
             data,
             hasMore = "has_more",
             url
    }
}

extension LineItem {
    public struct LineItemData: Codable {
        /// Unique identifier for the object.
        public let id: String
        /// String representing the object’s type.
        ///
        /// Objects of the same type share the same value. Value is “item”.
        public let object: String
        /// Total discount amount applied. If no discounts were applied, defaults to 0.
        public let amountDiscount: Int
        /// Total before any discounts or taxes are applied.
        public let amountSubtotal: Int
        /// Total tax amount applied. If no tax was applied, defaults to 0.
        public let amountTax: Int
        /// Total after discounts and taxes.
        public let amountTotal: Int
        /// Three-letter [ISO currency code](https://www.iso.org/iso-4217-currency-codes.html), in lowercase. Must be a [supported currency](https://stripe.com/docs/currencies).
        public let currency: String
        /// An arbitrary string attached to the object. Often useful for displaying to users. Defaults to product name.
        public let itemDescription: String?
        /// The discounts applied to the line item. This field is not included by default. To include it in the response, [expand](https://stripe.com/docs/api/expanding_objects) the `discounts` field.
        public let discounts: [LineItemDataDiscount]
        /// The price used to generate the line item.
        public let price: Price
        /// The ID of the product for this line item.
        /// This will always be the same as `price.product`.
        public let product: Product.Expandable
        /// The quantity of products being purchased.
        public let quantity: Int
        public let taxes: [Tax]?
        
        /// Designated initializer
        public init(id: String, object: String, amountDiscount: Int, amountSubtotal: Int, amountTax: Int, amountTotal: Int, currency: String, itemDescription: String?, discounts: [LineItemDataDiscount], price: Price, product: Product.Expandable, quantity: Int, taxes: [Tax]?) {
            self.id = id
            self.object = object
            self.amountDiscount = amountDiscount
            self.amountSubtotal = amountSubtotal
            self.amountTax = amountTax
            self.amountTotal = amountTotal
            self.currency = currency
            self.itemDescription = itemDescription
            self.discounts = discounts
            self.price = price
            self.product = product
            self.quantity = quantity
            self.taxes = taxes
        }
        
        public enum CodingKeys: String, CodingKey {
            case id,
                 object,
                 amountDiscount = "amount_discount",
                 amountSubtotal = "amount_subtotal",
                 amountTax = "amount_tax",
                 amountTotal = "amount_total",
                 currency,
                 itemDescription = "description",
                 discounts,
                 price,
                 product,
                 quantity,
                 taxes
        }
        
        public struct LineItemDataDiscount: Codable {
            /// The amount discounted.
            public let amount: Int
            /// The discount applied.
            public let discount: Discount
            
            /// Designated initializer
            public init(amount: Int, discount: Discount) {
                self.amount = amount
                self.discount = discount
            }
        }
    }
}
