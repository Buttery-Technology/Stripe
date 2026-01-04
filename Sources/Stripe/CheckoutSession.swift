//
//  CheckoutSession.swift
//  Stripe
//
//  Checkout Session object for Stripe's hosted checkout.
//

import Foundation

public struct CheckoutSession: Codable {
    public static let schema = "checkout/sessions"

    /// Unique identifier for the object.
    public let id: String
    /// String representing the object's type.
    public let object: String
    /// Total of all items after discounts and taxes are applied.
    public let amountSubtotal: Int?
    /// Total of all items before discounts or taxes are applied.
    public let amountTotal: Int?
    /// Settings for automatic tax lookup.
    public let automaticTax: SessionAutomaticTax
    /// Describes whether Checkout should collect the customer's billing address.
    public let billingAddressCollection: BillingAddressCollection?
    /// The URL the customer will be directed to if they decide to cancel payment.
    public let cancelUrl: String?
    /// A unique string to reference the Checkout Session.
    public let clientReferenceId: String?
    /// Client secret to be used when initializing Stripe.js embedded checkout.
    public let clientSecret: String?
    /// Results of consent_collection for this session.
    public let consent: Consent?
    /// Configure consent collection for this session.
    public let consentCollection: ConsentCollection?
    /// Time at which the object was created. Measured in seconds since the Unix epoch.
    public let created: TimeInterval
    /// Three-letter ISO currency code.
    public let currency: String?
    /// Custom fields displayed on the checkout page.
    public let customFields: [CustomFieldResponse]
    /// Custom text displayed on the checkout page.
    public let customText: CustomText
    /// The ID of the customer for this Session.
    public let customer: String?
    /// Configure whether a Checkout Session creates a Customer when the Customer is not provided.
    public let customerCreation: CustomerCreation?
    /// The customer details including email, name, phone, and address.
    public let customerDetails: CustomerDetails?
    /// The customer's email address.
    public let customerEmail: String?
    /// The discounts applied to this Session.
    public let discounts: [SessionDiscount]?
    /// The timestamp at which the Checkout Session will expire.
    public let expiresAt: TimeInterval
    /// ID of the invoice created by this Checkout Session.
    public let invoice: String?
    /// Details on the state of invoice creation for the Checkout Session.
    public let invoiceCreation: InvoiceCreation
    /// The line items purchased by the customer.
    public let lineItems: ListObject<SessionLineItem>?
    /// Has the value `true` if the object exists in live mode.
    public let livemode: Bool
    /// The IETF language tag of the locale Checkout is displayed in.
    public let locale: String?
    /// Set of key-value pairs attached to the object.
    public let metadata: Metadata?
    /// The mode of the Checkout Session.
    public let mode: Mode
    /// The ID of the PaymentIntent for Checkout Sessions in `payment` mode.
    public let paymentIntent: String?
    /// The ID of the Payment Link that created this Session.
    public let paymentLink: String?
    /// Configure whether a Checkout Session should collect a payment method.
    public let paymentMethodCollection: PaymentMethodCollection?
    /// Information about the payment method configuration.
    public let paymentMethodConfigurationDetails: PaymentMethodConfigurationDetails?
    /// Payment-method-specific configuration for the PaymentIntent or SetupIntent.
    public let paymentMethodOptions: [String: AnyCodable]?
    /// A list of the types of payment methods allowed on this Session.
    public let paymentMethodTypes: [String]
    /// The payment status of the Checkout Session.
    public let paymentStatus: PaymentStatus
    /// Configure whether a Checkout Session collects phone numbers.
    public let phoneNumberCollection: PhoneNumberCollection?
    /// The ID of the original expired Checkout Session that triggered the recovery flow.
    public let recoveredFrom: String?
    /// Controls behavior after payment completion.
    public let redirectOnCompletion: RedirectOnCompletion?
    /// URL to redirect customers after payment or setup completion.
    public let returnUrl: String?
    /// The ID of the SetupIntent for Checkout Sessions in `setup` mode.
    public let setupIntent: String?
    /// Shipping address collection settings.
    public let shippingAddressCollection: ShippingAddressCollection?
    /// The details of the shipping cost, if any.
    public let shippingCost: SessionShippingCost?
    /// The shipping rate options applied to this Session.
    public let shippingOptions: [ShippingOption]
    /// The status of the Checkout Session.
    public let status: SessionStatus?
    /// Describes the type of transaction being performed.
    public let submitType: SubmitType?
    /// The ID of the subscription for Checkout Sessions in `subscription` mode.
    public let subscription: String?
    /// The URL the customer will be directed to after successful payment.
    public let successUrl: String?
    /// Details on the tax ID collection settings.
    public let taxIdCollection: TaxIdCollection?
    /// Tax and discount details for the computed total amount.
    public let totalDetails: TotalDetails?
    /// The UI mode of the Session.
    public let uiMode: UIMode?
    /// The URL to the Checkout Session.
    public let url: String?

