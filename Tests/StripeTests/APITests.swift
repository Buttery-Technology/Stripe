import Testing
import Foundation
@testable import Stripe

@Suite("API Tests")
struct APITests {

    // MARK: - Namespace Tests

    @Test("V1 namespace has correct base URL")
    func v1NamespaceHasCorrectBaseURL() {
        #expect(API.Namespace.v1.baseURL == "https://api.stripe.com/v1/")
    }

    @Test("V2 namespace has correct base URL")
    func v2NamespaceHasCorrectBaseURL() {
        #expect(API.Namespace.v2.baseURL == "https://api.stripe.com/v2/")
    }

    @Test("V1 namespace has form-urlencoded content type")
    func v1NamespaceHasFormEncodedContentType() {
        #expect(API.Namespace.v1.contentType == "application/x-www-form-urlencoded")
    }

    @Test("V2 namespace has JSON content type")
    func v2NamespaceHasJSONContentType() {
        #expect(API.Namespace.v2.contentType == "application/json")
    }

    // MARK: - Initialization Tests

    @Test("Initialize with endpoint and secret")
    func initializeWithEndpointAndSecret() {
        let api = API(endPoint: "https://custom.stripe.com/v1/", secret: "sk_test_123")

        #expect(api.endPoint == "https://custom.stripe.com/v1/")
        #expect(api.secret == "sk_test_123")
        #expect(api.v2EndPoint == API.Namespace.v2.baseURL)
    }

    @Test("Static initialize sets shared instance")
    func staticInitializeSetsSharedInstance() {
        API.initialize(secret: "sk_test_static")

        #expect(API.shared.secret == "sk_test_static")
        #expect(API.shared.endPoint == "https://api.stripe.com/v1/")
    }

    @Test("Static initializeV2 sets v2 endpoint")
    func staticInitializeV2SetsV2Endpoint() {
        API.initializeV2(secret: "sk_test_v2", apiVersion: "2024-09-30.acacia")

        #expect(API.shared.secret == "sk_test_v2")
        #expect(API.shared.v2EndPoint == API.Namespace.v2.baseURL)
        #expect(API.shared.apiVersion == "2024-09-30.acacia")
    }

    // MARK: - Endpoint Selection Tests

    @Test("Returns correct endpoint for v1 namespace")
    func returnsCorrectEndpointForV1() {
        let api = API(endPoint: "https://api.stripe.com/v1/", secret: "sk_test")

        #expect(api.endPoint(for: .v1) == "https://api.stripe.com/v1/")
    }

    @Test("Returns correct endpoint for v2 namespace")
    func returnsCorrectEndpointForV2() {
        var api = API()
        api.v2EndPoint = "https://api.stripe.com/v2/"

        #expect(api.endPoint(for: .v2) == "https://api.stripe.com/v2/")
    }

    // MARK: - Headers Tests

    @Test("V1 headers include authorization and content type")
    func v1HeadersIncludeAuthAndContentType() {
        let api = API(endPoint: "https://api.stripe.com/v1/", secret: "sk_test_headers")

        let headers = api.headers(for: .v1)

        #expect(headers["Authorization"] == "Bearer sk_test_headers")
        #expect(headers["Content-Type"] == "application/x-www-form-urlencoded")
        #expect(headers["Stripe-Version"] == nil)
    }

    @Test("V2 headers include Stripe-Version")
    func v2HeadersIncludeStripeVersion() {
        var api = API(endPoint: "https://api.stripe.com/v1/", secret: "sk_test_v2_headers")
        api.apiVersion = "2024-09-30.acacia"

        let headers = api.headers(for: .v2)

        #expect(headers["Authorization"] == "Bearer sk_test_v2_headers")
        #expect(headers["Content-Type"] == "application/json")
        #expect(headers["Stripe-Version"] == "2024-09-30.acacia")
    }

    // MARK: - API Version Tests

    @Test("Default API version is set")
    func defaultAPIVersionIsSet() {
        let api = API()

        #expect(api.apiVersion == "2024-09-30.acacia")
    }

    @Test("API version can be customized")
    func apiVersionCanBeCustomized() {
        API.initialize(secret: "sk_test", apiVersion: "2025-01-01.custom")

        #expect(API.shared.apiVersion == "2025-01-01.custom")
    }
}
