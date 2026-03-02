//
//  CustomField.swift
//  Stripe
//
//  Created by Jonathan Holland on 6/5/22.
//

import Foundation

public struct CustomField: Codable, Sendable {
    public let field: String
    public let value: String
    
    /// Designated initializer
    public init(field: String, value: String) {
        self.field = field
        self.value = value
    }
}
