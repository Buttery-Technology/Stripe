//
//  Dimensions.swift
//  Stripe
//
//  Created by Jonathan Holland on 6/5/22.
//

import Foundation

public struct Dimensions: Codable, Sendable {
    public let height: Decimal
    public let length: Decimal
    public let weight: Decimal
    public let width: Decimal
    
    /// Designated initializer
    public init(height: Decimal, length: Decimal, weight: Decimal, width: Decimal) {
        self.height = height
        self.length = length
        self.weight = weight
        self.width = width
    }
}
