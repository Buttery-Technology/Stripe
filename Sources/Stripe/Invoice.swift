//
//  Invoice.swift
//  Stripe
//
//  Full Invoice object for the Stripe API.
//

import Foundation

public struct Invoice: Codable {
    public static let schema = "invoices"

    /// Unique identifier for the object.
    public let id: String
    /// String representing the object's type.
    public let object: String
    /// The country of the business associated with this invoice.
    public let accountCountry: String?
    /// The public name of the business associated with this invoice.
    public let accountName: String?
    /// The account tax IDs associated with the invoice.
    public let accountTaxIds: [String]?
    /// Final amount due at this time for this invoice.
    public let amountDue: Int
    /// Amount that was overpaid on the invoice.
    public let amountOverpaid: Int
    /// The amount, in cents, that was paid.
    public let amountPaid: Int
    /// The difference between amount_due and amount_paid, in cents.
    public let amountRemaining: Int
    /// Total shipping cost of all line items on this invoice.
    public let amountShipping: Int
    /// ID of the Connect Application that created the invoice.
    public let application: String?
    /// Number of payment attempts made for this invoice.
    public let attemptCount: Int
    /// Whether an attempt has been made to pay the invoice.
    public let attempted: Bool
    /// Controls whether Stripe will perform automatic collection of the invoice.
    public let autoAdvance: Bool
    /// Settings for automatic tax lookup for this invoice.
    public let automaticTax: InvoiceAutomaticTax
    /// Indicates the reason why the invoice was created.
    public let billingReason: BillingReason?
    /// Either `charge_automatically` or `send_invoice`.
    public let collectionMethod: CollectionMethod
    /// Time at which the object was created. Measured in seconds since the Unix epoch.
    public let created: TimeInterval
    /// Three-letter ISO currency code.
    public let currency: String
    /// Custom fields displayed on the invoice.
    public let customFields: [InvoiceCustomField]?
    /// The ID of the customer who will be billed.
    public let customer: String
    /// The customer's address.
    public let customerAddress: Address?
    /// The customer's email.
    public let customerEmail: String?
    /// The customer's name.
    public let customerName: String?
    /// The customer's phone number.
    public let customerPhone: String?
    /// The customer's shipping information.
    public let customerShipping: Shipping?
    /// The customer's tax exempt status.
    public let customerTaxExempt: CustomerTaxExempt?
    /// The customer's tax IDs.
    public let customerTaxIds: [InvoiceCustomerTaxId]?
    /// ID of the default payment method for the invoice.
    public let defaultPaymentMethod: String?
    /// ID of the default payment source for the invoice.
    public let defaultSource: String?
    /// The tax rates applied to this invoice, if any.
    public let defaultTaxRates: [TaxRate]
    /// An arbitrary string attached to the object.
    public let invoiceDescription: String?
    /// The discounts applied to the invoice.
    public let discounts: [String]
    /// The date on which payment for this invoice is due.
    public let dueDate: TimeInterval?
    /// The date when this invoice is in effect.
    public let effectiveAt: TimeInterval?
    /// Ending customer balance after the invoice is finalized.
    public let endingBalance: Int?
    /// Footer displayed on the invoice.
    public let footer: String?
    /// Details of the invoice that was cloned.
    public let fromInvoice: FromInvoice?
    /// The URL for the hosted invoice page.
    public let hostedInvoiceUrl: String?
    /// The link to download the PDF for the invoice.
    public let invoicePdf: String?
    /// The connected account that issues the invoice.
    public let issuer: Issuer
    /// The error encountered during the previous attempt to finalize the invoice.
    public let lastFinalizationError: LastFinalizationError?
    /// The ID of the most recent non-draft revision of this invoice.
    public let latestRevision: String?
    /// The individual line items that make up the invoice.
    public let lines: ListObject<InvoiceLineItem>
    /// Has the value `true` if the object exists in live mode.
    public let livemode: Bool
    /// Set of key-value pairs attached to the object.
    public let metadata: Metadata?
    /// The time at which payment will next be attempted.
    public let nextPaymentAttempt: TimeInterval?
    /// A unique, identifying string that appears on emails sent for this invoice.
    public let number: String?
    /// The account on behalf of which to charge.
    public let onBehalfOf: String?
    /// Configuration settings for the PaymentIntent that is generated when the invoice is finalized.
    public let paymentSettings: InvoicePaymentSettings
    /// End of the usage period during which invoice items were added to this invoice.
    public let periodEnd: TimeInterval
    /// Start of the usage period during which invoice items were added to this invoice.
    public let periodStart: TimeInterval
    /// Total amount of all post-payment credit notes issued for this invoice.
    public let postPaymentCreditNotesAmount: Int
    /// Total amount of all pre-payment credit notes issued for this invoice.
    public let prePaymentCreditNotesAmount: Int
    /// This is the transaction number that appears on email receipts.
    public let receiptNumber: String?
    /// Options for invoice PDF rendering.
    public let rendering: InvoiceRendering?
    /// The shipping cost details for the invoice.
    public let shippingCost: InvoiceShippingCost?
    /// Shipping details for the invoice.
    public let shippingDetails: Shipping?
    /// Starting customer balance before the invoice is finalized.
    public let startingBalance: Int
    /// Extra information about an invoice for the customer's credit card statement.
    public let statementDescriptor: String?
    /// The status of the invoice.
    public let status: InvoiceStatus?
    /// Timestamps when the invoice status changed.
    public let statusTransitions: StatusTransitions
    /// The subscription that this invoice was prepared for, if any.
    public let subscription: String?
    /// Total of all subscriptions, invoice items, and prorations on the invoice before any discount or exclusive tax is applied.
    public let subtotal: Int
    /// The integer amount in cents representing the subtotal excluding tax.
    public let subtotalExcludingTax: Int?
    /// ID of the test clock this invoice belongs to.
    public let testClock: String?
    /// The reason this invoice was marked uncollectible.
    public let thresholdReason: ThresholdReason?
    /// Total after discounts and taxes.
    public let total: Int
    /// The aggregate amounts calculated per discount across all line items.
    public let totalDiscountAmounts: [TotalDiscountAmount]?
    /// The integer amount in cents representing the total excluding tax.
    public let totalExcludingTax: Int?
    /// The aggregate amounts calculated per tax rate for all line items.
    public let totalTaxAmounts: [TotalTaxAmount]?
    /// Invoices are automatically paid or sent 1 hour after webhooks are delivered.
    public let webhooksDeliveredAt: TimeInterval?