    public init(id: String, object: String, amountSubtotal: Int?, amountTotal: Int?, automaticTax: SessionAutomaticTax, billingAddressCollection: BillingAddressCollection?, cancelUrl: String?, clientReferenceId: String?, clientSecret: String?, consent: Consent?, consentCollection: ConsentCollection?, created: TimeInterval, currency: String?, customFields: [CustomFieldResponse], customText: CustomText, customer: String?, customerCreation: CustomerCreation?, customerDetails: CustomerDetails?, customerEmail: String?, discounts: [SessionDiscount]?, expiresAt: TimeInterval, invoice: String?, invoiceCreation: InvoiceCreation, lineItems: ListObject<SessionLineItem>?, livemode: Bool, locale: String?, metadata: Metadata?, mode: Mode, paymentIntent: String?, paymentLink: String?, paymentMethodCollection: PaymentMethodCollection?, paymentMethodConfigurationDetails: PaymentMethodConfigurationDetails?, paymentMethodOptions: [String: AnyCodable]?, paymentMethodTypes: [String], paymentStatus: PaymentStatus, phoneNumberCollection: PhoneNumberCollection?, recoveredFrom: String?, redirectOnCompletion: RedirectOnCompletion?, returnUrl: String?, setupIntent: String?, shippingAddressCollection: ShippingAddressCollection?, shippingCost: SessionShippingCost?, shippingOptions: [ShippingOption], status: SessionStatus?, submitType: SubmitType?, subscription: String?, successUrl: String?, taxIdCollection: TaxIdCollection?, totalDetails: TotalDetails?, uiMode: UIMode?, url: String?) {
        self.id = id
        self.object = object
        self.amountSubtotal = amountSubtotal
        self.amountTotal = amountTotal
        self.automaticTax = automaticTax
        self.billingAddressCollection = billingAddressCollection
        self.cancelUrl = cancelUrl
        self.clientReferenceId = clientReferenceId
        self.clientSecret = clientSecret
        self.consent = consent
        self.consentCollection = consentCollection
        self.created = created
        self.currency = currency
        self.customFields = customFields
        self.customText = customText
        self.customer = customer
        self.customerCreation = customerCreation
        self.customerDetails = customerDetails
        self.customerEmail = customerEmail
        self.discounts = discounts
        self.expiresAt = expiresAt
        self.invoice = invoice
        self.invoiceCreation = invoiceCreation
        self.lineItems = lineItems
        self.livemode = livemode
        self.locale = locale
        self.metadata = metadata
        self.mode = mode
        self.paymentIntent = paymentIntent
        self.paymentLink = paymentLink
        self.paymentMethodCollection = paymentMethodCollection
        self.paymentMethodConfigurationDetails = paymentMethodConfigurationDetails
        self.paymentMethodOptions = paymentMethodOptions
        self.paymentMethodTypes = paymentMethodTypes
        self.paymentStatus = paymentStatus
        self.phoneNumberCollection = phoneNumberCollection
        self.recoveredFrom = recoveredFrom
        self.redirectOnCompletion = redirectOnCompletion
        self.returnUrl = returnUrl
        self.setupIntent = setupIntent
        self.shippingAddressCollection = shippingAddressCollection
        self.shippingCost = shippingCost
        self.shippingOptions = shippingOptions
        self.status = status
        self.submitType = submitType
        self.subscription = subscription
        self.successUrl = successUrl
        self.taxIdCollection = taxIdCollection
        self.totalDetails = totalDetails
        self.uiMode = uiMode
        self.url = url
    }

