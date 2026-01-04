//
//  Charge.swift
//  Stripe
//
//  Created by Jonathan Holland on 6/11/22.
//

import Foundation

public struct Charge: Codable {
    public static let schema = "charges"

    /// Unique identifier for the object.
    public let id: String
    /// String representing the object's type. Objects of the same type share the same value.
    public let object: String
    /// Amount intended to be collected by this payment. A positive integer representing how much to charge in the smallest currency unit.
    public let amount: Int
    /// Amount in cents captured (can be less than the amount attribute on the charge if a partial capture was made).
    public let amountCaptured: Int
    /// Amount in cents refunded (can be less than the amount attribute on the charge if a partial refund was issued).
    public let amountRefunded: Int
    /// ID of the Connect application that created the charge.
    public let application: String?
    /// The application fee (if any) for the charge.
    public let applicationFee: String?
    /// The amount of the application fee (if any) requested for the charge.
    public let applicationFeeAmount: Int?
    /// ID of the balance transaction that describes the impact of this charge on your account balance.
    public let balanceTransaction: String?
    /// Billing information associated with the payment method at the time of the transaction.
    public let billingDetails: Billing
    /// The full statement descriptor that is passed to card networks, and that is displayed on your customers' credit card and bank statements.
    public let calculatedStatementDescriptor: String?
    /// If the charge was created without capturing, this Boolean represents whether it is still uncaptured or has since been captured.
    public let captured: Bool
    /// Time at which the object was created. Measured in seconds since the Unix epoch.
    public let created: TimeInterval
    /// Three-letter ISO currency code, in lowercase.
    public let currency: String
    /// ID of the customer this charge is for if one exists.
    public let customer: Customer.Expandable?
    /// An arbitrary string attached to the object. Often useful for displaying to users.
    public let chargeDescription: String?
    /// Whether the charge has been disputed.
    public let disputed: Bool
    /// ID of the balance transaction that describes the reversal of the balance on your account due to payment failure.
    public let failureBalanceTransaction: String?
    /// Error code explaining reason for charge failure if available.
    public let failureCode: String?
    /// Message to user further explaining reason for charge failure if available.
    public let failureMessage: String?
    /// Information on fraud assessments for the charge.
    public let fraudDetails: FraudDetails?
    /// ID of the invoice this charge is for if one exists.
    public let invoice: String?
    /// Has the value true if the object exists in live mode or the value false if the object exists in test mode.
    public let livemode: Bool
    /// Set of key-value pairs that you can attach to an object.
    public let metadata: Metadata?
    /// The account (if any) the charge was made on behalf of without triggering an automatic transfer.
    public let onBehalfOf: String?
    /// Details about whether the payment was accepted, and why.
    public let outcome: Outcome?
    /// true if the charge succeeded, or was successfully authorized for later capture.
    public let paid: Bool
    /// ID of the PaymentIntent associated with this charge, if one exists.
    public let paymentIntent: String?
    /// ID of the payment method used in this charge.
    public let paymentMethod: String?
    /// Details about the payment method at the time of the transaction.
    public let paymentMethodDetails: PaymentMethod?
    /// Options to configure Radar.
    public let radarOptions: RadarOptions?
    /// This is the email address that the receipt for this charge was sent to.
    public let receiptEmail: String?
    /// This is the transaction number that appears on email receipts sent for this charge.
    public let receiptNumber: String?
    /// This is the URL to view the receipt for this charge.
    public let receiptURL: String?
    /// Whether the charge has been fully refunded.
    public let refunded: Bool
    /// A list of refunds that have been applied to the charge.
    public let refunds: ListObject<Refund>?
    /// ID of the review associated with this charge if one exists.
    public let review: String?
    /// Shipping information for the charge.
    public let shipping: ChargeShipping?
    /// The transfer ID which created this charge. Only present if the charge came from another Stripe account.
    public let sourceTransfer: String?
    /// For card charges, use statement_descriptor_suffix instead. Otherwise, you can use this value as the complete description of a charge on your customers' statements.
    public let statementDescriptor: String?
    /// Provides information about the charge that customers see on their statements.
    public let statementDescriptorSuffix: String?
    /// The status of the payment is either succeeded, pending, or failed.
    public let status: Status
    /// ID of the transfer to the destination account (only applicable if the charge was created using the destination parameter).
    public let transfer: String?
    /// An optional dictionary including the account to automatically transfer to as part of a destination charge.
    public let transferData: TransferData?
    /// A string that identifies this transaction as part of a group.
    public let transferGroup: String?