    public init(id: String, object: String, accountCountry: String?, accountName: String?, accountTaxIds: [String]?, amountDue: Int, amountOverpaid: Int, amountPaid: Int, amountRemaining: Int, amountShipping: Int, application: String?, attemptCount: Int, attempted: Bool, autoAdvance: Bool, automaticTax: InvoiceAutomaticTax, billingReason: BillingReason?, collectionMethod: CollectionMethod, created: TimeInterval, currency: String, customFields: [InvoiceCustomField]?, customer: String, customerAddress: Address?, customerEmail: String?, customerName: String?, customerPhone: String?, customerShipping: Shipping?, customerTaxExempt: CustomerTaxExempt?, customerTaxIds: [InvoiceCustomerTaxId]?, defaultPaymentMethod: String?, defaultSource: String?, defaultTaxRates: [TaxRate], invoiceDescription: String?, discounts: [String], dueDate: TimeInterval?, effectiveAt: TimeInterval?, endingBalance: Int?, footer: String?, fromInvoice: FromInvoice?, hostedInvoiceUrl: String?, invoicePdf: String?, issuer: Issuer, lastFinalizationError: LastFinalizationError?, latestRevision: String?, lines: ListObject<InvoiceLineItem>, livemode: Bool, metadata: Metadata?, nextPaymentAttempt: TimeInterval?, number: String?, onBehalfOf: String?, paymentSettings: InvoicePaymentSettings, periodEnd: TimeInterval, periodStart: TimeInterval, postPaymentCreditNotesAmount: Int, prePaymentCreditNotesAmount: Int, receiptNumber: String?, rendering: InvoiceRendering?, shippingCost: InvoiceShippingCost?, shippingDetails: Shipping?, startingBalance: Int, statementDescriptor: String?, status: InvoiceStatus?, statusTransitions: StatusTransitions, subscription: String?, subtotal: Int, subtotalExcludingTax: Int?, testClock: String?, thresholdReason: ThresholdReason?, total: Int, totalDiscountAmounts: [TotalDiscountAmount]?, totalExcludingTax: Int?, totalTaxAmounts: [TotalTaxAmount]?, webhooksDeliveredAt: TimeInterval?) {
        self.id = id
        self.object = object
        self.accountCountry = accountCountry
        self.accountName = accountName
        self.accountTaxIds = accountTaxIds
        self.amountDue = amountDue
        self.amountOverpaid = amountOverpaid
        self.amountPaid = amountPaid
        self.amountRemaining = amountRemaining
        self.amountShipping = amountShipping
        self.application = application
        self.attemptCount = attemptCount
        self.attempted = attempted
        self.autoAdvance = autoAdvance
        self.automaticTax = automaticTax
        self.billingReason = billingReason
        self.collectionMethod = collectionMethod
        self.created = created
        self.currency = currency
        self.customFields = customFields
        self.customer = customer
        self.customerAddress = customerAddress
        self.customerEmail = customerEmail
        self.customerName = customerName
        self.customerPhone = customerPhone
        self.customerShipping = customerShipping
        self.customerTaxExempt = customerTaxExempt
        self.customerTaxIds = customerTaxIds
        self.defaultPaymentMethod = defaultPaymentMethod
        self.defaultSource = defaultSource
        self.defaultTaxRates = defaultTaxRates
        self.invoiceDescription = invoiceDescription
        self.discounts = discounts
        self.dueDate = dueDate
        self.effectiveAt = effectiveAt
        self.endingBalance = endingBalance
        self.footer = footer
        self.fromInvoice = fromInvoice
        self.hostedInvoiceUrl = hostedInvoiceUrl
        self.invoicePdf = invoicePdf
        self.issuer = issuer
        self.lastFinalizationError = lastFinalizationError
        self.latestRevision = latestRevision
        self.lines = lines
        self.livemode = livemode
        self.metadata = metadata
        self.nextPaymentAttempt = nextPaymentAttempt
        self.number = number
        self.onBehalfOf = onBehalfOf
        self.paymentSettings = paymentSettings
        self.periodEnd = periodEnd
        self.periodStart = periodStart
        self.postPaymentCreditNotesAmount = postPaymentCreditNotesAmount
        self.prePaymentCreditNotesAmount = prePaymentCreditNotesAmount
        self.receiptNumber = receiptNumber
        self.rendering = rendering
        self.shippingCost = shippingCost
        self.shippingDetails = shippingDetails
        self.startingBalance = startingBalance
        self.statementDescriptor = statementDescriptor
        self.status = status
        self.statusTransitions = statusTransitions
        self.subscription = subscription
        self.subtotal = subtotal
        self.subtotalExcludingTax = subtotalExcludingTax
        self.testClock = testClock
        self.thresholdReason = thresholdReason
        self.total = total
        self.totalDiscountAmounts = totalDiscountAmounts
        self.totalExcludingTax = totalExcludingTax
        self.totalTaxAmounts = totalTaxAmounts
        self.webhooksDeliveredAt = webhooksDeliveredAt
    }