    public enum CodingKeys: String, CodingKey {
        case id,
             object,
             amountSubtotal = "amount_subtotal",
             amountTotal = "amount_total",
             automaticTax = "automatic_tax",
             billingAddressCollection = "billing_address_collection",
             cancelUrl = "cancel_url",
             clientReferenceId = "client_reference_id",
             clientSecret = "client_secret",
             consent,
             consentCollection = "consent_collection",
             created,
             currency,
             customFields = "custom_fields",
             customText = "custom_text",
             customer,
             customerCreation = "customer_creation",
             customerDetails = "customer_details",
             customerEmail = "customer_email",
             discounts,
             expiresAt = "expires_at",
             invoice,
             invoiceCreation = "invoice_creation",
             lineItems = "line_items",
             livemode,
             locale,
             metadata,
             mode,
             paymentIntent = "payment_intent",
             paymentLink = "payment_link",
             paymentMethodCollection = "payment_method_collection",
             paymentMethodConfigurationDetails = "payment_method_configuration_details",
             paymentMethodOptions = "payment_method_options",
             paymentMethodTypes = "payment_method_types",
             paymentStatus = "payment_status",
             phoneNumberCollection = "phone_number_collection",
             recoveredFrom = "recovered_from",
             redirectOnCompletion = "redirect_on_completion",
             returnUrl = "return_url",
             setupIntent = "setup_intent",
             shippingAddressCollection = "shipping_address_collection",
             shippingCost = "shipping_cost",
             shippingOptions = "shipping_options",
             status,
             submitType = "submit_type",
             subscription,
             successUrl = "success_url",
             taxIdCollection = "tax_id_collection",
             totalDetails = "total_details",
             uiMode = "ui_mode",
             url
    }

    // MARK: - Mode

    public enum Mode: String, Codable {
        case payment
        case setup
        case subscription
    }

    // MARK: - Session Status

    public enum SessionStatus: String, Codable {
        case complete
        case expired
        case open
    }

    // MARK: - Payment Status

    public enum PaymentStatus: String, Codable {
        case noPaymentRequired = "no_payment_required"
        case paid
        case unpaid
    }

    // MARK: - Billing Address Collection

    public enum BillingAddressCollection: String, Codable {
        case auto
        case required
    }

    // MARK: - Customer Creation

    public enum CustomerCreation: String, Codable {
        case always
        case ifRequired = "if_required"
    }

    // MARK: - Payment Method Collection

    public enum PaymentMethodCollection: String, Codable {
        case always
        case ifRequired = "if_required"
    }

    // MARK: - Submit Type

    public enum SubmitType: String, Codable {
        case auto
        case book
        case donate
        case pay
        case subscribe
    }

    // MARK: - Redirect On Completion

    public enum RedirectOnCompletion: String, Codable {
        case always
        case ifRequired = "if_required"
        case never
    }

    // MARK: - UI Mode

    public enum UIMode: String, Codable {
        case embedded
        case hosted
    }

    // MARK: - Session Automatic Tax

    public struct SessionAutomaticTax: Codable {
        /// Whether automatic tax is enabled.
        public let enabled: Bool
        /// The account that's liable for tax.
        public let liability: Issuer?
        /// The status of the most recent automated tax calculation.
        public let status: AutomaticTaxStatus?

