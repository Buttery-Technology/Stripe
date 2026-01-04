//
//  Customer.swift
//  Stripe
//
//  Created by Jonathan Holland on 6/4/22.
//

import Foundation

public struct Customer: Codable {
    public static let schema = "customers"

    /// Unique identifier for the object.
    public let id: String
    /// String representing the object's type.
    public let object: String
    /// The customer's address.
    public let address: Address?
    /// The current balance, if any, that's stored on the customer.
    public let balance: Int
    /// The customer's business name (max 150 characters).
    public let businessName: String?
    /// The customer's cash balance.
    public let cashBalance: CashBalance?
    /// Time at which the object was created. Measured in seconds since the Unix epoch.
    public let created: TimeInterval
    /// Three-letter ISO code for the currency the customer can be charged in.
    public let currency: String?
    /// ID of the default payment source for the customer.
    public let defaultSource: String?
    /// Tracks the most recent state change on any invoice belonging to the customer.
    public let delinquent: Bool?
    /// An arbitrary string attached to the object.
    public let customerDescription: String?
    /// Describes the current discount active on the customer, if there is one.
    public let discount: Discount?
    /// The customer's email address.
    public let email: String?
    /// The customer's individual name (max 150 characters).
    public let individualName: String?
    /// The current multi-currency balances, if any, that's stored on the customer.
    public let invoiceCreditBalance: [String: Int]?
    /// The prefix for the customer used to generate unique invoice numbers.
    public let invoicePrefix: String?
    /// Default invoice settings for this customer.
    public let invoiceSettings: InvoiceSettings?
    /// Has the value true if the object exists in live mode or the value false if the object exists in test mode.
    public let livemode: Bool
    /// Set of key-value pairs that you can attach to an object.
    public let metadata: Metadata?
    /// The customer's full name or business name.
    public let name: String?
    /// The suffix of the next invoice number assigned to this customer.
    public let nextInvoiceSequence: Int?
    /// The customer's phone number.
    public let phone: String?
    /// The customer's preferred locales (languages), ordered by preference.
    public let preferredLocales: [String]?
    /// Mailing and shipping address for the customer.
    public let shipping: Shipping?
    /// The customer's payment sources, if any.
    public let sources: ListObject<Source>?
    /// The customer's current subscriptions, if any.
    public let subscriptions: ListObject<Subscription>?
    /// Tax details about the customer.
    public let tax: Tax?
    /// Describes the customer's tax exemption status. One of `none`, `exempt`, or `reverse`.
    public let taxExempt: String?
    /// The customer's tax IDs.
    public let taxIds: ListObject<TaxId>?
    /// ID of the test clock this customer belongs to.
    public let testClock: String?

    /// Designated initializer
    public init(id: String, object: String, address: Address?, balance: Int, businessName: String?, cashBalance: CashBalance?, created: TimeInterval, currency: String?, defaultSource: String?, delinquent: Bool?, customerDescription: String?, discount: Discount?, email: String?, individualName: String?, invoiceCreditBalance: [String: Int]?, invoicePrefix: String?, invoiceSettings: InvoiceSettings?, livemode: Bool, metadata: Metadata?, name: String?, nextInvoiceSequence: Int?, phone: String?, preferredLocales: [String]?, shipping: Shipping?, sources: ListObject<Source>?, subscriptions: ListObject<Subscription>?, tax: Tax?, taxExempt: String?, taxIds: ListObject<TaxId>?, testClock: String?) {
        self.id = id
        self.object = object
        self.address = address
        self.balance = balance
        self.businessName = businessName
        self.cashBalance = cashBalance
        self.created = created
        self.currency = currency
        self.defaultSource = defaultSource
        self.delinquent = delinquent
        self.customerDescription = customerDescription
        self.discount = discount
        self.email = email
        self.individualName = individualName
        self.invoiceCreditBalance = invoiceCreditBalance
        self.invoicePrefix = invoicePrefix
        self.invoiceSettings = invoiceSettings
        self.livemode = livemode
        self.metadata = metadata
        self.name = name
        self.nextInvoiceSequence = nextInvoiceSequence
        self.phone = phone
        self.preferredLocales = preferredLocales
        self.shipping = shipping
        self.sources = sources
        self.subscriptions = subscriptions
        self.tax = tax
        self.taxExempt = taxExempt
        self.taxIds = taxIds
        self.testClock = testClock
    }