    public enum CodingKeys: String, CodingKey {
        case id,
             object,
             accountCountry = "account_country",
             accountName = "account_name",
             accountTaxIds = "account_tax_ids",
             amountDue = "amount_due",
             amountOverpaid = "amount_overpaid",
             amountPaid = "amount_paid",
             amountRemaining = "amount_remaining",
             amountShipping = "amount_shipping",
             application,
             attemptCount = "attempt_count",
             attempted,
             autoAdvance = "auto_advance",
             automaticTax = "automatic_tax",
             billingReason = "billing_reason",
             collectionMethod = "collection_method",
             created,
             currency,
             customFields = "custom_fields",
             customer,
             customerAddress = "customer_address",
             customerEmail = "customer_email",
             customerName = "customer_name",
             customerPhone = "customer_phone",
             customerShipping = "customer_shipping",
             customerTaxExempt = "customer_tax_exempt",
             customerTaxIds = "customer_tax_ids",
             defaultPaymentMethod = "default_payment_method",
             defaultSource = "default_source",
             defaultTaxRates = "default_tax_rates",
             invoiceDescription = "description",
             discounts,
             dueDate = "due_date",
             effectiveAt = "effective_at",
             endingBalance = "ending_balance",
             footer,
             fromInvoice = "from_invoice",
             hostedInvoiceUrl = "hosted_invoice_url",
             invoicePdf = "invoice_pdf",
             issuer,
             lastFinalizationError = "last_finalization_error",
             latestRevision = "latest_revision",
             lines,
             livemode,
             metadata,
             nextPaymentAttempt = "next_payment_attempt",
             number,
             onBehalfOf = "on_behalf_of",
             paymentSettings = "payment_settings",
             periodEnd = "period_end",
             periodStart = "period_start",
             postPaymentCreditNotesAmount = "post_payment_credit_notes_amount",
             prePaymentCreditNotesAmount = "pre_payment_credit_notes_amount",
             receiptNumber = "receipt_number",
             rendering,
             shippingCost = "shipping_cost",
             shippingDetails = "shipping_details",
             startingBalance = "starting_balance",
             statementDescriptor = "statement_descriptor",
             status,
             statusTransitions = "status_transitions",
             subscription,
             subtotal,
             subtotalExcludingTax = "subtotal_excluding_tax",
             testClock = "test_clock",
             thresholdReason = "threshold_reason",
             total,
             totalDiscountAmounts = "total_discount_amounts",
             totalExcludingTax = "total_excluding_tax",
             totalTaxAmounts = "total_tax_amounts",
             webhooksDeliveredAt = "webhooks_delivered_at"
    }

