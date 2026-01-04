//
//  Payment+Settings.swift
//  Stripe
//
//  Created by Jonathan Holland on 6/5/22.
//

import Foundation

extension Payment {
    public struct Settings: Codable {
        /// The amount of the application fee (if any) that will be requested to be applied to the payment and transferred to the application owner’s Stripe account.
        public let applicationFeeAmount: String?
        /// PaymentMethod-specific configuration to provide to the order’s PaymentIntent.
        public let paymentMethodOptions: MethodOption?
        /// The list of payment method types (e.g., card) to provide to the order’s PaymentIntent.
        public let paymentMethodTypes: [MethodType]
        /// The URL to redirect the customer to after they authenticate their payment.
        public let returnURL: String?
        /// For non-card charges, you can use this value as the complete description that appears on your customers' statements. Must contain at least one letter, maximum 22 characters.
        public let statementDescriptor: String?
        /// Provides information about a card payment that customers see on their statements. Concatenated with the prefix (shortened descriptor) or statement descriptor that's set on the account to form the complete statement descriptor. Maximum 22 characters for the concatenated descriptor.
        public let statementDescriptorSuffix: String?
        /// Provides configuration for completing a transfer for the order after it is paid.
        public let transferData: TransferData?
        
        /// Designated initializer
        public init(applicationFeeAmount: String?, paymentMethodOptions: MethodOption?, paymentMethodTypes: [MethodType], returnURL: String?, statementDescriptor: String?, statementDescriptorSuffix: String?, transferData: TransferData?) {
            self.applicationFeeAmount = applicationFeeAmount
            self.paymentMethodOptions = paymentMethodOptions
            self.paymentMethodTypes = paymentMethodTypes
            self.returnURL = returnURL
            self.statementDescriptor = statementDescriptor
            self.statementDescriptorSuffix = statementDescriptorSuffix
            self.transferData = transferData
        }
        
        public enum CodingKeys: String, CodingKey {
            case applicationFeeAmount = "application_fee_amount"
            case paymentMethodOptions = "payment_method_options"
            case paymentMethodTypes = "payment_method_types"
            case returnURL = "return_url"
            case statementDescriptor = "statement_descriptor"
            case statementDescriptorSuffix = "statement_descriptor_suffix"
            case transferData = "transfer_data"
        }
        
        public struct TransferData: Codable {
            /// The amount that will be transferred automatically when the order is paid. If no amount is set, the full amount is transferred. There cannot be any line items with recurring prices when using this field.
            public let amount: Int
            /// ID of the Connected account receiving the transfer.
            public let destination: String
            
            /// Designated initializer
            public init(amount: Int, destination: String) {
                self.amount = amount
                self.destination = destination
            }
        }
    }
}