    public enum CodingKeys: String, CodingKey {
        case id,
             object,
             address,
             balance,
             businessName = "business_name",
             cashBalance = "cash_balance",
             created,
             currency,
             defaultSource = "default_source",
             delinquent,
             customerDescription = "description",
             discount,
             email,
             individualName = "individual_name",
             invoiceCreditBalance = "invoice_credit_balance",
             invoicePrefix = "invoice_prefix",
             invoiceSettings = "invoice_settings",
             livemode,
             metadata,
             name,
             nextInvoiceSequence = "next_invoice_sequence",
             phone,
             preferredLocales = "preferred_locales",
             shipping,
             sources,
             subscriptions,
             tax,
             taxExempt = "tax_exempt",
             taxIds = "tax_ids",
             testClock = "test_clock"
    }

    // MARK: - Cash Balance
    public struct CashBalance: Codable {
        /// String representing the object's type.
        public let object: String
        /// A hash of all cash balances available to this customer by currency.
        public let available: [String: Int]?
        /// The ID of the customer whose cash balance this object represents.
        public let customer: String
        /// Has the value true if the object exists in live mode.
        public let livemode: Bool
        /// Cash balance settings for this customer.
        public let settings: Settings

        public init(object: String, available: [String: Int]?, customer: String, livemode: Bool, settings: Settings) {
            self.object = object
            self.available = available
            self.customer = customer
            self.livemode = livemode
            self.settings = settings
        }

        public struct Settings: Codable {
            /// The configuration for how funds that land in the customer cash balance are reconciled.
            public let reconciliationMode: String
            /// Whether the customer's cash balance settings are set on the customer or are using the account default.
            public let usingMerchantDefault: Bool

            public init(reconciliationMode: String, usingMerchantDefault: Bool) {
                self.reconciliationMode = reconciliationMode
                self.usingMerchantDefault = usingMerchantDefault
            }

            public enum CodingKeys: String, CodingKey {
                case reconciliationMode = "reconciliation_mode",
                     usingMerchantDefault = "using_merchant_default"
            }
        }
    }

    // MARK: - Source (simplified)
    public struct Source: Codable {
        /// Unique identifier for the object.
        public let id: String
        /// String representing the object's type.
        public let object: String
        /// The account this bank account belongs to.
        public let account: String?
        /// The name of the person or business that owns the bank account.
        public let accountHolderName: String?
        /// The type of entity that holds the account. This can be either `individual` or `company`.
        public let accountHolderType: String?
        /// The bank account type. This can only be `checking` or `savings`.
        public let accountType: String?
        /// Name of the bank associated with the bank account.
        public let bankName: String?
        /// Two-letter ISO code representing the country the bank account is located in.
        public let country: String?
        /// Three-letter ISO code for the currency.
        public let currency: String?
        /// The customer that this bank account belongs to.
        public let customer: String?
        /// Uniquely identifies this particular bank account.
        public let fingerprint: String?
        /// The last four digits of the bank account number.
        public let last4: String?
        /// Set of key-value pairs.
        public let metadata: Metadata?
        /// The routing transit number for the bank account.
        public let routingNumber: String?
        /// Possible values are `new`, `validated`, `verified`, `verification_failed`, or `errored`.
        public let status: String?

        public init(id: String, object: String, account: String?, accountHolderName: String?, accountHolderType: String?, accountType: String?, bankName: String?, country: String?, currency: String?, customer: String?, fingerprint: String?, last4: String?, metadata: Metadata?, routingNumber: String?, status: String?) {
            self.id = id
            self.object = object
            self.account = account
            self.accountHolderName = accountHolderName
            self.accountHolderType = accountHolderType
            self.accountType = accountType
            self.bankName = bankName
            self.country = country
            self.currency = currency
            self.customer = customer
            self.fingerprint = fingerprint
            self.last4 = last4
            self.metadata = metadata
            self.routingNumber = routingNumber
            self.status = status
        }

