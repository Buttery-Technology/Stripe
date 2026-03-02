//
//  PaymentIntent+Expandable.swift
//  Stripe
//
//  Created by Jonathan Holland on 6/5/22.
//

import Foundation

extension PaymentIntent {
    /// Represents a value that can be an id string or a `PaymentIntent` object.
    public enum Expandable: Codable, Sendable {
        case id(String)
        case object(PaymentIntent)
        
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
                let object = try singleValueContainer.decode(PaymentIntent.self)
                self = .object(object)
                return
            } catch {
                returnableError = error
            }
            throw DecodingError.unknownType(returnableError)
        }
    }
}
