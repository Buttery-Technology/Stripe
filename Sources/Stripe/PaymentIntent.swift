//
//  PaymentIntent.swift
//  Stripe
//
//  Created by Jonathan Holland on 6/5/22.
//

import Foundation

public struct PaymentIntent: Codable {
    public static let schema = "payment_intents"

    /// Unique identifier for the object.
    public let id: String

    /// String representing the object's type. Always "payment_intent".
    public let object: String

    /// Amount intended to be collected by this PaymentIntent.
    public let amount: Int

    /// Amount that can be captured from this PaymentIntent.
    public let amountCapturable: Int?

    /// Details about items included in the amount.
    public let amountDetails: AmountDetails?

    /// Amount that was collected by this PaymentIntent.
    public let amountReceived: Int?

    /// ID of the Connect application that created the PaymentIntent.
    public let application: String?

    /// The amount of the application fee for the resulting payment.
    public let applicationFeeAmount: Int?

    /// Settings to configure compatible payment methods from the Stripe Dashboard.
    public let automaticPaymentMethods: AutomaticPaymentMethods?

    /// Populated when `status` is `canceled`, the time at which the PaymentIntent was canceled.
    public let canceledAt: Date?

    /// Reason for cancellation of this PaymentIntent.
    public let cancellationReason: CancellationReason?

    /// Controls when the funds will be captured from the customer's account.
    public let captureMethod: CaptureMethod

    /// The client secret of this PaymentIntent.
    public let clientSecret: String?

    /// Describes whether we can confirm this PaymentIntent automatically or manually.
    public let confirmationMethod: ConfirmationMethod?

    /// Time at which the object was created.
    public let created: Date

    /// Three-letter ISO currency code.
    public let currency: String

    /// ID of the Customer this PaymentIntent belongs to.
    public let customer: String?

    /// An arbitrary string attached to the object for description.
    public let paymentIntentDescription: String?

    /// ID of the invoice that created this PaymentIntent.
    public let invoice: String?

    /// The payment error encountered in the previous PaymentIntent confirmation.
    public let lastPaymentError: LastPaymentError?

    /// The latest charge created by this PaymentIntent.
    public let latestCharge: String?

    /// Has the value `true` if the object exists in live mode or `false` if in test mode.
    public let livemode: Bool

    /// Set of key-value pairs attached to the object.
    public let metadata: Metadata?

    /// If present, this property tells you what actions you need to take for the customer to continue payment.
    public let nextAction: NextAction?

    /// The account on behalf of which to charge.
    public let onBehalfOf: String?

    /// ID of the payment method used in this PaymentIntent.
    public let paymentMethod: String?

    /// Payment-method-specific configuration for this PaymentIntent.
    public let paymentMethodOptions: [String: AnyCodable]?

    /// The list of payment method types that this PaymentIntent can use.
    public let paymentMethodTypes: [String]

    /// If present, this property tells you about the processing state of the payment.
    public let processing: Processing?

    /// Email address that the receipt for the resulting payment will be sent to.
    public let receiptEmail: String?

    /// ID of the review associated with this PaymentIntent.
    public let review: String?

    /// Indicates that you intend to make future payments with this PaymentIntent's payment method.
    public let setupFutureUsage: SetupFutureUsage?

    /// Shipping information for this PaymentIntent.
    public let shipping: Shipping?

    /// Text that appears on the customer's statement.
    public let statementDescriptor: String?

    /// Suffix to be concatenated with the statement descriptor.
    public let statementDescriptorSuffix: String?

    /// Status of this PaymentIntent.
    public let status: Status

    /// Data used to transfer funds to the destination account.
    public let transferData: TransferData?

    /// A string that identifies the resulting payment as part of a group.
    public let transferGroup: String?

