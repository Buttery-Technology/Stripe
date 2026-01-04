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
    /// This field indicates whether this payment method can be shown again to its customer in a checkout flow.
    public let allowRedisplay: AllowRedisplay?
    /// Options to configure Radar.
    public let radarOptions: RadarOptions?

    // MARK: - Payment Type Specific Fields

    /// If this is a card PaymentMethod, this contains card details.
    public let card: CardDetails?
    /// If this is a us_bank_account PaymentMethod, this contains US bank account details.
    public let usBankAccount: USBankAccountDetails?
    /// If this is a sepa_debit PaymentMethod, this contains SEPA debit details.
    public let sepaDebit: SepaDebitDetails?
    /// If this is a link PaymentMethod, this contains Link details.
    public let link: LinkDetails?
    /// If this is an acss_debit PaymentMethod, this contains ACSS debit details.
    public let acssDebit: AcssDebitDetails?

    /// Designated initializer
    public init(id: String, object: String = "payment_method", billingDetails: Billing?, created: TimeInterval, customer: String?, livemode: Bool, metadata: Metadata?, type: PaymentType, allowRedisplay: AllowRedisplay? = nil, radarOptions: RadarOptions? = nil, card: CardDetails? = nil, usBankAccount: USBankAccountDetails? = nil, sepaDebit: SepaDebitDetails? = nil, link: LinkDetails? = nil, acssDebit: AcssDebitDetails? = nil) {
        self.id = id
        self.object = object
        self.billingDetails = billingDetails
        self.created = created
        self.customer = customer
        self.livemode = livemode
        self.metadata = metadata
        self.type = type
        self.allowRedisplay = allowRedisplay
        self.radarOptions = radarOptions
        self.card = card
        self.usBankAccount = usBankAccount
        self.sepaDebit = sepaDebit
        self.link = link
        self.acssDebit = acssDebit
    }

    public enum CodingKeys: String, CodingKey {
        case id, object
        case billingDetails = "billing_details"
        case created, customer, livemode, metadata, type
        case allowRedisplay = "allow_redisplay"
        case radarOptions = "radar_options"
        case card
        case usBankAccount = "us_bank_account"
        case sepaDebit = "sepa_debit"
        case link
        case acssDebit = "acss_debit"
    }

    // MARK: - Allow Redisplay

    /// Indicates whether this payment method can be shown again to its customer in a checkout flow.
    public enum AllowRedisplay: String, Codable {
        /// Use `always` to indicate that this payment method can always be shown to a customer in checkout.
        case always
        /// Use `limited` to indicate that this payment method can only be shown to a customer in checkout under limited circumstances.
        case limited
        /// Use `unspecified` to indicate that the payment method's allow_redisplay value was not set.
        case unspecified
    }

    // MARK: - Radar Options

    /// Options to configure Radar.
    public struct RadarOptions: Codable {
        /// A Radar Session is a snapshot of the browser metadata and device details that help Radar make more accurate predictions on your payments.
        public let session: String?

        public init(session: String?) {
            self.session = session
        }
    }
    
    public enum PaymentType: String, Codable {
        case acssDebit = "acss_debit"
        case affirm
        case afterpayClearpay = "afterpay_clearpay"
        case alipay
        case alma
        case amazonPay = "amazon_pay"
        case applePay = "apple_pay"
        case auBecsDebit = "au_becs_debit"
        case bacsDebit = "bacs_debit"
        case bancontact
        case billie
        case blik
        case boleto
        case card
        case cardPresent = "card_present"
        case cashapp
        case crypto
        case custom
        case customerBalance = "customer_balance"
        case eps
        case fpx
        case giropay
        case googlePay = "google_pay"
        case grabpay
        case ideal
        case interacPresent = "interac_present"
        case kakaoPay = "kakao_pay"
        case klarna
        case konbini
        case krCard = "kr_card"
        case link
        case mbWay = "mb_way"
        case mobilepay
        case multibanco
        case naverPay = "naver_pay"
        case nzBankAccount = "nz_bank_account"
        case oxxo
        case p24
        case payByBank = "pay_by_bank"
        case payco
        case paynow
        case paypal
        case paypay
        case payto
        case pix
        case promptpay
        case revolutPay = "revolut_pay"
        case samsungPay = "samsung_pay"
        case satispay
        case sepaDebit = "sepa_debit"
        case sofort
        case swish
        case twint
        case usBankAccount = "us_bank_account"
        case wechatPay = "wechat_pay"
        case zip
    }

    // MARK: - Card Details

    /// Card payment method details.
    public struct CardDetails: Codable {
        /// Card brand. Can be `amex`, `diners`, `discover`, `eftpos_au`, `jcb`, `mastercard`, `unionpay`, `visa`, or `unknown`.
        public let brand: String?
        /// Two-letter ISO code representing the country of the card.
        public let country: String?
        /// A high-level description of the type of cards issued in this range.
        public let displayBrand: String?
        /// Two-digit number representing the card's expiration month.
        public let expMonth: Int
        /// Four-digit number representing the card's expiration year.
        public let expYear: Int
        /// Uniquely identifies this particular card number.
        public let fingerprint: String?
        /// Card funding type. Can be `credit`, `debit`, `prepaid`, or `unknown`.
        public let funding: String?
        /// Details of the original PaymentMethod that created this object.
        public let generatedFrom: GeneratedFrom?
        /// The last four digits of the card.
        public let last4: String
        /// Contains information about card networks that can be used to process the payment.
        public let networks: Networks?
        /// Contains details on how this Card may be used for 3D Secure authentication.
        public let threeDSecureUsage: ThreeDSecureUsage?
        /// If this Card is part of a card wallet, this contains the details of the card wallet.
        public let wallet: Wallet?

        public init(brand: String?, country: String?, displayBrand: String?, expMonth: Int, expYear: Int, fingerprint: String?, funding: String?, generatedFrom: GeneratedFrom?, last4: String, networks: Networks?, threeDSecureUsage: ThreeDSecureUsage?, wallet: Wallet?) {
            self.brand = brand
            self.country = country
            self.displayBrand = displayBrand
            self.expMonth = expMonth
            self.expYear = expYear
            self.fingerprint = fingerprint
            self.funding = funding
            self.generatedFrom = generatedFrom
            self.last4 = last4
            self.networks = networks
            self.threeDSecureUsage = threeDSecureUsage
            self.wallet = wallet
        }

        public enum CodingKeys: String, CodingKey {
            case brand, country
            case displayBrand = "display_brand"
            case expMonth = "exp_month"
            case expYear = "exp_year"
            case fingerprint, funding
            case generatedFrom = "generated_from"
            case last4, networks
            case threeDSecureUsage = "three_d_secure_usage"
            case wallet
        }

        /// Details of the original PaymentMethod that created this object.
        public struct GeneratedFrom: Codable {
            /// The charge that created this object.
            public let charge: String?
            /// Transaction-specific details of the payment method used in the payment.
            public let paymentMethodDetails: PaymentMethodDetailsRef?
            /// The ID of the SetupAttempt that generated this PaymentMethod.
            public let setupAttempt: String?

            public init(charge: String?, paymentMethodDetails: PaymentMethodDetailsRef?, setupAttempt: String?) {
                self.charge = charge
                self.paymentMethodDetails = paymentMethodDetails
                self.setupAttempt = setupAttempt
            }

            public enum CodingKeys: String, CodingKey {
                case charge
                case paymentMethodDetails = "payment_method_details"
                case setupAttempt = "setup_attempt"
            }

            public struct PaymentMethodDetailsRef: Codable {
                public let type: String?

                public init(type: String?) {
                    self.type = type
                }
            }
        }

        /// Contains information about card networks.
        public struct Networks: Codable {
            /// All available networks for the card.
            public let available: [String]
            /// The preferred network for co-branded cards.
            public let preferred: String?

            public init(available: [String], preferred: String?) {
                self.available = available
                self.preferred = preferred
            }
        }

        /// Contains details on how this Card may be used for 3D Secure authentication.
        public struct ThreeDSecureUsage: Codable {
            /// Whether 3D Secure is supported on this card.
            public let supported: Bool

            public init(supported: Bool) {
                self.supported = supported
            }
        }

        /// If this Card is part of a card wallet, this contains the details.
        public struct Wallet: Codable {
            /// The type of the card wallet.
            public let type: String
            /// If this is an Apple Pay card wallet, additional details.
            public let applePay: [String: AnyCodable]?
            /// If this is a Google Pay card wallet, additional details.
            public let googlePay: [String: AnyCodable]?
            /// If this is a Link card wallet, additional details.
            public let link: [String: AnyCodable]?

            public init(type: String, applePay: [String: AnyCodable]?, googlePay: [String: AnyCodable]?, link: [String: AnyCodable]?) {
                self.type = type
                self.applePay = applePay
                self.googlePay = googlePay
                self.link = link
            }

            public enum CodingKeys: String, CodingKey {
                case type
                case applePay = "apple_pay"
                case googlePay = "google_pay"
                case link
            }
        }
    }

    // MARK: - US Bank Account Details

    /// US bank account payment method details.
    public struct USBankAccountDetails: Codable {
        /// Account holder type: `individual` or `company`.
        public let accountHolderType: String?
        /// Account type: `checking` or `savings`.
        public let accountType: String?
        /// The name of the bank.
        public let bankName: String?
        /// The ID of the Financial Connections Account.
        public let financialConnectionsAccount: String?
        /// Uniquely identifies this particular bank account.
        public let fingerprint: String?
        /// Last four digits of the bank account number.
        public let last4: String?
        /// Contains information about US bank account networks.
        public let networks: USBankNetworks?
        /// Routing number of the bank account.
        public let routingNumber: String?
        /// Contains information about the future reusability of this PaymentMethod.
        public let statusDetails: StatusDetails?

        public init(accountHolderType: String?, accountType: String?, bankName: String?, financialConnectionsAccount: String?, fingerprint: String?, last4: String?, networks: USBankNetworks?, routingNumber: String?, statusDetails: StatusDetails?) {
            self.accountHolderType = accountHolderType
            self.accountType = accountType
            self.bankName = bankName
            self.financialConnectionsAccount = financialConnectionsAccount
            self.fingerprint = fingerprint
            self.last4 = last4
            self.networks = networks
            self.routingNumber = routingNumber
            self.statusDetails = statusDetails
        }

        public enum CodingKeys: String, CodingKey {
            case accountHolderType = "account_holder_type"
            case accountType = "account_type"
            case bankName = "bank_name"
            case financialConnectionsAccount = "financial_connections_account"
            case fingerprint, last4, networks
            case routingNumber = "routing_number"
            case statusDetails = "status_details"
        }

        public struct USBankNetworks: Codable {
            /// The preferred network.
            public let preferred: String?
            /// All supported networks.
            public let supported: [String]?

            public init(preferred: String?, supported: [String]?) {
                self.preferred = preferred
                self.supported = supported
            }
        }

        public struct StatusDetails: Codable {
            /// If blocked, contains details about the blocked status.
            public let blocked: BlockedDetails?

            public init(blocked: BlockedDetails?) {
                self.blocked = blocked
            }

            public struct BlockedDetails: Codable {
                /// The ACH network code for why this account is blocked.
                public let networkCode: String?
                /// The reason why this PaymentMethod's fingerprint has been blocked.
                public let reason: String?

                public init(networkCode: String?, reason: String?) {
                    self.networkCode = networkCode
                    self.reason = reason
                }

                public enum CodingKeys: String, CodingKey {
                    case networkCode = "network_code"
                    case reason
                }
            }
        }
    }

    // MARK: - SEPA Debit Details

    /// SEPA debit payment method details.
    public struct SepaDebitDetails: Codable {
        /// Bank code of bank associated with the bank account.
        public let bankCode: String?
        /// Branch code of bank associated with the bank account.
        public let branchCode: String?
        /// Two-letter ISO code representing the country the bank account is located in.
        public let country: String?
        /// Uniquely identifies this particular bank account.
        public let fingerprint: String?
        /// Information about the object that generated this PaymentMethod.
        public let generatedFrom: SepaGeneratedFrom?
        /// Last four characters of the IBAN.
        public let last4: String?

        public init(bankCode: String?, branchCode: String?, country: String?, fingerprint: String?, generatedFrom: SepaGeneratedFrom?, last4: String?) {
            self.bankCode = bankCode
            self.branchCode = branchCode
            self.country = country
            self.fingerprint = fingerprint
            self.generatedFrom = generatedFrom
            self.last4 = last4
        }

        public enum CodingKeys: String, CodingKey {
            case bankCode = "bank_code"
            case branchCode = "branch_code"
            case country, fingerprint
            case generatedFrom = "generated_from"
            case last4
        }

        public struct SepaGeneratedFrom: Codable {
            /// The ID of the Charge that generated this PaymentMethod.
            public let charge: String?
            /// The ID of the SetupAttempt that generated this PaymentMethod.
            public let setupAttempt: String?

            public init(charge: String?, setupAttempt: String?) {
                self.charge = charge
                self.setupAttempt = setupAttempt
            }

            public enum CodingKeys: String, CodingKey {
                case charge
                case setupAttempt = "setup_attempt"
            }
        }
    }

    // MARK: - Link Details

    /// Link payment method details.
    public struct LinkDetails: Codable {
        /// Account owner's email address.
        public let email: String?
        /// Deprecated: Use the `payment_method_options.link.persistent_token` field instead.
        public let persistentToken: String?

        public init(email: String?, persistentToken: String?) {
            self.email = email
            self.persistentToken = persistentToken
        }

        public enum CodingKeys: String, CodingKey {
            case email
            case persistentToken = "persistent_token"
        }
    }

    // MARK: - ACSS Debit Details

    /// ACSS debit payment method details (Canadian pre-authorized debit).
    public struct AcssDebitDetails: Codable {
        /// Name of the bank associated with the bank account.
        public let bankName: String?
        /// Uniquely identifies this particular bank account.
        public let fingerprint: String?
        /// Institution number of the bank account.
        public let institutionNumber: String?
        /// Last four digits of the bank account number.
        public let last4: String?
        /// Transit number of the bank account.
        public let transitNumber: String?

        public init(bankName: String?, fingerprint: String?, institutionNumber: String?, last4: String?, transitNumber: String?) {
            self.bankName = bankName
            self.fingerprint = fingerprint
            self.institutionNumber = institutionNumber
            self.last4 = last4
            self.transitNumber = transitNumber
        }

        public enum CodingKeys: String, CodingKey {
            case bankName = "bank_name"
            case fingerprint
            case institutionNumber = "institution_number"
            case last4
            case transitNumber = "transit_number"
        }
    }
}
