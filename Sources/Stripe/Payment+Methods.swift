//
//  Payment+Methods.swift
//  Stripe
//
//  Created by Jonathan Holland on 6/5/22.
//

import Foundation

extension Payment {
    public struct Details: Codable {
        /// The type of transaction-specific details of the payment method used in the payment, one of `ach_credit_transfer`, `ach_debit`, `acss_debit`, `alipay`, `au_becs_debit`,` bancontact`, `card`, `card_present`, `eps`, `giropay`, `ideal`, `klarna`, `multibanco`, `p24`, `sepa_debit`, `sofort`, `stripe_account`, or `wechat`. An additional hash is included on `payment_method_details` with a name matching this value. It contains information specific to the payment method.
        public let type: String
        /// Details about the payment method at the time of the transaction.
        public let object: MethodOption
        
        /// Designated initializer
        public init(type: String, object: MethodOption) {
            self.type = type
            self.object = object
        }
    }
    
    public enum MethodOption: Codable {
        /// f paying by `afterpay_clearpay`, this sub-hash contains details about the AfterpayClearpay payment method options to pass to the order’s PaymentIntent.
        case afterpay_clearpay(AfterpayClearpay)
        /// If paying by `card`, this sub-hash contains details about the Card payment method options to pass to the order’s PaymentIntent.
        case card(PaymentCard)
        /// If paying by `customer_balance`, this sub-hash contains details about the Customer Balance payment method options to pass to the order’s PaymentIntent.
        case customer_balance(CustomerBalance)
        case klarna(Klarna)
        case paypal(PayPal)
        case usBankAccount(USBankAccount)
        
        public init(from decoder: Decoder) throws {
            var returnableError: Error?
            do {
                let singleValueContainer = try decoder.singleValueContainer()
                let afterpay_clearpay = try singleValueContainer.decode(AfterpayClearpay.self)
                self = .afterpay_clearpay(afterpay_clearpay)
                return
            } catch {
                returnableError = error
            }
            do {
                let singleValueContainer = try decoder.singleValueContainer()
                let card = try singleValueContainer.decode(PaymentCard.self)
                self = .card(card)
                return
            } catch {
                returnableError = error
            }
            do {
                let singleValueContainer = try decoder.singleValueContainer()
                let customer_balance = try singleValueContainer.decode(CustomerBalance.self)
                self = .customer_balance(customer_balance)
                return
            } catch {
                returnableError = error
            }
            do {
                let singleValueContainer = try decoder.singleValueContainer()
                let klarna = try singleValueContainer.decode(Klarna.self)
                self = .klarna(klarna)
                return
            } catch {
                returnableError = error
            }
            do {
                let singleValueContainer = try decoder.singleValueContainer()
                let paypal = try singleValueContainer.decode(PayPal.self)
                self = .paypal(paypal)
                return
            } catch {
                returnableError = error
            }
            do {
                let singleValueContainer = try decoder.singleValueContainer()
                let usBankAccount = try singleValueContainer.decode(USBankAccount.self)
                self = .usBankAccount(usBankAccount)
                return
            } catch {
                returnableError = error
            }
            throw DecodingError.unknownType(returnableError)
        }
    }
    
    public enum MethodType: String, Codable {
        case card, customer_balance, ideal, link, sepa_debit, eps, wechat_pay, oxxo, bancontact, alipay, p24, bacs_debit, giropay, sofort, au_becs_debit, fpx, klarna, paypal, acss_debit, grabpay, afterpay_clearpay
    }
    
    // MARK: Payment Method Objects
    public struct AfterpayClearpay: Codable {
        /// Controls when the funds will be captured from the customer’s account.
        public let captureMethod: CaptureMethod
        /// Order identifier shown to the user in Afterpay's online portal. We recommend using a value that helps you answer any questions a customer might have about the payment. The identifier is limited to 128 characters and may contain only letters, digits, underscores, backslashes and dashes.
        public let reference: String
        /// Indicates that you intend to make future payments with the payment method.
        ///
        /// Providing this parameter will [attach the payment method](https://stripe.com/docs/payments/save-during-payment) to the order’s Customer, if present, after the order’s PaymentIntent is confirmed and any required actions from the user are complete. If no Customer was provided, the payment method can still be [attached](https://stripe.com/docs/api/payment_methods/attach) to a Customer after the transaction completes.
        ///
        /// When processing card payments, Stripe also uses `setup_future_usage` to dynamically optimize your payment flow and comply with regional legislation and network rules, such as [SCA](https://stripe.com/docs/strong-customer-authentication).
        ///
        /// If `setup_future_usage` is already set and you are performing a request using a publishable key, you may only update the value from `on_session` to `off_session`.
        public let setupFutureUsage: SetupFutureUsage
        