    // MARK: - Invoice Status

    public enum InvoiceStatus: String, Codable {
        case draft
        case open
        case paid
        case uncollectible
        case void
    }

    // MARK: - Billing Reason

    public enum BillingReason: String, Codable {
        case automaticPendingInvoiceItemInvoice = "automatic_pending_invoice_item_invoice"
        case manual
        case quoteAccept = "quote_accept"
        case subscription
        case subscriptionCreate = "subscription_create"
        case subscriptionCycle = "subscription_cycle"
        case subscriptionThreshold = "subscription_threshold"
        case subscriptionUpdate = "subscription_update"
        case upcoming
    }

    // MARK: - Collection Method

    public enum CollectionMethod: String, Codable {
        case chargeAutomatically = "charge_automatically"
        case sendInvoice = "send_invoice"
    }

    // MARK: - Customer Tax Exempt

    public enum CustomerTaxExempt: String, Codable {
        case exempt
        case none
        case reverse
    }

    // MARK: - Invoice Automatic Tax

    public struct InvoiceAutomaticTax: Codable {
        /// Whether automatic tax collection is enabled.
        public let enabled: Bool
        /// The reason automatic tax is disabled.
        public let disabledReason: String?
        /// The account that's liable for tax.
        public let liability: Issuer?
        /// The status of the most recent automated tax calculation.
        public let status: AutomaticTaxStatus?

        public init(enabled: Bool, disabledReason: String?, liability: Issuer?, status: AutomaticTaxStatus?) {
            self.enabled = enabled
            self.disabledReason = disabledReason
            self.liability = liability
            self.status = status
        }

        public enum CodingKeys: String, CodingKey {
            case enabled,
                 disabledReason = "disabled_reason",
                 liability,
                 status
        }

        public enum AutomaticTaxStatus: String, Codable {
            case complete
            case failed
            case requiresLocationInputs = "requires_location_inputs"
        }
    }

    // MARK: - Invoice Custom Field

    public struct InvoiceCustomField: Codable {
        /// The name of the custom field.
        public let name: String
        /// The value of the custom field.
        public let value: String

        public init(name: String, value: String) {
            self.name = name
            self.value = value
        }
    }

