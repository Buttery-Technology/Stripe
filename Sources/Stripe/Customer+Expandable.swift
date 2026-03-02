//
//  Customer+Expandable.swift
//  Stripe
//
//  Created by Jonathan Holland on 6/5/22.
//

import Foundation

extension Customer {
    /// Represents a value that can be an id string or a `Customer` object.
    public enum Expandable: Codable, Sendable {
        case id(String)
        case object(Customer)
        
        public init(from decoder: Decoder) throws {
            var returnableError: Error?
            do {
                let singleValueContainer = try decoder.singleValueContainer()
                let id = try singleValueContainer.decode(String.self)
                self = .id(id)
                return
            } catch {
                returnableError = error
            }
            do {
                let singleValueContainer = try decoder.singleValueContainer()
                let object = try singleValueContainer.decode(Customer.self)
                self = .object(object)
                return
            } catch {
                returnableError = error
            }
            throw DecodingError.unknownType(returnableError)
        }
    }
}