        public enum CodingKeys: String, CodingKey {
            case id,
                 object,
                 account,
                 accountHolderName = "account_holder_name",
                 accountHolderType = "account_holder_type",
                 accountType = "account_type",
                 bankName = "bank_name",
                 country,
                 currency,
                 customer,
                 fingerprint,
                 last4,
                 metadata,
                 routingNumber = "routing_number",
                 status
        }
    }

    // MARK: - Subscription (simplified)
    public struct Subscription: Codable {
        /// Unique identifier for the object.
        public let id: String
        /// String representing the object's type.
        public let object: String
        /// ID of the Connect Application that created the subscription.
        public let application: String?
        /// A date in the future at which the subscription will automatically get canceled.
        public let cancelAt: TimeInterval?
        /// If the subscription has been canceled with the `at_period_end` flag set to true.
        public let cancelAtPeriodEnd: Bool
        /// If the subscription has been canceled, the date of that cancellation.
        public let canceledAt: TimeInterval?
        /// Either `charge_automatically` or `send_invoice`.
        public let collectionMethod: String
        /// Time at which the object was created. Measured in seconds since the Unix epoch.
        public let created: TimeInterval
        /// Three-letter ISO currency code.
        public let currency: String
        /// End of the current period that the subscription has been invoiced for.
        public let currentPeriodEnd: TimeInterval
        /// Start of the current period that the subscription has been invoiced for.
        public let currentPeriodStart: TimeInterval
        /// ID of the customer who owns the subscription.
        public let customer: String
        /// ID of the default payment method for the subscription.
        public let defaultPaymentMethod: String?
        /// Describes the current discount applied to this subscription, if there is one.
        public let discount: Discount?
        /// If the subscription has ended, the date the subscription ended.
        public let endedAt: TimeInterval?
        /// Has the value true if the object exists in live mode.
        public let livemode: Bool
        /// Set of key-value pairs.
        public let metadata: Metadata?
        /// Date when the subscription was first created.
        public let startDate: TimeInterval
        /// Possible values are `incomplete`, `incomplete_expired`, `trialing`, `active`, `past_due`, `canceled`, `unpaid`, or `paused`.
        public let status: String
        /// If the subscription has a trial, the end of that trial.
        public let trialEnd: TimeInterval?
        /// If the subscription has a trial, the beginning of that trial.
        public let trialStart: TimeInterval?

        public init(id: String, object: String, application: String?, cancelAt: TimeInterval?, cancelAtPeriodEnd: Bool, canceledAt: TimeInterval?, collectionMethod: String, created: TimeInterval, currency: String, currentPeriodEnd: TimeInterval, currentPeriodStart: TimeInterval, customer: String, defaultPaymentMethod: String?, discount: Discount?, endedAt: TimeInterval?, livemode: Bool, metadata: Metadata?, startDate: TimeInterval, status: String, trialEnd: TimeInterval?, trialStart: TimeInterval?) {
            self.id = id
            self.object = object
            self.application = application
            self.cancelAt = cancelAt
            self.cancelAtPeriodEnd = cancelAtPeriodEnd
            self.canceledAt = canceledAt
            self.collectionMethod = collectionMethod
            self.created = created
            self.currency = currency
            self.currentPeriodEnd = currentPeriodEnd
            self.currentPeriodStart = currentPeriodStart
            self.customer = customer
            self.defaultPaymentMethod = defaultPaymentMethod
            self.discount = discount
            self.endedAt = endedAt
            self.livemode = livemode
            self.metadata = metadata
            self.startDate = startDate
            self.status = status
            self.trialEnd = trialEnd
            self.trialStart = trialStart
        }

