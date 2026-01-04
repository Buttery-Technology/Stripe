//
//  Discount.swift
//  Stripe
//
//  Created by Jonathan Holland on 6/5/22.
//

import Foundation

public struct Discount: Codable {
    public let id: String
    public let object: String
    public let checkoutSession: String?
    public let coupon: Coupon
    public let customer: String?
    /// ID of the CustomerAccount associated with this discount, if one exists.
    public let customerAccount: String?
    /// Date the discount ends. Measured in seconds since the Unix epoch.
    public let end: TimeInterval?
    public let invoice: String?
    public let invoiceItem: String?
    public let promotionCode: String?
    /// Date the discount started. Measured in seconds since the Unix epoch.
    public let start: TimeInterval
    public let subscription: String?
    public let subscriptionItem: String?

    /// Designated initializer
    public init(id: String, object: String, checkoutSession: String?, coupon: Coupon, customer: String?, customerAccount: String?, end: TimeInterval?, invoice: String?, invoiceItem: String?, promotionCode: String?, start: TimeInterval, subscription: String?, subscriptionItem: String?) {
        self.id = id
        self.object = object
        self.checkoutSession = checkoutSession
        self.coupon = coupon
        self.customer = customer
        self.customerAccount = customerAccount
        self.end = end
        self.invoice = invoice
        self.invoiceItem = invoiceItem
        self.promotionCode = promotionCode
        self.start = start
        self.subscription = subscription
        self.subscriptionItem = subscriptionItem
    }
    
    public enum CodingKeys: String, CodingKey {
        case id, object
        case checkoutSession = "checkout_session"
        case coupon, customer
        case customerAccount = "customer_account"
        case end, invoice
        case invoiceItem = "invoice_item"
        case promotionCode = "promotion_code"
        case start, subscription
        case subscriptionItem = "subscription_item"
    }
}
