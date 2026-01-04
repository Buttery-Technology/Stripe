//
//  Billing.swift
//  Stripe
//
//  Created by Jonathan Holland on 6/5/22.
//

import Foundation

public struct Billing: Codable {
    /// Billing address for the order.
    public let address: Address?
    /// Email address for the order.
    public let email: String?
    /// Full name for the order.
    public let name: String?
    /// Billing phone number for the order (including extension).
    public let phone: String?
    /// Taxpayer identification number. Used only for transactions between LATAM buyers and non-LATAM sellers.
    public let taxId: String?

    /// Designated initializer
    public init(address: Address?, email: String?, name: String?, phone: String?, taxId: String?) {
        self.address = address
        self.email = email
        self.name = name
        self.phone = phone
        self.taxId = taxId
    }

    public enum CodingKeys: String, CodingKey {
        case address,
             email,
             name,
             phone,
             taxId = "tax_id"
    }
}
