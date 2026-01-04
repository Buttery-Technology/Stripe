import Testing
import Foundation
@testable import Stripe

@Suite("Price Tests")
struct PriceTests {

    // MARK: - JSON Decoding Tests

    @Test("Decodes one-time price")
    func decodesOneTimePrice() throws {
        let json = """
        {
            "id": "price_123",
            "object": "price",
            "active": true,
            "billing_scheme": "per_unit",
            "created": 1234567890,
            "currency": "usd",
            "livemode": false,
            "product": "prod_123",
            "type": "one_time",
            "unit_amount": 2000,
            "unit_amount_decimal": "2000"
        }
        """.data(using: .utf8)!

        let price = try JSONDecoder().decode(Price.self, from: json)

        #expect(price.id == "price_123")
        #expect(price.object == "price")
        #expect(price.active == true)
        #expect(price.billingScheme == "per_unit")
        #expect(price.currency == "usd")
        #expect(price.livemode == false)
        #expect(price.product == "prod_123")
        #expect(price.type == "one_time")
        #expect(price.unitAmount == 2000)
        #expect(price.recurring == nil)
    }

    @Test("Decodes recurring price")
    func decodesRecurringPrice() throws {
        let json = """
        {
            "id": "price_recurring",
            "object": "price",
            "active": true,
            "billing_scheme": "per_unit",
            "created": 1234567890,
            "currency": "usd",
            "livemode": true,
            "product": "prod_456",
            "recurring": {
                "aggregate_usage": null,
                "interval": "month",
                "interval_count": 1,
                "meter": null,
                "usage_type": "licensed"
            },
            "type": "recurring",
            "unit_amount": 999
        }
        """.data(using: .utf8)!

        let price = try JSONDecoder().decode(Price.self, from: json)

        #expect(price.id == "price_recurring")
        #expect(price.type == "recurring")
        #expect(price.recurring != nil)
        #expect(price.recurring?.interval == .month)
        #expect(price.recurring?.intervalCount == 1)
        #expect(price.recurring?.usageType == .licensed)
        #expect(price.recurring?.aggregateUsage == nil)
    }

    @Test("Decodes metered price")
    func decodesMeteredPrice() throws {
        let json = """
        {
            "id": "price_metered",
            "object": "price",
            "active": true,
            "billing_scheme": "per_unit",
            "created": 1234567890,
            "currency": "usd",
            "livemode": false,
            "product": "prod_789",
            "recurring": {
                "aggregate_usage": "sum",
                "interval": "month",
                "interval_count": 1,
                "meter": "mtr_123",
                "usage_type": "metered"
            },
            "type": "recurring",
            "unit_amount": 100
        }
        """.data(using: .utf8)!

        let price = try JSONDecoder().decode(Price.self, from: json)

        #expect(price.recurring?.usageType == .metered)
        #expect(price.recurring?.aggregateUsage == "sum")
        #expect(price.recurring?.meter == "mtr_123")
    }

    @Test("Decodes tiered price")
    func decodesTieredPrice() throws {
        let json = """
        {
            "id": "price_tiered",
            "object": "price",
            "active": true,
            "billing_scheme": "tiered",
            "created": 1234567890,
            "currency": "usd",
            "livemode": false,
            "product": "prod_tiered",
            "tiers": [
                {"flat_amount": null, "unit_amount": 1000, "up_to": 10},
                {"flat_amount": null, "unit_amount": 800, "up_to": 100},
                {"flat_amount": null, "unit_amount": 500, "up_to": null}
            ],
            "tiers_mode": "graduated",
            "type": "one_time"
        }
        """.data(using: .utf8)!

        let price = try JSONDecoder().decode(Price.self, from: json)

        #expect(price.billingScheme == "tiered")
        #expect(price.tiers?.count == 3)
        #expect(price.tiers?[0].unitAmount == 1000)
        #expect(price.tiers?[0].upTo == 10)
        #expect(price.tiers?[1].unitAmount == 800)
        #expect(price.tiers?[2].upTo == nil)
        #expect(price.tiersMode == "graduated")
    }

    @Test("Decodes price with currency options")
    func decodesPriceWithCurrencyOptions() throws {
        let json = """
        {
            "id": "price_multi_currency",
            "object": "price",
            "active": true,
            "billing_scheme": "per_unit",
            "created": 1234567890,
            "currency": "usd",
            "currency_options": {
                "eur": {
                    "unit_amount": 1800,
                    "unit_amount_decimal": "1800"
                },
                "gbp": {
                    "unit_amount": 1600,
                    "unit_amount_decimal": "1600"
                }
            },
            "livemode": false,
            "product": "prod_multi",
            "type": "one_time",
            "unit_amount": 2000
        }
        """.data(using: .utf8)!

        let price = try JSONDecoder().decode(Price.self, from: json)

        #expect(price.currencyOptions != nil)
        #expect(price.currencyOptions?["eur"]?.unitAmount == 1800)
        #expect(price.currencyOptions?["gbp"]?.unitAmount == 1600)
    }

    @Test("Decodes price with custom unit amount")
    func decodesPriceWithCustomUnitAmount() throws {
        let json = """
        {
            "id": "price_custom",
            "object": "price",
            "active": true,
            "billing_scheme": "per_unit",
            "created": 1234567890,
            "currency": "usd",
            "custom_unit_amount": {
                "maximum": 100000,
                "minimum": 100,
                "preset": 5000
            },
            "livemode": false,
            "product": "prod_custom",
            "type": "one_time"
        }
        """.data(using: .utf8)!

        let price = try JSONDecoder().decode(Price.self, from: json)

        #expect(price.customUnitAmount != nil)
        #expect(price.customUnitAmount?.maximum == 100000)
        #expect(price.customUnitAmount?.minimum == 100)
        #expect(price.customUnitAmount?.preset == 5000)
    }

    @Test("Handles all optional fields as null")
    func handlesAllOptionalFieldsAsNull() throws {
        let json = """
        {
            "id": "price_minimal",
            "object": "price",
            "active": true,
            "billing_scheme": "per_unit",
            "created": 1234567890,
            "currency": "usd",
            "currency_options": null,
            "custom_unit_amount": null,
            "livemode": false,
            "lookup_key": null,
            "nickname": null,
            "product": "prod_min",
            "recurring": null,
            "tax_behavior": null,
            "tiers": null,
            "tiers_mode": null,
            "transform_quantity": null,
            "type": "one_time",
            "unit_amount": null,
            "unit_amount_decimal": null
        }
        """.data(using: .utf8)!

        let price = try JSONDecoder().decode(Price.self, from: json)

        #expect(price.currencyOptions == nil)
        #expect(price.customUnitAmount == nil)
        #expect(price.lookupKey == nil)
        #expect(price.nickname == nil)
        #expect(price.recurring == nil)
        #expect(price.taxBehavior == nil)
        #expect(price.tiers == nil)
        #expect(price.tiersMode == nil)
        #expect(price.transformQuantity == nil)
        #expect(price.unitAmount == nil)
        #expect(price.unitAmountDecimal == nil)
    }

    // MARK: - Schema Tests

    @Test("Has correct schema")
    func hasCorrectSchema() {
        #expect(Price.schema == "prices")
    }
}
