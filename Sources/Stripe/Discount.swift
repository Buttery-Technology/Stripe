//
//  Discount.swift
//  Stripe
//
//  Created by Jonathan Holland on 6/5/22.
//

import Foundation

public struct Discount: Codable {
    public let id, object: String
    public let checkoutSession: String?
    public let coupon: Coupon
    public let customer: String
    public let end: Int
    public let invoice, invoiceItem, promotionCode: String?
    public let start: Int
    public let subscription: String?
    
    /// Designated initializer
    public init(id: String, object: String, checkoutSession: String?, coupon: Coupon, customer: String, end: Int, invoice: String?, invoiceItem: String?, promotionCode: String?, start: Int, subscription: String?) {
        self.id = id
        self.object = object
        self.checkoutSession = checkoutSession
        self.coupon = coupon
        self.customer = customer
        self.end = end
        self.invoice = invoice
        self.invoiceItem = invoiceItem
        self.promotionCode = promotionCode
        self.start = start
        self.subscription = subscription
    }
    
    public enum CodingKeys: String, CodingKey {
        case id, object
        case checkoutSession = "checkout_session"
        case coupon, customer, end, invoice
        case invoiceItem = "invoice_item"
        case promotionCode = "promotion_code"
        case start, subscription
    }
}