    /// Designated initializer
    public init(
        id: String,
        object: String = "payment_intent",
        amount: Int,
        amountCapturable: Int?,
        amountDetails: AmountDetails?,
        amountReceived: Int?,
        application: String?,
        applicationFeeAmount: Int?,
        automaticPaymentMethods: AutomaticPaymentMethods?,
        canceledAt: Date?,
        cancellationReason: CancellationReason?,
        captureMethod: CaptureMethod,
        clientSecret: String?,
        confirmationMethod: ConfirmationMethod?,
        created: Date,
        currency: String,
        customer: String?,
        paymentIntentDescription: String?,
        invoice: String?,
        lastPaymentError: LastPaymentError?,
        latestCharge: String?,
        livemode: Bool,
        metadata: Metadata?,
        nextAction: NextAction?,
        onBehalfOf: String?,
        paymentMethod: String?,
        paymentMethodOptions: [String: AnyCodable]?,
        paymentMethodTypes: [String],
        processing: Processing?,
        receiptEmail: String?,
        review: String?,
        setupFutureUsage: SetupFutureUsage?,
        shipping: Shipping?,
        statementDescriptor: String?,
        statementDescriptorSuffix: String?,
        status: Status,
        transferData: TransferData?,
        transferGroup: String?
    ) {
        self.id = id
        self.object = object
        self.amount = amount
        self.amountCapturable = amountCapturable
        self.amountDetails = amountDetails
        self.amountReceived = amountReceived
        self.application = application
        self.applicationFeeAmount = applicationFeeAmount
        self.automaticPaymentMethods = automaticPaymentMethods
        self.canceledAt = canceledAt
        self.cancellationReason = cancellationReason
        self.captureMethod = captureMethod
        self.clientSecret = clientSecret
        self.confirmationMethod = confirmationMethod
        self.created = created
        self.currency = currency
        self.customer = customer
        self.paymentIntentDescription = paymentIntentDescription
        self.invoice = invoice
        self.lastPaymentError = lastPaymentError
        self.latestCharge = latestCharge
        self.livemode = livemode
        self.metadata = metadata
        self.nextAction = nextAction
        self.onBehalfOf = onBehalfOf
        self.paymentMethod = paymentMethod
        self.paymentMethodOptions = paymentMethodOptions
        self.paymentMethodTypes = paymentMethodTypes
        self.processing = processing
        self.receiptEmail = receiptEmail
        self.review = review
        self.setupFutureUsage = setupFutureUsage
        self.shipping = shipping
        self.statementDescriptor = statementDescriptor
        self.statementDescriptorSuffix = statementDescriptorSuffix
        self.status = status
        self.transferData = transferData
        self.transferGroup = transferGroup
    }

    public enum CodingKeys: String, CodingKey {
        case id,
             object,
             amount,
             amountCapturable = "amount_capturable",
             amountDetails = "amount_details",
             amountReceived = "amount_received",
             application,
             applicationFeeAmount = "application_fee_amount",
             automaticPaymentMethods = "automatic_payment_methods",
             canceledAt = "canceled_at",
             cancellationReason = "cancellation_reason",
             captureMethod = "capture_method",
             clientSecret = "client_secret",
             confirmationMethod = "confirmation_method",
             created,
             currency,
             customer,
             paymentIntentDescription = "description",
             invoice,
             lastPaymentError = "last_payment_error",
             latestCharge = "latest_charge",
             livemode,
             metadata,
             nextAction = "next_action",
             onBehalfOf = "on_behalf_of",
             paymentMethod = "payment_method",
             paymentMethodOptions = "payment_method_options",
             paymentMethodTypes = "payment_method_types",
             processing,
             receiptEmail = "receipt_email",
             review,
             setupFutureUsage = "setup_future_usage",
             shipping,
             statementDescriptor = "statement_descriptor",
             statementDescriptorSuffix = "statement_descriptor_suffix",
             status,
             transferData = "transfer_data",
             transferGroup = "transfer_group"
    }

    // MARK: - Status

    public enum Status: String, Codable {
        case canceled
        case processing
        case requiresAction = "requires_action"
        case requiresCapture = "requires_capture"
        case requiresConfirmation = "requires_confirmation"
        case requiresPaymentMethod = "requires_payment_method"
        case succeeded
    }

    // MARK: - Cancellation Reason