        public init(enabled: Bool, liability: Issuer?, status: AutomaticTaxStatus?) {
            self.enabled = enabled
            self.liability = liability
            self.status = status
        }

        public enum AutomaticTaxStatus: String, Codable {
            case complete
            case failed
            case requiresLocationInputs = "requires_location_inputs"
        }

        public struct Issuer: Codable {
            public let account: String?
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
    }

    // MARK: - Consent

    public struct Consent: Codable {
        /// Promotion consent.
        public let promotions: ConsentStatus?
        /// Terms of service consent.
        public let termsOfService: ConsentStatus?

        public init(promotions: ConsentStatus?, termsOfService: ConsentStatus?) {
            self.promotions = promotions
            self.termsOfService = termsOfService
        }

        public enum CodingKeys: String, CodingKey {
            case promotions,
                 termsOfService = "terms_of_service"
        }

        public enum ConsentStatus: String, Codable {
            case optIn = "opt_in"
            case optOut = "opt_out"
        }
    }

    // MARK: - Consent Collection

    public struct ConsentCollection: Codable {
        /// Promotion consent collection.
        public let promotions: PromotionConsent?
        /// Terms of service consent collection.
        public let termsOfService: TermsOfServiceConsent?

        public init(promotions: PromotionConsent?, termsOfService: TermsOfServiceConsent?) {
            self.promotions = promotions
            self.termsOfService = termsOfService
        }

        public enum CodingKeys: String, CodingKey {
            case promotions,
                 termsOfService = "terms_of_service"
        }

        public enum PromotionConsent: String, Codable {
            case auto
            case none
        }

        public enum TermsOfServiceConsent: String, Codable {
            case none
            case required
        }
    }

    // MARK: - Custom Field Response

    public struct CustomFieldResponse: Codable {
        /// The key of the custom field.
        public let key: String
        /// The label of the custom field.
        public let label: CustomFieldLabel
        /// Whether the custom field is optional.
        public let optional: Bool
        /// The type of the custom field.
        public let type: CustomFieldType
        /// The text value, if applicable.
        public let text: CustomFieldText?
        /// The dropdown value, if applicable.
        public let dropdown: CustomFieldDropdown?
        /// The numeric value, if applicable.
        public let numeric: CustomFieldNumeric?

        public init(key: String, label: CustomFieldLabel, optional: Bool, type: CustomFieldType, text: CustomFieldText?, dropdown: CustomFieldDropdown?, numeric: CustomFieldNumeric?) {
            self.key = key
            self.label = label
            self.optional = optional
            self.type = type
            self.text = text
            self.dropdown = dropdown
            self.numeric = numeric
        }

        public enum CustomFieldType: String, Codable {
            case dropdown
            case numeric
            case text
        }

        public struct CustomFieldLabel: Codable {
            public let custom: String?
            public let type: LabelType

            public init(custom: String?, type: LabelType) {
                self.custom = custom
                self.type = type
            }

            public enum LabelType: String, Codable {
                case custom
            }
        }

        public struct CustomFieldText: Codable {
            public let defaultValue: String?
            public let maximumLength: Int?
            public let minimumLength: Int?
            public let value: String?

            public init(defaultValue: String?, maximumLength: Int?, minimumLength: Int?, value: String?) {
                self.defaultValue = defaultValue
                self.maximumLength = maximumLength
                self.minimumLength = minimumLength
                self.value = value
            }

            public enum CodingKeys: String, CodingKey {
                case defaultValue = "default_value",
                     maximumLength = "maximum_length",
                     minimumLength = "minimum_length",
                     value
            }
        }

        public struct CustomFieldDropdown: Codable {
            public let defaultValue: String?
            public let options: [DropdownOption]
            public let value: String?

