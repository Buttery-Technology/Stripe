//
//  Address.swift
//  Stripe
//
//  Created by Jonathan Holland on 6/5/22.
//

import Foundation

public struct Address: Codable {
    public let city: String?
    public let country: String?
    public let line1: String?
    public let line2: String?
    public let postalCode: String?
    public let state: String?

    /// Designated initializer
    public init(city: String?, country: String?, line1: String?, line2: String?, postalCode: String?, state: String?) {
        self.city = city
        self.country = country
        self.line1 = line1
        self.line2 = line2
        self.postalCode = postalCode
        self.state = state
    }
    
    enum CodingKeys: String, CodingKey {
        case city,
             country,
             line1,
             line2,
             postalCode = "postal_code",
             state
    }
}
