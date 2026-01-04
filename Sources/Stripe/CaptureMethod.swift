//
//  CaptureMethod.swift
//  Stripe
//
//  Created by Jonathan Holland on 6/5/22.
//

import Foundation

public enum CaptureMethod: String, Codable {
    /// (Default) Stripe automatically captures funds when the customer authorizes the payment.
    case automatic
    /// Stripe asynchronously captures funds when the customer authorizes the payment.
    case automaticAsync = "automatic_async"
    /// Place a hold on the funds when the customer authorizes the payment, but [don't capture the funds until later](https://stripe.com/docs/payments/capture-later). (Not all payment methods support this.)
    case manual
}