            public init(defaultValue: String?, options: [DropdownOption], value: String?) {
                self.defaultValue = defaultValue
                self.options = options
                self.value = value
            }

            public enum CodingKeys: String, CodingKey {
                case defaultValue = "default_value",
                     options,
                     value
            }

            public struct DropdownOption: Codable {
                public let label: String
                public let value: String

                public init(label: String, value: String) {
                    self.label = label
                    self.value = value
                }
            }
        }

        public struct CustomFieldNumeric: Codable {
            public let defaultValue: String?
            public let maximumLength: Int?
            public let minimumLength: Int?
            public let value: String?

            public init(defaultValue: String?, maximumLength: Int?, minimumLength: Int?, value: String?) {
                self.defaultValue = defaultValue
                self.maximumLength = maximumLength
                self.minimumLength = minimumLength
                self.value = value
            }

            public enum CodingKeys: String, CodingKey {
                case defaultValue = "default_value",
                     maximumLength = "maximum_length",
                     minimumLength = "minimum_length",
                     value
            }
        }
    }

    // MARK: - Custom Text

    public struct CustomText: Codable {
        /// Custom text for after submit.
        public let afterSubmit: CustomTextMessage?
        /// Custom text for shipping address.
        public let shippingAddress: CustomTextMessage?
        /// Custom text for submit button.
        public let submit: CustomTextMessage?
        /// Custom text for terms of service acceptance.
        public let termsOfServiceAcceptance: CustomTextMessage?

        public init(afterSubmit: CustomTextMessage?, shippingAddress: CustomTextMessage?, submit: CustomTextMessage?, termsOfServiceAcceptance: CustomTextMessage?) {
            self.afterSubmit = afterSubmit
            self.shippingAddress = shippingAddress
            self.submit = submit
            self.termsOfServiceAcceptance = termsOfServiceAcceptance
        }

        public enum CodingKeys: String, CodingKey {
            case afterSubmit = "after_submit",
                 shippingAddress = "shipping_address",
                 submit,
                 termsOfServiceAcceptance = "terms_of_service_acceptance"
        }

        public struct CustomTextMessage: Codable {
            public let message: String

            public init(message: String) {
                self.message = message
            }
        }
    }

    // MARK: - Customer Details

    public struct CustomerDetails: Codable {
        /// The customer's address.
        public let address: Address?
        /// The customer's email.
        public let email: String?
        /// The customer's name.
        public let name: String?
        /// The customer's phone number.
        public let phone: String?
        /// The customer's tax exempt status.
        public let taxExempt: TaxExempt?
        /// The customer's tax IDs.
        public let taxIds: [CustomerTaxId]?

        public init(address: Address?, email: String?, name: String?, phone: String?, taxExempt: TaxExempt?, taxIds: [CustomerTaxId]?) {
            self.address = address
            self.email = email
            self.name = name
            self.phone = phone
            self.taxExempt = taxExempt
            self.taxIds = taxIds
        }

        public enum CodingKeys: String, CodingKey {
            case address,
                 email,
                 name,
                 phone,
                 taxExempt = "tax_exempt",
                 taxIds = "tax_ids"
        }

        public enum TaxExempt: String, Codable {
            case exempt
            case none
            case reverse
        }

        public struct CustomerTaxId: Codable {
            public let type: String
            public let value: String?

            public init(type: String, value: String?) {
                self.type = type
                self.value = value
            }
        }
    }

    // MARK: - Session Discount

    public struct SessionDiscount: Codable {
        /// The ID of the coupon applied.
        public let coupon: String?
        /// The ID of the promotion code applied.
        public let promotionCode: String?

        public init(coupon: String?, promotionCode: String?) {
            self.coupon = coupon
            self.promotionCode = promotionCode
        }

        public enum CodingKeys: String, CodingKey {
            case coupon,
                 promotionCode = "promotion_code"
        }
    }

    // MARK: - Invoice Creation

