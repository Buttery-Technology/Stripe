import Testing
import Foundation
@testable import Stripe

@Suite("Product Tests")
struct ProductTests {

    // MARK: - JSON Decoding Tests

    @Test("Decodes minimal product JSON")
    func decodesMinimalProduct() throws {
        let json = """
        {
            "id": "prod_123",
            "object": "product",
            "active": true,
            "created": 1234567890,
            "images": [],
            "livemode": false,
            "name": "Test Product",
            "updated": 1234567890
        }
        """.data(using: .utf8)!

        let product = try JSONDecoder().decode(Product.self, from: json)

        #expect(product.id == "prod_123")
        #expect(product.object == "product")
        #expect(product.active == true)
        #expect(product.name == "Test Product")
        #expect(product.images.isEmpty)
        #expect(product.livemode == false)
    }

    @Test("Decodes product with full details")
    func decodesFullProduct() throws {
        let json = """
        {
            "id": "prod_456",
            "object": "product",
            "active": true,
            "created": 1234567890,
            "default_price": "price_123",
            "description": "A great product",
            "images": ["https://example.com/image1.png", "https://example.com/image2.png"],
            "livemode": true,
            "metadata": {},
            "name": "Premium Widget",
            "package_dimensions": {
                "height": 10.5,
                "width": 5.0,
                "length": 15.0,
                "weight": 2.5
            },
            "shippable": true,
            "statement_descriptor": "WIDGET",
            "tax_code": "txcd_123",
            "unit_label": "widget",
            "updated": 1234567890,
            "url": "https://example.com/products/widget"
        }
        """.data(using: .utf8)!

        let product = try JSONDecoder().decode(Product.self, from: json)

        #expect(product.id == "prod_456")
        #expect(product.defaultPrice == "price_123")
        #expect(product.productDescription == "A great product")
        #expect(product.images.count == 2)
        #expect(product.livemode == true)
        #expect(product.name == "Premium Widget")
        #expect(product.packageDimensions != nil)
        #expect(product.shippable == true)
        #expect(product.statementDescriptor == "WIDGET")
        #expect(product.taxCode == "txcd_123")
        #expect(product.unitLabel == "widget")
        #expect(product.url == "https://example.com/products/widget")
    }

    @Test("Decodes product with marketing features")
    func decodesProductWithMarketingFeatures() throws {
        let json = """
        {
            "id": "prod_features",
            "object": "product",
            "active": true,
            "created": 1234567890,
            "images": [],
            "livemode": false,
            "marketing_features": [
                {"name": "Fast shipping"},
                {"name": "24/7 support"},
                {"name": "Money-back guarantee"}
            ],
            "name": "Feature-Rich Product",
            "updated": 1234567890
        }
        """.data(using: .utf8)!

        let product = try JSONDecoder().decode(Product.self, from: json)

        #expect(product.marketingFeatures?.count == 3)
        #expect(product.marketingFeatures?[0].name == "Fast shipping")
        #expect(product.marketingFeatures?[1].name == "24/7 support")
        #expect(product.marketingFeatures?[2].name == "Money-back guarantee")
    }

    @Test("Handles null optional fields")
    func handlesNullOptionalFields() throws {
        let json = """
        {
            "id": "prod_null",
            "object": "product",
            "active": false,
            "created": 1234567890,
            "default_price": null,
            "description": null,
            "images": [],
            "livemode": false,
            "name": "Null Test",
            "package_dimensions": null,
            "shippable": null,
            "updated": 1234567890
        }
        """.data(using: .utf8)!

        let product = try JSONDecoder().decode(Product.self, from: json)

        #expect(product.defaultPrice == nil)
        #expect(product.productDescription == nil)
        #expect(product.packageDimensions == nil)
        #expect(product.shippable == nil)
    }

    // MARK: - Schema Tests

    @Test("Has correct schema")
    func hasCorrectSchema() {
        #expect(Product.schema == "products")
    }
}
