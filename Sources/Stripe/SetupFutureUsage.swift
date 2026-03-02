//
//  SetupFutureUsage.swift
//  Stripe
//
//  Created by Jonathan Holland on 6/5/22.
//

import Foundation

public enum SetupFutureUsage: String, Codable, Sendable {
    /// Use `on_session` if you intend to only reuse the payment method when your customer is present in your checkout flow.
    case on_session
    /// Use `off_session` if your customer may or may not be present in your checkout flow.
    case off_session
    /// Use `none` if you do not intend to reuse this payment method and want to override the top-level `setup_future_usage` value for this payment method.
    case none
}
