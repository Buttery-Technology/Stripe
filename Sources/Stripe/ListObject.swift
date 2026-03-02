//
//  ListObject.swift
//  Stripe
//
//  Created by Jonathan Holland on 8/28/22.
//

import Foundation

public struct ListObject<T: Codable & Sendable>: Codable, Sendable {
    public let object: String
    public let url: String
    public let hasMore: Bool
    public let data: [T]
    
    /// Designated initializer
    public init(object: String, url: String, hasMore: Bool, data: [T]) {
        self.object = object
        self.url = url
        self.hasMore = hasMore
        self.data = data
    }
    
    enum CodingKeys: String, CodingKey {
        case object,
             url,
             hasMore = "has_more",
             data
    }
}