    // MARK: - Invoice Customer Tax ID

    public struct InvoiceCustomerTaxId: Codable {
        /// The type of the tax ID.
        public let type: String
        /// The value of the tax ID.
        public let value: String?

        public init(type: String, value: String?) {
            self.type = type
            self.value = value
        }
    }

    // MARK: - Issuer

    public struct Issuer: Codable {
        /// The connected account being referenced.
        public let account: String?
        /// Type of the account referenced.
        public let type: IssuerType

        public init(account: String?, type: IssuerType) {
            self.account = account
            self.type = type
        }

        public enum IssuerType: String, Codable {
            case account
            case `self`
        }
    }

    // MARK: - From Invoice

    public struct FromInvoice: Codable {
        /// The relation between this invoice and the cloned invoice.
        public let action: String
        /// The invoice that was cloned.
        public let invoice: String

        public init(action: String, invoice: String) {
            self.action = action
            self.invoice = invoice
        }
    }

    // MARK: - Last Finalization Error

    public struct LastFinalizationError: Codable {
        /// A code for the error type.
        public let code: String?
        /// A URL for the documentation about this error.
        public let docUrl: String?
        /// A human-readable message providing more details about the error.
        public let message: String?
        /// The parameter the error relates to.
        public let param: String?
        /// The type of error returned.
        public let type: ErrorType

        public init(code: String?, docUrl: String?, message: String?, param: String?, type: ErrorType) {
            self.code = code
            self.docUrl = docUrl
            self.message = message
            self.param = param
            self.type = type
        }

        public enum CodingKeys: String, CodingKey {
            case code,
                 docUrl = "doc_url",
                 message,
                 param,
                 type
        }

        public enum ErrorType: String, Codable {
            case apiError = "api_error"
            case cardError = "card_error"
            case idempotencyError = "idempotency_error"
            case invalidRequestError = "invalid_request_error"
        }
    }

    // MARK: - Invoice Payment Settings

    public struct InvoicePaymentSettings: Codable {
        /// ID of the mandate to be used for this invoice.
        public let defaultMandate: String?
        /// Payment-method-specific configuration.
        public let paymentMethodOptions: [String: AnyCodable]?
        /// The list of payment method types to provide to invoices.
        public let paymentMethodTypes: [String]?

        public init(defaultMandate: String?, paymentMethodOptions: [String: AnyCodable]?, paymentMethodTypes: [String]?) {
            self.defaultMandate = defaultMandate
            self.paymentMethodOptions = paymentMethodOptions
            self.paymentMethodTypes = paymentMethodTypes
        }

        public enum CodingKeys: String, CodingKey {
            case defaultMandate = "default_mandate",
                 paymentMethodOptions = "payment_method_options",
                 paymentMethodTypes = "payment_method_types"
        }
    }

    // MARK: - Invoice Rendering

    public struct InvoiceRendering: Codable {
        /// How line-item taxes are rendered on invoice.
        public let amountTaxDisplay: String?
        /// Invoice pdf rendering options.
        public let pdf: PDFRendering?
        /// ID of the rendering template.
        public let template: String?
        /// Version of the rendering template.
        public let templateVersion: Int?

        public init(amountTaxDisplay: String?, pdf: PDFRendering?, template: String?, templateVersion: Int?) {
            self.amountTaxDisplay = amountTaxDisplay
            self.pdf = pdf
            self.template = template
            self.templateVersion = templateVersion
        }

        public enum CodingKeys: String, CodingKey {
            case amountTaxDisplay = "amount_tax_display",
                 pdf,
                 template,
                 templateVersion = "template_version"
        }

        public struct PDFRendering: Codable {
            /// Page size for invoice PDF.
            public let pageSize: String?

            public init(pageSize: String?) {
                self.pageSize = pageSize
            }

            public enum CodingKeys: String, CodingKey {
                case pageSize = "page_size"
            }
        }
    }

    // MARK: - Invoice Shipping Cost

