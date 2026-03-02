//
//  Tax.swift
//  Stripe
//
//  Created by Jonathan Holland on 6/5/22.
//

import Foundation

public struct Tax: Codable, Sendable {
    /// Amount of tax applied for this rate.
    public let amount: Int
    /// The tax rate applied
    public let rate: Rate
    
    /// Designated initializer
    public init(amount: Int, rate: Rate) {
        self.amount = amount
        self.rate = rate
    }
}
