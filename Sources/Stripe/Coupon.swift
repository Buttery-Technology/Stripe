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
    public let created: Int
    public let currency: String?
    public let duration: Duration
    public let durationInMonths: Int?
    public let livemode: Bool
    public let maxRedemptions: Int?
    public let metadata: Metadata?
    public let name: String?
    public let percentOff: Double?
    /// The timestamp, represented in milliseconds from 1970, from which this coupon can be redeemed.
    public let redeemBy: Int?
    public let timesRedeemed: Int
    public let valid: Bool
    
    /// Designated initializer
    public init(id: String, object: String, amountOff: Int?, created: Int, currency: String?, duration: Duration, durationInMonths: Int?, livemode: Bool, maxRedemptions: Int?, metadata: Metadata?, name: String?, percentOff: Double?, redeemBy: Int?, timesRedeemed: Int, valid: Bool) {
        self.id = id
        self.object = object
        self.amountOff = amountOff
        self.created = created
        self.currency = currency
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
        case created, currency, duration
        case durationInMonths = "duration_in_months"
        case livemode
        case maxRedemptions = "max_redemptions"
        case metadata, name
        case percentOff = "percent_off"
        case redeemBy = "redeem_by"
        case timesRedeemed = "times_redeemed"
        case valid
    }
}