    public enum CancellationReason: String, Codable {
        case abandoned
        case automatic
        case duplicate
        case failedInvoice = "failed_invoice"
        case fraudulent
        case requestedByCustomer = "requested_by_customer"
        case voidInvoice = "void_invoice"
    }

    // MARK: - Confirmation Method

    public enum ConfirmationMethod: String, Codable {
        case automatic
        case manual
    }

    // MARK: - Amount Details

    public struct AmountDetails: Codable {
        public let tip: Tip?

        public init(tip: Tip?) {
            self.tip = tip
        }

        public struct Tip: Codable {
            public let amount: Int?

            public init(amount: Int?) {
                self.amount = amount
            }
        }
    }

    // MARK: - Automatic Payment Methods

    public struct AutomaticPaymentMethods: Codable {
        public let allowRedirects: AllowRedirects?
        public let enabled: Bool

        public init(allowRedirects: AllowRedirects?, enabled: Bool) {
            self.allowRedirects = allowRedirects
            self.enabled = enabled
        }

        public enum CodingKeys: String, CodingKey {
            case allowRedirects = "allow_redirects"
            case enabled
        }

        public enum AllowRedirects: String, Codable {
            case always
            case never
        }
    }

    // MARK: - Last Payment Error

    public struct LastPaymentError: Codable {
        public let code: String?
        public let declineCode: String?
        public let docUrl: String?
        public let message: String?
        public let param: String?
        public let paymentMethod: PaymentMethod?
        public let type: String

        public init(code: String?, declineCode: String?, docUrl: String?, message: String?, param: String?, paymentMethod: PaymentMethod?, type: String) {
            self.code = code
            self.declineCode = declineCode
            self.docUrl = docUrl
            self.message = message
            self.param = param
            self.paymentMethod = paymentMethod
            self.type = type
        }

        public enum CodingKeys: String, CodingKey {
            case code,
                 declineCode = "decline_code",
                 docUrl = "doc_url",
                 message,
                 param,
                 paymentMethod = "payment_method",
                 type
        }
    }

    // MARK: - Next Action

    public struct NextAction: Codable {
        public let type: String
        public let redirectToUrl: RedirectToUrl?
        public let useStripeSdk: [String: AnyCodable]?

        public init(type: String, redirectToUrl: RedirectToUrl?, useStripeSdk: [String: AnyCodable]?) {
            self.type = type
            self.redirectToUrl = redirectToUrl
            self.useStripeSdk = useStripeSdk
        }

        public enum CodingKeys: String, CodingKey {
            case type,
                 redirectToUrl = "redirect_to_url",
                 useStripeSdk = "use_stripe_sdk"
        }

        public struct RedirectToUrl: Codable {
            public let returnUrl: String?
            public let url: String?

            public init(returnUrl: String?, url: String?) {
                self.returnUrl = returnUrl
                self.url = url
            }

            public enum CodingKeys: String, CodingKey {
                case returnUrl = "return_url"
                case url
            }
        }
    }

    // MARK: - Processing

    public struct Processing: Codable {
        public let card: CardProcessing?
        public let type: String?

        public init(card: CardProcessing?, type: String?) {
            self.card = card
            self.type = type
        }

        public struct CardProcessing: Codable {
            public let customerNotification: CustomerNotification?

            public init(customerNotification: CustomerNotification?) {
                self.customerNotification = customerNotification
            }

            public enum CodingKeys: String, CodingKey {
                case customerNotification = "customer_notification"
            }

            public struct CustomerNotification: Codable {
                public let approvalRequested: Bool?
                public let completesAt: Date?

                public init(approvalRequested: Bool?, completesAt: Date?) {
                    self.approvalRequested = approvalRequested
                    self.completesAt = completesAt
                }

                public enum CodingKeys: String, CodingKey {
                    case approvalRequested = "approval_requested"
                    case completesAt = "completes_at"
                }
            }
        }
    }

    // MARK: - Transfer Data

    public struct TransferData: Codable {
        public let amount: Int?
        public let destination: String

        public init(amount: Int?, destination: String) {
            self.amount = amount
            self.destination = destination
        }
    }
}
