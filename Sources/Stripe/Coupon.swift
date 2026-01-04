//
//  Coupon.swift
//  Stripe
//
//  Created by Jonathan Holland on 6/5/22.
//

import Foundation

public struct Coupon: Codable {
    public let id, object: String
    public let amountOff: Int?
    /// Specifies which products or prices the coupon applies to.
    public let appliesTo: AppliesTo?
    public let created: TimeInterval
    public let currency: String?
    /// Multi-currency amounts for fixed-amount coupons.
    public let currencyOptions: [String: CurrencyOption]?
    public let duration: Duration
    public let durationInMonths: Int?
    public let livemode: Bool
    public let maxRedemptions: Int?
    public let metadata: Metadata?
    public let name: String?
    public let percentOff: Double?
    /// The timestamp from which this coupon can be redeemed. Measured in seconds since the Unix epoch.
    public let redeemBy: TimeInterval?
    public let timesRedeemed: Int
    public let valid: Bool
    
    /// Designated initializer
    public init(id: String, object: String, amountOff: Int?, appliesTo: AppliesTo?, created: TimeInterval, currency: String?, currencyOptions: [String: CurrencyOption]?, duration: Duration, durationInMonths: Int?, livemode: Bool, maxRedemptions: Int?, metadata: Metadata?, name: String?, percentOff: Double?, redeemBy: TimeInterval?, timesRedeemed: Int, valid: Bool) {
        self.id = id
        self.object = object
        self.amountOff = amountOff
        self.appliesTo = appliesTo
        self.created = created
        self.currency = currency
        self.currencyOptions = currencyOptions
        self.duration = duration
        self.durationInMonths = durationInMonths
        self.livemode = livemode
        self.maxRedemptions = maxRedemptions
        self.metadata = metadata
        self.name = name
        self.percentOff = percentOff
        self.redeemBy = redeemBy
        self.timesRedeemed = timesRedeemed
        self.valid = valid
    }

    public enum CodingKeys: String, CodingKey {
        case id, object
        case amountOff = "amount_off"
        case appliesTo = "applies_to"
        case created, currency
        case currencyOptions = "currency_options"
        case duration
        case durationInMonths = "duration_in_months"
        case livemode
        case maxRedemptions = "max_redemptions"
        case metadata, name
        case percentOff = "percent_off"
        case redeemBy = "redeem_by"
        case timesRedeemed = "times_redeemed"
        case valid
    }

    // MARK: - Applies To
    /// Specifies which products or prices the coupon applies to.
    public struct AppliesTo: Codable {
        /// A list of product IDs this coupon applies to.
        public let products: [String]?
        /// A list of price IDs this coupon applies to.
        public let prices: [String]?

        public init(products: [String]?, prices: [String]?) {
            self.products = products
            self.prices = prices
        }
    }

    // MARK: - Currency Option
    /// Multi-currency amount for fixed-amount coupons.
    public struct CurrencyOption: Codable {
        /// Amount (in the currency specified) that will be taken off.
        public let amountOff: Int

        public init(amountOff: Int) {
            self.amountOff = amountOff
        }

        public enum CodingKeys: String, CodingKey {
            case amountOff = "amount_off"
        }
    }
}
