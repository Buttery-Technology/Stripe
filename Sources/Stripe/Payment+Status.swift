//
//  Payment+Status.swift
//  Stripe
//
//  Created by Jonathan Holland on 6/5/22.
//

import Foundation

extension Payment {
    public enum Status: String, Codable, Sendable {
        /// This order does not require payment.
        case not_required
        /// The order's payment requires a payment method.
        case requires_payment_method
        /// The customer has provided their payment information and the payment is ready to proceed.
        case requires_confirmation
        /// The order's payment requries additional actions. Inspect the attached PaymentIntent to proceed.
        case requires_action
        /// The order's payment is processing.
        case processing
        /// The order's payment succeeded.
        case complete
        /// Only occurs if `payment_method_options.card.capture_method` is set to `manual` in this order's payment settings.
        case requires_capture
        /// The order was canceled.
        case canceled
    }
}
