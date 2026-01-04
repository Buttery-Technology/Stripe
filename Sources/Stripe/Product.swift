//
//  Product.swift
//  Stripe
//
//  Created by Jonathan Holland on 6/4/22.
//

import Foundation

public struct Product: Codable {
    public static let schema = "products"

    /// Unique identifier for the object.
    public let id: String
    /// String representing the object's type.
    public let object: String
    /// Whether the product is currently available for purchase.
    public let active: Bool
    /// Time at which the object was created. Measured in seconds since the Unix epoch.
    public let created: Int
    /// The ID of the Price object that is the default price for this product.
    public let defaultPrice: String?
    /// The product's description, meant to be displayable to the customer.
    public let productDescription: String?
    /// A list of up to 8 URLs of images for this product.
    public let images: [String]
    /// Has the value true if the object exists in live mode or the value false if the object exists in test mode.
    public let livemode: Bool
    /// A list of up to 15 marketing features for this product.
    public let marketingFeatures: [MarketingFeature]
    /// Set of key-value pairs that you can attach to an object.
    public let metadata: Metadata?
    /// The product's name, meant to be displayable to the customer.
    public let name: String
    /// The dimensions of this product for shipping purposes.
    public let packageDimensions: Dimensions?
    /// Whether this product is shipped (i.e., physical goods).
    public let shippable: Bool?
    /// Extra information about a product which will appear on your customer's credit card statement.
    public let statementDescriptor: String?
    /// A tax code ID.
    public let taxCode: String?
    /// A label that represents units of this product.
    public let unitLabel: String?
    /// Time at which the object was last updated. Measured in seconds since the Unix epoch.
    public let updated: Int
    /// A URL of a publicly-accessible webpage for this product.
    public let url: String?

    /// Designated initializer
    public init(id: String, object: String, active: Bool, created: Int, defaultPrice: String?, productDescription: String?, images: [String], livemode: Bool, marketingFeatures: [MarketingFeature], metadata: Metadata?, name: String, packageDimensions: Dimensions?, shippable: Bool?, statementDescriptor: String?, taxCode: String?, unitLabel: String?, updated: Int, url: String?) {
        self.id = id
        self.object = object
        self.active = active
        self.created = created
        self.defaultPrice = defaultPrice
        self.productDescription = productDescription
        self.images = images
        self.livemode = livemode
        self.marketingFeatures = marketingFeatures
        self.metadata = metadata
        self.name = name
        self.packageDimensions = packageDimensions
        self.shippable = shippable
        self.statementDescriptor = statementDescriptor
        self.taxCode = taxCode
        self.unitLabel = unitLabel
        self.updated = updated
        self.url = url
    }

    public enum CodingKeys: String, CodingKey {
        case id,
             object,
             active,
             created,
             defaultPrice = "default_price",
             productDescription = "description",
             images,
             livemode,
             marketingFeatures = "marketing_features",
             metadata,
             name,
             packageDimensions = "package_dimensions",
             shippable,
             statementDescriptor = "statement_descriptor",
             taxCode = "tax_code",
             unitLabel = "unit_label",
             updated,
             url
    }

    // MARK: - Marketing Feature
    public struct MarketingFeature: Codable {
        /// The marketing feature name. Up to 80 characters long.
        public let name: String?

        public init(name: String?) {
            self.name = name
        }
    }
}

