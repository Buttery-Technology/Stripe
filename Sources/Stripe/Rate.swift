//
//  Rate.swift
//  Stripe
//
//  Created by Jonathan Holland on 6/5/22.
//

import Foundation

public struct Rate: Codable {
    /// Unique identifier for the object.
    public let id: String
    /// String representing the object’s type. Objects of the same type share the same value.
    public let object: String
    /// Defaults to `true`. When set to `false`, this tax rate cannot be used with new applications or Checkout Sessions, but will still work for subscriptions and invoices that already have it set.
    public let active: Bool
    /// Two-letter country code ([ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2)).
    public let country: String
    /// Time at which the object was created. Measured in seconds since the Unix epoch.
    public let created: Int
    /// An arbitrary string attached to the tax rate for your internal use only. It will not be visible to your customers.
    public let rateDescription: String
    /// The display name of the tax rates as it will appear to your customer on their receipt email, PDF, and the hosted invoice page.
    public let displayName: String
    /// This specifies if the tax rate is inclusive or exclusive.
    public let inclusive: Bool
    /// The jurisdiction for the tax rate. You can use this label field for tax reporting purposes. It also appears on your customer’s invoice.
    public let jurisdiction: String
    /// Has the value true if the object exists in live mode or the value false if the object exists in test mode.
    public let livemode: Bool
    /// Set of key-value pairs that you can attach to an object. This can be useful for storing additional information about the object in a structured format.
    public let metadata: Metadata?
    /// This represents the tax rate percent out of 100.
    public let percentage: Decimal
    /// [ISO 3166-2 subdivision code](https://en.wikipedia.org/wiki/ISO_3166-2:US), without country prefix. For example, “NY” for New York, United States.
    public let state: String
    /// The high-level tax type, such as `vat` or `sales_tax`.
    public let taxType: String
    
    /// Designated initializer
    public init(id: String, object: String, active: Bool, country: String, created: Int, rateDescription: String, displayName: String, inclusive: Bool, jurisdiction: String, livemode: Bool, metadata: Metadata?, percentage: Decimal, state: String, taxType: String) {
        self.id = id
        self.object = object
        self.active = active
        self.country = country
        self.created = created
        self.rateDescription = rateDescription
        self.displayName = displayName
        self.inclusive = inclusive
        self.jurisdiction = jurisdiction
        self.livemode = livemode
        self.metadata = metadata
        self.percentage = percentage
        self.state = state
        self.taxType = taxType
    }
    
    public enum CodingKeys: String, CodingKey {
        case id, object, active, country, created, rateDescription = "description", displayName = "display_name", inclusive, jurisdiction, livemode, metadata, percentage, state, taxType = "tax_type"
    }
}
