//
//  Payment.swift
//  Stripe
//
//  Created by Jonathan Holland on 6/4/22.
//

import Foundation

public struct Payment: Codable {
    public static let schema = "payments"
    
    /// ID of the payment intent associated with this order. Null when the order is open.
    public let paymentIntent: PaymentIntent.Expandable?
    /// Settings describing how the order should configure generated PaymentIntents.
    public let settings: Self.Settings
    /// The status of the underlying payment associated with this order, if any. Null when the order is `open`.
    public let status: Self.Status?

    /// Designated initializer
    public init(paymentIntent: PaymentIntent.Expandable?, settings: Self.Settings, status: Self.Status?) {
        self.paymentIntent = paymentIntent
        self.settings = settings
        self.status = status
    }
    
    public enum CodingKeys: String, CodingKey {
        case paymentIntent = "payment_intent", settings, status
    }
}