    /// Designated initializer
    public init(id: String, object: String, amount: Int, amountCaptured: Int, amountRefunded: Int, application: String?, applicationFee: String?, applicationFeeAmount: Int?, balanceTransaction: String?, billingDetails: Billing, calculatedStatementDescriptor: String?, captured: Bool, created: TimeInterval, currency: String, customer: Customer.Expandable?, chargeDescription: String?, disputed: Bool, failureBalanceTransaction: String?, failureCode: String?, failureMessage: String?, fraudDetails: FraudDetails?, invoice: String?, livemode: Bool, metadata: Metadata?, onBehalfOf: String?, outcome: Outcome?, paid: Bool, paymentIntent: String?, paymentMethod: String?, paymentMethodDetails: PaymentMethod?, radarOptions: RadarOptions?, receiptEmail: String?, receiptNumber: String?, receiptURL: String?, refunded: Bool, refunds: ListObject<Refund>?, review: String?, shipping: ChargeShipping?, sourceTransfer: String?, statementDescriptor: String?, statementDescriptorSuffix: String?, status: Status, transfer: String?, transferData: TransferData?, transferGroup: String?) {
        self.id = id
        self.object = object
        self.amount = amount
        self.amountCaptured = amountCaptured
        self.amountRefunded = amountRefunded
        self.application = application
        self.applicationFee = applicationFee
        self.applicationFeeAmount = applicationFeeAmount
        self.balanceTransaction = balanceTransaction
        self.billingDetails = billingDetails
        self.calculatedStatementDescriptor = calculatedStatementDescriptor
        self.captured = captured
        self.created = created
        self.currency = currency
        self.customer = customer
        self.chargeDescription = chargeDescription
        self.disputed = disputed
        self.failureBalanceTransaction = failureBalanceTransaction
        self.failureCode = failureCode
        self.failureMessage = failureMessage
        self.fraudDetails = fraudDetails
        self.invoice = invoice
        self.livemode = livemode
        self.metadata = metadata
        self.onBehalfOf = onBehalfOf
        self.outcome = outcome
        self.paid = paid
        self.paymentIntent = paymentIntent
        self.paymentMethod = paymentMethod
        self.paymentMethodDetails = paymentMethodDetails
        self.radarOptions = radarOptions
        self.receiptEmail = receiptEmail
        self.receiptNumber = receiptNumber
        self.receiptURL = receiptURL
        self.refunded = refunded
        self.refunds = refunds
        self.review = review
        self.shipping = shipping
        self.sourceTransfer = sourceTransfer
        self.statementDescriptor = statementDescriptor
        self.statementDescriptorSuffix = statementDescriptorSuffix
        self.status = status
        self.transfer = transfer
        self.transferData = transferData
        self.transferGroup = transferGroup
    }

    public enum CodingKeys: String, CodingKey {
        case id,
             object,
             amount,
             amountCaptured = "amount_captured",
             amountRefunded = "amount_refunded",
             application,
             applicationFee = "application_fee",
             applicationFeeAmount = "application_fee_amount",
             balanceTransaction = "balance_transaction",
             billingDetails = "billing_details",
             calculatedStatementDescriptor = "calculated_statement_descriptor",
             captured,
             created,
             currency,
             customer,
             chargeDescription = "description",
             disputed,
             failureBalanceTransaction = "failure_balance_transaction",
             failureCode = "failure_code",
             failureMessage = "failure_message",
             fraudDetails = "fraud_details",
             invoice,
             livemode,
             metadata,
             onBehalfOf = "on_behalf_of",
             outcome,
             paid,
             paymentIntent = "payment_intent",
             paymentMethod = "payment_method",
             paymentMethodDetails = "payment_method_details",
             radarOptions = "radar_options",
             receiptEmail = "receipt_email",
             receiptNumber = "receipt_number",
             receiptURL = "receipt_url",
             refunded,
             refunds,
             review,
             shipping,
             sourceTransfer = "source_transfer",
             statementDescriptor = "statement_descriptor",
             statementDescriptorSuffix = "statement_descriptor_suffix",
             status,
             transfer,
             transferData = "transfer_data",
             transferGroup = "transfer_group"
    }