    public struct InvoiceShippingCost: Codable {
        /// Total shipping cost before any taxes are applied.
        public let amountSubtotal: Int
        /// Total tax amount applied due to shipping costs.
        public let amountTax: Int
        /// Total shipping cost after taxes are applied.
        public let amountTotal: Int
        /// The ID of the ShippingRate for this invoice.
        public let shippingRate: String?
        /// The taxes applied to the shipping rate.
        public let taxes: [ShippingTax]?

        public init(amountSubtotal: Int, amountTax: Int, amountTotal: Int, shippingRate: String?, taxes: [ShippingTax]?) {
            self.amountSubtotal = amountSubtotal
            self.amountTax = amountTax
            self.amountTotal = amountTotal
            self.shippingRate = shippingRate
            self.taxes = taxes
        }

        public enum CodingKeys: String, CodingKey {
            case amountSubtotal = "amount_subtotal",
                 amountTax = "amount_tax",
                 amountTotal = "amount_total",
                 shippingRate = "shipping_rate",
                 taxes
        }

        public struct ShippingTax: Codable {
            /// Amount of tax applied for this rate.
            public let amount: Int
            /// The tax rate applied.
            public let rate: TaxRate

            public init(amount: Int, rate: TaxRate) {
                self.amount = amount
                self.rate = rate
            }
        }
    }

    // MARK: - Status Transitions

    public struct StatusTransitions: Codable {
        /// The time that the invoice draft was finalized.
        public let finalizedAt: TimeInterval?
        /// The time that the invoice was marked uncollectible.
        public let markedUncollectibleAt: TimeInterval?
        /// The time that the invoice was paid.
        public let paidAt: TimeInterval?
        /// The time that the invoice was voided.
        public let voidedAt: TimeInterval?

        public init(finalizedAt: TimeInterval?, markedUncollectibleAt: TimeInterval?, paidAt: TimeInterval?, voidedAt: TimeInterval?) {
            self.finalizedAt = finalizedAt
            self.markedUncollectibleAt = markedUncollectibleAt
            self.paidAt = paidAt
            self.voidedAt = voidedAt
        }

        public enum CodingKeys: String, CodingKey {
            case finalizedAt = "finalized_at",
                 markedUncollectibleAt = "marked_uncollectible_at",
                 paidAt = "paid_at",
                 voidedAt = "voided_at"
        }
    }

    // MARK: - Threshold Reason

    public struct ThresholdReason: Codable {
        /// The total invoice amount threshold boundary.
        public let amountGte: Int?
        /// Indicates which line items triggered a threshold invoice.
        public let itemReasons: [ItemReason]

        public init(amountGte: Int?, itemReasons: [ItemReason]) {
            self.amountGte = amountGte
            self.itemReasons = itemReasons
        }

        public enum CodingKeys: String, CodingKey {
            case amountGte = "amount_gte",
                 itemReasons = "item_reasons"
        }

        public struct ItemReason: Codable {
            /// The IDs of the line items that triggered the threshold invoice.
            public let lineItemIds: [String]
            /// The quantity threshold boundary that applied to the given line item.
            public let usageGte: Int

            public init(lineItemIds: [String], usageGte: Int) {
                self.lineItemIds = lineItemIds
                self.usageGte = usageGte
            }

            public enum CodingKeys: String, CodingKey {
                case lineItemIds = "line_item_ids",
                     usageGte = "usage_gte"
            }
        }
    }

    // MARK: - Total Discount Amount

    public struct TotalDiscountAmount: Codable {
        /// The amount discounted.
        public let amount: Int
        /// The discount that was applied.
        public let discount: String

        public init(amount: Int, discount: String) {
            self.amount = amount
            self.discount = discount
        }
    }

    // MARK: - Total Tax Amount

    public struct TotalTaxAmount: Codable {
        /// The amount of the tax.
        public let amount: Int
        /// Whether this tax amount is inclusive or exclusive.
        public let inclusive: Bool
        /// The tax rate that was applied.
        public let taxRate: String

        public init(amount: Int, inclusive: Bool, taxRate: String) {
            self.amount = amount
            self.inclusive = inclusive
            self.taxRate = taxRate
        }

        public enum CodingKeys: String, CodingKey {
            case amount,
                 inclusive,
                 taxRate = "tax_rate"
        }
    }
}