    public struct InvoiceCreation: Codable {
        /// Whether invoice creation is enabled.
        public let enabled: Bool
        /// Invoice data for the created invoice.
        public let invoiceData: InvoiceData

        public init(enabled: Bool, invoiceData: InvoiceData) {
            self.enabled = enabled
            self.invoiceData = invoiceData
        }

        public enum CodingKeys: String, CodingKey {
            case enabled,
                 invoiceData = "invoice_data"
        }

        public struct InvoiceData: Codable {
            /// Account tax IDs.
            public let accountTaxIds: [String]?
            /// Custom fields.
            public let customFields: [InvoiceCustomField]?
            /// Description.
            public let description: String?
            /// Footer.
            public let footer: String?
            /// Issuer.
            public let issuer: Issuer?
            /// Metadata.
            public let metadata: Metadata?

            public init(accountTaxIds: [String]?, customFields: [InvoiceCustomField]?, description: String?, footer: String?, issuer: Issuer?, metadata: Metadata?) {
                self.accountTaxIds = accountTaxIds
                self.customFields = customFields
                self.description = description
                self.footer = footer
                self.issuer = issuer
                self.metadata = metadata
            }

            public enum CodingKeys: String, CodingKey {
                case accountTaxIds = "account_tax_ids",
                     customFields = "custom_fields",
                     description,
                     footer,
                     issuer,
                     metadata
            }

            public struct InvoiceCustomField: Codable {
                public let name: String
                public let value: String

                public init(name: String, value: String) {
                    self.name = name
                    self.value = value
                }
            }

            public struct Issuer: Codable {
                public let account: String?
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
        }
    }

    // MARK: - Payment Method Configuration Details

    public struct PaymentMethodConfigurationDetails: Codable {
        /// ID of the payment method configuration.
        public let id: String
        /// Parent payment method configuration ID.
        public let parent: String?

        public init(id: String, parent: String?) {
            self.id = id
            self.parent = parent
        }
    }

    // MARK: - Phone Number Collection

    public struct PhoneNumberCollection: Codable {
        /// Whether phone number collection is enabled.
        public let enabled: Bool

        public init(enabled: Bool) {
            self.enabled = enabled
        }
    }

    // MARK: - Shipping Address Collection

    public struct ShippingAddressCollection: Codable {
        /// An array of two-letter ISO country codes representing the allowed shipping countries.
        public let allowedCountries: [String]

        public init(allowedCountries: [String]) {
            self.allowedCountries = allowedCountries
        }

        public enum CodingKeys: String, CodingKey {
            case allowedCountries = "allowed_countries"
        }
    }

    // MARK: - Session Shipping Cost

    public struct SessionShippingCost: Codable {
        /// Total amount before tax.
        public let amountSubtotal: Int
        /// Total tax amount.
        public let amountTax: Int
        /// Total amount after tax.
        public let amountTotal: Int
        /// The ID of the ShippingRate.
        public let shippingRate: String?

        public init(amountSubtotal: Int, amountTax: Int, amountTotal: Int, shippingRate: String?) {
            self.amountSubtotal = amountSubtotal
            self.amountTax = amountTax
            self.amountTotal = amountTotal
            self.shippingRate = shippingRate
        }

        public enum CodingKeys: String, CodingKey {
            case amountSubtotal = "amount_subtotal",
                 amountTax = "amount_tax",
                 amountTotal = "amount_total",
                 shippingRate = "shipping_rate"
        }
    }

    // MARK: - Shipping Option

    public struct ShippingOption: Codable {
        /// The shipping amount.
        public let shippingAmount: Int
        /// The ID of the Shipping Rate.
        public let shippingRate: String

        public init(shippingAmount: Int, shippingRate: String) {
            self.shippingAmount = shippingAmount
            self.shippingRate = shippingRate
        }

        public enum CodingKeys: String, CodingKey {
            case shippingAmount = "shipping_amount",
                 shippingRate = "shipping_rate"
        }
    }