    // MARK: - Status
    public enum Status: String, Codable {
        case succeeded
        case pending
        case failed
    }

    // MARK: - Fraud Details
    public struct FraudDetails: Codable {
        /// Assessments from Stripe. If set, the value is `fraudulent`.
        public let stripeReport: String?
        /// Assessments reported by you. If set, possible values are `safe` and `fraudulent`.
        public let userReport: String?

        public init(stripeReport: String?, userReport: String?) {
            self.stripeReport = stripeReport
            self.userReport = userReport
        }

        public enum CodingKeys: String, CodingKey {
            case stripeReport = "stripe_report",
                 userReport = "user_report"
        }
    }

    // MARK: - Outcome
    public struct Outcome: Codable {
        /// Possible values are `approved_by_network`, `declined_by_network`, `not_sent_to_network`, and `reversed_after_approval`.
        public let networkStatus: String?
        /// An enumerated value providing a more detailed explanation of the outcome's type.
        public let reason: String?
        /// Stripe Radar's evaluation of the riskiness of the payment.
        public let riskLevel: String?
        /// Stripe Radar's evaluation of the riskiness of the payment (0-100).
        public let riskScore: Int?
        /// The ID of the Radar rule that matched the payment, if applicable.
        public let rule: String?
        /// A human-readable description of the outcome type and reason.
        public let sellerMessage: String?
        /// Possible values are `authorized`, `manual_review`, `issuer_declined`, `blocked`, and `invalid`.
        public let type: String

        public init(networkStatus: String?, reason: String?, riskLevel: String?, riskScore: Int?, rule: String?, sellerMessage: String?, type: String) {
            self.networkStatus = networkStatus
            self.reason = reason
            self.riskLevel = riskLevel
            self.riskScore = riskScore
            self.rule = rule
            self.sellerMessage = sellerMessage
            self.type = type
        }

        public enum CodingKeys: String, CodingKey {
            case networkStatus = "network_status",
                 reason,
                 riskLevel = "risk_level",
                 riskScore = "risk_score",
                 rule,
                 sellerMessage = "seller_message",
                 type
        }
    }

    // MARK: - Radar Options
    public struct RadarOptions: Codable {
        /// A Radar Session is a snapshot of the browser metadata and device details that help Radar make more accurate predictions on your payments.
        public let session: String?

        public init(session: String?) {
            self.session = session
        }
    }

    // MARK: - Charge Shipping
    public struct ChargeShipping: Codable {
        /// Recipient address.
        public let address: Address?
        /// The delivery service that shipped a physical product, such as Fedex, UPS, USPS, etc.
        public let carrier: String?
        /// Recipient name.
        public let name: String?
        /// Recipient phone (including extension).
        public let phone: String?
        /// The tracking number for a physical product, obtained from the delivery service.
        public let trackingNumber: String?

        public init(address: Address?, carrier: String?, name: String?, phone: String?, trackingNumber: String?) {
            self.address = address
            self.carrier = carrier
            self.name = name
            self.phone = phone
            self.trackingNumber = trackingNumber
        }

        public enum CodingKeys: String, CodingKey {
            case address,
                 carrier,
                 name,
                 phone,
                 trackingNumber = "tracking_number"
        }
    }

    // MARK: - Transfer Data
    public struct TransferData: Codable {
        /// The amount transferred to the destination account, if specified. By default, the entire charge amount is transferred to the destination account.
        public let amount: Int?
        /// ID of an existing, connected Stripe account to transfer funds to if transfer_data was specified in the charge request.
        public let destination: String

        public init(amount: Int?, destination: String) {
            self.amount = amount
            self.destination = destination
        }
    }
}
