//
//  PaymentMethod.swift
//  Stripe
//
//  Created by Jonathan Holland on 6/12/22.
//

import Foundation

public struct PaymentMethod: Codable {
    /// Unique identifier for the object.
    public let id: String
    /// String representing the object's type. Always "payment_method".
    public let object: String
    /// Billing information associated with the PaymentMethod that may be used or required by particular types of payment methods.
    public let billingDetails: Billing?
    /// Time at which the object was created. Measured in seconds since the Unix epoch.
    public let created: TimeInterval
    /// The ID of the Customer to which this PaymentMethod is saved. This will not be set when the PaymentMethod has not been saved to a Customer.
    public let customer: String?
    /// Has the value true if the object exists in live mode or the value false if the object exists in test mode.
    public let livemode: Bool
    /// Set of key-value pairs that you can attach to an object.
    public let metadata: Metadata?
    /// The type of the PaymentMethod.
    public let type: PaymentType

    /// Designated initializer
    public init(id: String, object: String = "payment_method", billingDetails: Billing?, created: TimeInterval, customer: String?, livemode: Bool, metadata: Metadata?, type: PaymentType) {
        self.id = id
        self.object = object
        self.billingDetails = billingDetails
        self.created = created
        self.customer = customer
        self.livemode = livemode
        self.metadata = metadata
        self.type = type
    }

    public enum CodingKeys: String, CodingKey {
        case id, object
        case billingDetails = "billing_details"
        case created, customer, livemode, metadata, type
    }
    
    public enum PaymentType: String, Codable {
        case acssDebit = "acss_debit"
        case affirm
        case afterpayClearpay = "afterpay_clearpay"
        case alipay
        case amazonPay = "amazon_pay"
        case auBecsDebit = "au_becs_debit"
        case bacsDebit = "bacs_debit"
        case bancontact
        case blik
        case boleto
        case card
        case cardPresent = "card_present"
        case cashapp
        case customerBalance = "customer_balance"
        case eps
        case fpx
        case giropay
        case grabpay
        case ideal
        case interacPresent = "interac_present"
        case klarna
        case konbini
        case link
        case mobilepay
        case multibanco
        case oxxo
        case p24
        case paynow
        case paypal
        case pix
        case promptpay
        case revolutPay = "revolut_pay"
        case sepaDebit = "sepa_debit"
        case sofort
        case swish
        case twint
        case usBankAccount = "us_bank_account"
        case wechatPay = "wechat_pay"
        case zip
    }
}