    // MARK: - Tax ID Collection

    public struct TaxIdCollection: Codable {
        /// Whether tax ID collection is enabled.
        public let enabled: Bool
        /// Whether the tax ID is required.
        public let required: TaxIdRequired

        public init(enabled: Bool, required: TaxIdRequired) {
            self.enabled = enabled
            self.required = required
        }

        public enum TaxIdRequired: String, Codable {
            case ifSupported = "if_supported"
            case never
        }
    }

    // MARK: - Total Details

    public struct TotalDetails: Codable {
        /// Amount discounted.
        public let amountDiscount: Int
        /// Amount for shipping.
        public let amountShipping: Int?
        /// Amount of tax.
        public let amountTax: Int
        /// Breakdown of totals.
        public let breakdown: Breakdown?

        public init(amountDiscount: Int, amountShipping: Int?, amountTax: Int, breakdown: Breakdown?) {
            self.amountDiscount = amountDiscount
            self.amountShipping = amountShipping
            self.amountTax = amountTax
            self.breakdown = breakdown
        }

        public enum CodingKeys: String, CodingKey {
            case amountDiscount = "amount_discount",
                 amountShipping = "amount_shipping",
                 amountTax = "amount_tax",
                 breakdown
        }

        public struct Breakdown: Codable {
            /// Discount breakdown.
            public let discounts: [DiscountBreakdown]
            /// Tax breakdown.
            public let taxes: [TaxBreakdown]

            public init(discounts: [DiscountBreakdown], taxes: [TaxBreakdown]) {
                self.discounts = discounts
                self.taxes = taxes
            }

            public struct DiscountBreakdown: Codable {
                /// Amount discounted.
                public let amount: Int
                /// The discount applied.
                public let discount: DiscountInfo

                public init(amount: Int, discount: DiscountInfo) {
                    self.amount = amount
                    self.discount = discount
                }

                public struct DiscountInfo: Codable {
                    public let id: String
                    public let object: String

                    public init(id: String, object: String) {
                        self.id = id
                        self.object = object
                    }
                }
            }

            public struct TaxBreakdown: Codable {
                /// Amount of tax.
                public let amount: Int
                /// The tax rate applied.
                public let rate: TaxRate

                public init(amount: Int, rate: TaxRate) {
                    self.amount = amount
                    self.rate = rate
                }
            }
        }
    }
}

// MARK: - Session Line Item

public struct SessionLineItem: Codable {
    /// Unique identifier for the object.
    public let id: String
    /// String representing the object's type.
    public let object: String
    /// Total discount amount applied.
    public let amountDiscount: Int
    /// Total before discounts and taxes.
    public let amountSubtotal: Int
    /// Total tax amount.
    public let amountTax: Int
    /// Total after discounts and taxes.
    public let amountTotal: Int
    /// Three-letter ISO currency code.
    public let currency: String
    /// Description of the line item.
    public let lineItemDescription: String?
    /// The price of the product.
    public let price: Price?
    /// The quantity of the product.
    public let quantity: Int?

    public init(id: String, object: String, amountDiscount: Int, amountSubtotal: Int, amountTax: Int, amountTotal: Int, currency: String, lineItemDescription: String?, price: Price?, quantity: Int?) {
        self.id = id
        self.object = object
        self.amountDiscount = amountDiscount
        self.amountSubtotal = amountSubtotal
        self.amountTax = amountTax
        self.amountTotal = amountTotal
        self.currency = currency
        self.lineItemDescription = lineItemDescription
        self.price = price
        self.quantity = quantity
    }

    public enum CodingKeys: String, CodingKey {
        case id,
             object,
             amountDiscount = "amount_discount",
             amountSubtotal = "amount_subtotal",
             amountTax = "amount_tax",
             amountTotal = "amount_total",
             currency,
             lineItemDescription = "description",
             price,
             quantity
    }
}
