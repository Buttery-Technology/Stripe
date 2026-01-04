//
//  Shipping.swift
//  Stripe
//
//  Created by Jonathan Holland on 6/5/22.
//

import Foundation

public struct Shipping: Codable {
    public let address: Address?
    public let name: String?
    public let carrier: String?
    public let phone: String?
    public let trackingNumber: String?

    /// Designated initializer
    public init(address: Address?, name: String?, carrier: String?, phone: String?, trackingNumber: String?) {
        self.address = address
        self.name = name
        self.carrier = carrier
        self.phone = phone
        self.trackingNumber = trackingNumber
    }

    public enum CodingKeys: String, CodingKey {
        case address, name, carrier, phone
        case trackingNumber = "tracking_number"
    }
}
