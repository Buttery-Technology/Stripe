import Testing
import Foundation
@testable import Stripe

@Suite("Customer Tests")
struct CustomerTests {

    // MARK: - JSON Decoding Tests

    @Test("Decodes minimal customer JSON")
    func decodesMinimalCustomer() throws {
        let json = """
        {
            "id": "cus_123",
            "object": "customer",
            "balance": 0,
            "created": 1234567890,
            "livemode": false
        }
        """.data(using: .utf8)!

        let decoder = JSONDecoder()
        let customer = try decoder.decode(Customer.self, from: json)

        #expect(customer.id == "cus_123")
        #expect(customer.object == "customer")
        #expect(customer.balance == 0)
        #expect(customer.livemode == false)
    }

    @Test("Decodes customer with full details")
    func decodesFullCustomer() throws {
        let json = """
        {
            "id": "cus_456",
            "object": "customer",
            "address": {
                "city": "San Francisco",
                "country": "US",
                "line1": "123 Main St",
                "line2": "Apt 4",
                "postal_code": "94102",
                "state": "CA"
            },
            "balance": 1000,
            "created": 1234567890,
            "currency": "usd",
            "default_source": "card_123",
            "delinquent": false,
            "description": "Test customer",
            "email": "test@example.com",
            "invoice_prefix": "ABC123",
            "invoice_settings": {
                "custom_fields": null,
                "default_payment_method": "pm_123",
                "footer": "Thank you!"
            },
            "livemode": true,
            "name": "John Doe",
            "next_invoice_sequence": 5,
            "phone": "+1234567890",
            "preferred_locales": ["en", "es"],
            "tax_exempt": "none"
        }
        """.data(using: .utf8)!

        let decoder = JSONDecoder()
        let customer = try decoder.decode(Customer.self, from: json)

        #expect(customer.id == "cus_456")
        #expect(customer.address?.city == "San Francisco")
        #expect(customer.address?.country == "US")
        #expect(customer.balance == 1000)
        #expect(customer.currency == "usd")
        #expect(customer.defaultSource == "card_123")
        #expect(customer.delinquent == false)
        #expect(customer.customerDescription == "Test customer")
        #expect(customer.email == "test@example.com")
        #expect(customer.invoicePrefix == "ABC123")
        #expect(customer.invoiceSettings?.defaultPaymentMethod == "pm_123")
        #expect(customer.invoiceSettings?.footer == "Thank you!")
        #expect(customer.livemode == true)
        #expect(customer.name == "John Doe")
        #expect(customer.nextInvoiceSequence == 5)
        #expect(customer.phone == "+1234567890")
        #expect(customer.preferredLocales == ["en", "es"])
        #expect(customer.taxExempt == "none")
    }

    @Test("Decodes customer with cash balance")
    func decodesCustomerWithCashBalance() throws {
        let json = """
        {
            "id": "cus_789",
            "object": "customer",
            "balance": 0,
            "cash_balance": {
                "object": "cash_balance",
                "available": {"usd": 5000, "eur": 2000},
                "customer": "cus_789",
                "livemode": true,
                "settings": {
                    "reconciliation_mode": "automatic",
                    "using_merchant_default": true
                }
            },
            "created": 1234567890,
            "livemode": true
        }
        """.data(using: .utf8)!

        let decoder = JSONDecoder()
        let customer = try decoder.decode(Customer.self, from: json)

        #expect(customer.cashBalance != nil)
        #expect(customer.cashBalance?.available?["usd"] == 5000)
        #expect(customer.cashBalance?.available?["eur"] == 2000)
        #expect(customer.cashBalance?.settings.reconciliationMode == "automatic")
        #expect(customer.cashBalance?.settings.usingMerchantDefault == true)
    }

    @Test("Handles optional fields correctly")
    func handlesOptionalFields() throws {
        let json = """
        {
            "id": "cus_optional",
            "object": "customer",
            "balance": 0,
            "created": 1234567890,
            "livemode": false,
            "address": null,
            "email": null,
            "name": null,
            "phone": null,
            "currency": null,
            "default_source": null,
            "description": null,
            "discount": null,
            "shipping": null
        }
        """.data(using: .utf8)!

        let customer = try JSONDecoder().decode(Customer.self, from: json)

        #expect(customer.address == nil)
        #expect(customer.email == nil)
        #expect(customer.name == nil)
        #expect(customer.phone == nil)
        #expect(customer.currency == nil)
        #expect(customer.defaultSource == nil)
        #expect(customer.customerDescription == nil)
        #expect(customer.discount == nil)
        #expect(customer.shipping == nil)
    }

    // MARK: - Schema Tests

    @Test("Has correct schema")
    func hasCorrectSchema() {
        #expect(Customer.schema == "customers")
    }
}