// MARK: - Invoice Line Item

public struct InvoiceLineItem: Codable {
    /// Unique identifier for the object.
    public let id: String
    /// String representing the object's type.
    public let object: String
    /// The amount, in cents.
    public let amount: Int
    /// Three-letter ISO currency code.
    public let currency: String
    /// An arbitrary string attached to the object.
    public let lineItemDescription: String?
    /// The amount of discount applied.
    public let discountAmounts: [DiscountAmount]?
    /// If true, discounts will apply to this line item.
    public let discountable: Bool
    /// The discounts applied to the invoice line item.
    public let discounts: [String]
    /// The ID of the invoice this line item belongs to.
    public let invoice: String?
    /// Has the value `true` if the object exists in live mode.
    public let livemode: Bool
    /// Set of key-value pairs attached to the object.
    public let metadata: Metadata
    /// The period this line item covers.
    public let period: Period
    /// The price of the line item.
    public let price: Price?
    /// Whether this is a proration.
    public let proration: Bool
    /// The quantity of the subscription.
    public let quantity: Int?
    /// The subscription that the invoice item belongs to.
    public let subscription: String?
    /// The subscription item that generated this invoice item.
    public let subscriptionItem: String?
    /// The amount of tax calculated.
    public let taxAmounts: [LineTaxAmount]?
    /// The tax rates applied to this line item.
    public let taxRates: [TaxRate]?
    /// A string identifying the type of the source of this line item.
    public let type: LineItemType

    public init(id: String, object: String, amount: Int, currency: String, lineItemDescription: String?, discountAmounts: [DiscountAmount]?, discountable: Bool, discounts: [String], invoice: String?, livemode: Bool, metadata: Metadata, period: Period, price: Price?, proration: Bool, quantity: Int?, subscription: String?, subscriptionItem: String?, taxAmounts: [LineTaxAmount]?, taxRates: [TaxRate]?, type: LineItemType) {
        self.id = id
        self.object = object
        self.amount = amount
        self.currency = currency
        self.lineItemDescription = lineItemDescription
        self.discountAmounts = discountAmounts
        self.discountable = discountable
        self.discounts = discounts
        self.invoice = invoice
        self.livemode = livemode
        self.metadata = metadata
        self.period = period
        self.price = price
        self.proration = proration
        self.quantity = quantity
        self.subscription = subscription
        self.subscriptionItem = subscriptionItem
        self.taxAmounts = taxAmounts
        self.taxRates = taxRates
        self.type = type
    }

    public enum CodingKeys: String, CodingKey {
        case id,
             object,
             amount,
             currency,
             lineItemDescription = "description",
             discountAmounts = "discount_amounts",
             discountable,
             discounts,
             invoice,
             livemode,
             metadata,
             period,
             price,
             proration,
             quantity,
             subscription,
             subscriptionItem = "subscription_item",
             taxAmounts = "tax_amounts",
             taxRates = "tax_rates",
             type
    }

    public enum LineItemType: String, Codable {
        case invoiceitem
        case subscription
    }

    public struct Period: Codable {
        /// The end of the period.
        public let end: TimeInterval
        /// The start of the period.
        public let start: TimeInterval

        public init(end: TimeInterval, start: TimeInterval) {
            self.end = end
            self.start = start
        }
    }

    public struct DiscountAmount: Codable {
        /// The amount discounted.
        public let amount: Int
        /// The discount that was applied.
        public let discount: String

        public init(amount: Int, discount: String) {
            self.amount = amount
            self.discount = discount
        }
    }

    public struct LineTaxAmount: Codable {
        /// The amount of the tax.
        public let amount: Int
        /// Whether this tax amount is inclusive or exclusive.
        public let inclusive: Bool
        /// The tax rate that was applied.
        public let taxRate: String

        public init(amount: Int, inclusive: Bool, taxRate: String) {
            self.amount = amount
            self.inclusive = inclusive
            self.taxRate = taxRate
        }

        public enum CodingKeys: String, CodingKey {
            case amount,
                 inclusive,
                 taxRate = "tax_rate"
        }
    }
}
