//
//  InvoiceSettings.swift
//  Stripe
//
//  Created by Jonathan Holland on 6/5/22.
//

import Foundation

public struct InvoiceSettings: Codable {
    public let customFields: [CustomField]?
    public let defaultPaymentMethod: String?
    public let footer: String?
    
    /// Designated initializer
    public init(customFields: [CustomField]?, defaultPaymentMethod: String?, footer: String?) {
        self.customFields = customFields
        self.defaultPaymentMethod = defaultPaymentMethod
        self.footer = footer
    }
    
    public enum CodingKeys: String, CodingKey {
        case customFields = "custom_fields"
        case defaultPaymentMethod = "default_payment_method"
        case footer
    }
}