        /// Designated initializer
        public init(captureMethod: CaptureMethod, reference: String, setupFutureUsage: SetupFutureUsage) {
            self.captureMethod = captureMethod
            self.reference = reference
            self.setupFutureUsage = setupFutureUsage
        }
        
        public enum CodingKeys: String, CodingKey {
            case captureMethod = "capture_method", reference, setupFutureUsage = "setup_future_usage"
        }
    }
    
    public struct CustomerBalance: Codable {
        /// Configuration for the bank transfer funding type, if the `funding_type` is set to `bank_transfer`.
        public let bankTransfer: BankTransfer
        /// The funding method type to be used when there are not enough funds in the customer balance. Permitted values include: `bank_transfer`.
        public let fundingType: String
        /// Indicates that you intend to make future payments with this PaymentIntent’s payment method.
        ///
        /// Providing this parameter [will attach the payment method](https://stripe.com/docs/payments/save-during-payment) to the PaymentIntent’s Customer, if present, after the PaymentIntent is confirmed and any required actions from the user are complete. If no Customer was provided, the payment method can still be [attached](https://stripe.com/docs/api/payment_methods/attach) to a Customer after the transaction completes.
        ///
        /// When processing card payments, Stripe also uses `setup_future_usage` to dynamically optimize your payment flow and comply with regional legislation and network rules, such as [SCA](https://stripe.com/docs/strong-customer-authentication).
        public let setupFutureUsage: SetupFutureUsage
        
        /// Designated initializer
        public init(bankTransfer: BankTransfer, fundingType: String, setupFutureUsage: SetupFutureUsage) {
            self.bankTransfer = bankTransfer
            self.fundingType = fundingType
            self.setupFutureUsage = setupFutureUsage
        }
        
        public enum CodingKeys: String, CodingKey {
            case bankTransfer = "bank_transfer", fundingType = "funding_type", setupFutureUsage = "setup_future_usage"
        }
        
        public struct BankTransfer: Codable {
            /// List of address types that should be returned in the financial_addresses response. If not specified, all valid types will be returned.
            ///
            /// Permitted values include: `sort_code`, `zengin`, `iban`, or `spei`.
            public let requestedAddressTypes: [RequestedAddressType]
            /// The bank transfer type that this PaymentIntent is allowed to use for funding Permitted values include: `eu_bank_transfer`, `gb_bank_transfer`, `jp_bank_transfer`, or `mx_bank_transfer`.
            public let type: TransferType
            /// The funding method type to be used when there are not enough funds in the customer balance.
            ///
            /// Permitted values include: `bank_transfer`.
            public let fundingType: String
            /// Indicates that you intend to make future payments with this PaymentIntent’s payment method.
            ///
            /// Providing this parameter will [attach the payment method](https://stripe.com/docs/payments/save-during-payment) to the PaymentIntent’s Customer, if present, after the PaymentIntent is confirmed and any required actions from the user are complete. If no Customer was provided, the payment method can still be [attached](https://stripe.com/docs/api/payment_methods/attach) to a Customer after the transaction completes.
            ///
            /// When processing card payments, Stripe also uses `setup_future_usage` to dynamically optimize your payment flow and comply with regional legislation and network rules, such as [SCA](https://stripe.com/docs/strong-customer-authentication).
            public let setupFutureUsage: SetupFutureUsage
            
            /// Designated initializer
            public init(requestedAddressTypes: [RequestedAddressType], type: TransferType, fundingType: String, setupFutureUsage: SetupFutureUsage) {
                self.requestedAddressTypes = requestedAddressTypes
                self.type = type
                self.fundingType = fundingType
                self.setupFutureUsage = setupFutureUsage
            }
            
            public enum CodingKeys: String, CodingKey {
                case fundingType = "funding_type", requestedAddressTypes = "requested_address_types", setupFutureUsage = "setup_future_usage", type
            }
            
            public enum RequestedAddressType: String, Codable {
                case zengin, sort_code, iban, spei
            }
            
            public enum TransferType: String, Codable {
                case eu_bank_transfer, gb_bank_transfer, jp_bank_transfer, mx_bank_transfer
            }
        }
    }
    
