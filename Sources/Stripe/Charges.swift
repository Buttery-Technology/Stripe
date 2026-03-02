//
//  Charges.swift
//  Stripe
//
//  Created by Jonathan Holland on 6/11/22.
//

import Foundation

public struct Charges: Codable, Sendable {
    public static let schema = "charges"
    
    public let object: String
    /// The client secret of this Order. Used for client-side retrieval using a publishable key.
    /// The client secret can be used to comppublic lete a payment for an Order from your frontend. It should not be stored, logged, embedded in URLs, or exposed to anyone other than the customer. Make sure that you have TLS enabled on any page that includes the client secret.
    /// Refer to our docs for [creating and processing](https://stripe.com/docs/orders-beta/create-and-process) an order to learn about how client_secret should be handled.
    public let clientSecret: String?
    public let data: [String]
    public let hasMore: Bool
    public let url: String
    
    /// Designated initializer
    public init(object: String, clientSecret: String?, data: [String], hasMore: Bool, url: String) {
        self.object = object
        self.clientSecret = clientSecret
        self.data = data
        self.hasMore = hasMore
        self.url = url
    }
    
    public enum CodingKeys: String, CodingKey {
        case object, data
        case clientSecret = "client_secret"
        case hasMore = "has_more"
        case url
    }
}
