//
//  AutomaticTax.swift
//  Stripe
//
//  Created by Jonathan Holland on 6/5/22.
//

import Foundation

public struct AutomaticTax: Codable {
    public let enabled: Bool
    public let requiresLocationInputs: Bool
    public let status: Self.Status?

    /// Designated initializer
    public init(enabled: Bool, requiresLocationInputs: Bool, status: Self.Status?) {
        self.enabled = enabled
        self.requiresLocationInputs = requiresLocationInputs
        self.status = status
    }

    public enum CodingKeys: String, CodingKey {
        case enabled,
             requiresLocationInputs = "requires_location_inputs",
             status
    }

    public enum Status: String, Codable {
        case requiresLocationInputs = "requires_location_inputs", complete, failed
    }
}