        public enum CodingKeys: String, CodingKey {
            case id,
                 object,
                 application,
                 cancelAt = "cancel_at",
                 cancelAtPeriodEnd = "cancel_at_period_end",
                 canceledAt = "canceled_at",
                 collectionMethod = "collection_method",
                 created,
                 currency,
                 currentPeriodEnd = "current_period_end",
                 currentPeriodStart = "current_period_start",
                 customer,
                 defaultPaymentMethod = "default_payment_method",
                 discount,
                 endedAt = "ended_at",
                 livemode,
                 metadata,
                 startDate = "start_date",
                 status,
                 trialEnd = "trial_end",
                 trialStart = "trial_start"
        }
    }

    public struct ReturnObject: Codable {
        public let object: String
        public let url: String
        public let hasMore: Bool
        public let data: [Customer]

        /// Designated initializer
        public init(object: String, url: String, hasMore: Bool, data: [Customer]) {
            self.object = object
            self.url = url
            self.hasMore = hasMore
            self.data = data
        }

        enum CodingKeys: String, CodingKey {
            case object,
                 url,
                 hasMore = "has_more",
                 data
        }
    }

    // MARK: - Tax
    public struct Tax: Codable {
        /// Surfaces if automatic tax computation is possible given the current customer location information.
        public let automaticTax: AutomaticTaxStatus
        /// A recent IP address of the customer used for tax reporting and tax location inference.
        public let ipAddress: String?
        /// The customer's location as identified by Stripe Tax.
        public let location: TaxLocation?

        public init(automaticTax: AutomaticTaxStatus, ipAddress: String?, location: TaxLocation?) {
            self.automaticTax = automaticTax
            self.ipAddress = ipAddress
            self.location = location
        }

        public enum CodingKeys: String, CodingKey {
            case automaticTax = "automatic_tax"
            case ipAddress = "ip_address"
            case location
        }

        public enum AutomaticTaxStatus: String, Codable {
            case supported
            case notCollecting = "not_collecting"
            case unrecognizedLocation = "unrecognized_location"
            case failed
        }

        public struct TaxLocation: Codable {
            /// The customer's country as identified by Stripe Tax.
            public let country: String?
            /// The data source used to infer the customer's location.
            public let source: LocationSource?
            /// The customer's state, county, province, or region as identified by Stripe Tax.
            public let state: String?

            public init(country: String?, source: LocationSource?, state: String?) {
                self.country = country
                self.source = source
                self.state = state
            }

            public enum LocationSource: String, Codable {
                case billingAddress = "billing_address"
                case ipAddress = "ip_address"
                case paymentMethod = "payment_method"
                case shippingDestination = "shipping_destination"
            }
        }
    }

    // MARK: - Tax ID
    public struct TaxId: Codable {
        /// Unique identifier for the object.
        public let id: String
        /// String representing the object's type.
        public let object: String
        /// Two-letter ISO code representing the country of the tax ID.
        public let country: String?
        /// Time at which the object was created.
        public let created: TimeInterval
        /// ID of the customer.
        public let customer: String?
        /// Has the value true if the object exists in live mode.
        public let livemode: Bool
        /// Type of the tax ID.
        public let type: String
        /// Value of the tax ID.
        public let value: String
        /// Tax ID verification information.
        public let verification: Verification?

        public init(id: String, object: String, country: String?, created: TimeInterval, customer: String?, livemode: Bool, type: String, value: String, verification: Verification?) {
            self.id = id
            self.object = object
            self.country = country
            self.created = created
            self.customer = customer
            self.livemode = livemode
            self.type = type
            self.value = value
            self.verification = verification
        }

        public struct Verification: Codable {
            /// Verification status.
            public let status: Status
            /// Verified address.
            public let verifiedAddress: String?
            /// Verified name.
            public let verifiedName: String?

            public init(status: Status, verifiedAddress: String?, verifiedName: String?) {
                self.status = status
                self.verifiedAddress = verifiedAddress
                self.verifiedName = verifiedName
            }

            public enum CodingKeys: String, CodingKey {
                case status
                case verifiedAddress = "verified_address"
                case verifiedName = "verified_name"
            }

            public enum Status: String, Codable {
                case pending
                case verified
                case unverified
                case unavailable
            }
        }
    }
}