    public struct Klarna: Codable {
        /// Controls when the funds will be captured from the customer’s account.
        public let captureMethod: CaptureMethod
        /// Preferred locale of the Klarna checkout page that the customer is redirected to.
        public let preferredLocale: String
        /// Indicates that you intend to make future payments with this PaymentIntent’s payment method.
        ///
        /// Providing this parameter [will attach the payment method](https://stripe.com/docs/payments/save-during-payment) to the PaymentIntent’s Customer, if present, after the PaymentIntent is confirmed and any required actions from the user are complete. If no Customer was provided, the payment method can still be [attached](https://stripe.com/docs/api/payment_methods/attach) to a Customer after the transaction completes.
        ///
        /// When processing card payments, Stripe also uses `setup_future_usage` to dynamically optimize your payment flow and comply with regional legislation and network rules, such as [SCA](https://stripe.com/docs/strong-customer-authentication).
        public let setupFutureUsage: SetupFutureUsage
        
        /// Designated initializer
        public init(captureMethod: CaptureMethod, preferredLocale: String, setupFutureUsage: SetupFutureUsage) {
            self.captureMethod = captureMethod
            self.preferredLocale = preferredLocale
            self.setupFutureUsage = setupFutureUsage
        }
        
        public enum CodingKeys: String, CodingKey {
            case captureMethod = "capture_method", preferredLocale = "preferred_locale", setupFutureUsage = "setup_future_usage"
        }
    }
    
    public struct PaymentCard: Codable {
        /// Controls when the funds will be captured from the customer’s account.
        public let captureMethod: CaptureMethod
        /// Indicates that you intend to make future payments with the payment method.
        ///
        /// Providing this parameter will [attach the payment method](https://stripe.com/docs/payments/save-during-payment) to the order’s Customer, if present, after the order’s PaymentIntent is confirmed and any required actions from the user are complete. If no Customer was provided, the payment method can still be [attached](https://stripe.com/docs/api/payment_methods/attach) to a Customer after the transaction completes.
        ///
        /// When processing card payments, Stripe also uses `setup_future_usage` to dynamically optimize your payment flow and comply with regional legislation and network rules, such as [SCA](https://stripe.com/docs/strong-customer-authentication).
        ///
        /// If `setup_future_usage` is already set and you are performing a request using a publishable key, you may only update the value from `on_session` to `off_session`.
        public let setupFutureUsage: SetupFutureUsage
        
        /// Designated initializer
        public init(captureMethod: CaptureMethod, setupFutureUsage: SetupFutureUsage) {
            self.captureMethod = captureMethod
            self.setupFutureUsage = setupFutureUsage
        }
        
        public enum CodingKeys: String, CodingKey {
            case captureMethod = "capture_method", setupFutureUsage = "setup_future_usage"
        }
    }
    
    public struct PayPal: Codable {
        /// Controls when the funds will be captured from the customer’s account.
        public let captureMethod: CaptureMethod
        /// Preferred locale of the Klarna checkout page that the customer is redirected to.
        public let preferredLocale: String
        
        /// Designated initializer
        public init(captureMethod: CaptureMethod, preferredLocale: String) {
            self.captureMethod = captureMethod
            self.preferredLocale = preferredLocale
        }
        
        public enum CodingKeys: String, CodingKey {
            case captureMethod = "capture_method", preferredLocale = "preferred_locale"
        }
    }
    
    public struct USBankAccount: Codable {
        /// Account holder type: individual or company.
        public let accountHolderType: AccountHolderType
        /// Account type: checkings or savings. Defaults to checking if omitted.
        public let accountType: AccountType
        /// Name of the bank associated with the bank account.
        public let bankName: String
        /// Uniquely identifies this particular bank account. You can use this attribute to check whether two bank accounts are the same.
        public let fingerprint: String
        /// Last four digits of the bank account number.
        public let last4: String
        /// Routing number of the bank account.
        public let routingNumber: String
        
        /// Designated initializer
        public init(accountHolderType: AccountHolderType, accountType: AccountType, bankName: String, fingerprint: String, last4: String, routingNumber: String) {
            self.accountHolderType = accountHolderType
            self.accountType = accountType
            self.bankName = bankName
            self.fingerprint = fingerprint
            self.last4 = last4
            self.routingNumber = routingNumber
        }
        
        public enum CodingKeys: String, CodingKey {
            case accountHolderType = "account_holder_type", accountType = "account_type", bankName = "bank_name", fingerprint, last4, routingNumber = "routing_number"
        }
        
        public enum AccountHolderType: String, Codable {
            /// Account belongs to an individual
            case company
            /// Account belongs to a company
            case individual
        }
        
        public enum AccountType: String, Codable {
            /// Bank account type is checking
            case checking
            /// Bank account type is savings
            case savings
        }
    }
}
