@testable import ImmutableXCore
import XCTest

final class BuyWorkflowTests: XCTestCase {
    let ordersAPI = OrdersAPIMock.self
    let tradesAPI = TradesAPIMock.self

    override func setUp() {
        super.setUp()

        ordersAPI.resetMock()
        tradesAPI.resetMock()

        let orderCompanion = OrdersAPIMockGetCompanion()
        orderCompanion.returnValue = orderActiveStub2
        ordersAPI.mock(orderCompanion, id: "1")

        let tradeGetCompanion = TradesAPIMockGetCompanion()
        tradeGetCompanion.returnValue = signableTradeResponseStub1
        tradesAPI.mock(tradeGetCompanion, id: 1)

        let tradeCreateCompanion = TradesAPIMockCreateCompanion()
        tradeCreateCompanion.returnValue = createTradeResponseStub1
        tradesAPI.mock(tradeCreateCompanion, id: 1)
    }

    func testBuyFlowSuccess() async throws {
        let response = try await BuyWorkflow.buy(
            orderId: "1",
            fees: [feeEntryStub1],
            signer: SignerMock(),
            starkSigner: StarkSignerMock(),
            ordersAPI: ordersAPI,
            tradesAPI: tradesAPI
        )

        XCTAssertEqual(response, createTradeResponseStub1)
    }

    func testBuyFlowThrowsWhenFeePercentageIsInvalid() {
        XCTAssertThrowsErrorAsync { [unowned self] in
            _ = try await BuyWorkflow.buy(
                orderId: "1",
                fees: [FeeEntry(address: "address", feePercentage: nil)],
                signer: SignerMock(),
                starkSigner: StarkSignerMock(),
                ordersAPI: self.ordersAPI,
                tradesAPI: self.tradesAPI
            )
        }
    }

    func testBuyFlowThrowsWhenFeeAddressIsInvalid() {
        XCTAssertThrowsErrorAsync { [unowned self] in
            _ = try await BuyWorkflow.buy(
                orderId: "1",
                fees: [FeeEntry(address: nil, feePercentage: 2)],
                signer: SignerMock(),
                starkSigner: StarkSignerMock(),
                ordersAPI: self.ordersAPI,
                tradesAPI: self.tradesAPI
            )
        }
    }

    func testBuyFlowThrowsWhenPurchaseOwnOrder() {
        let signer = SignerMock()
        signer.getAddressReturnValue = orderActiveStub2.user

        XCTAssertThrowsErrorAsync { [unowned self] in
            _ = try await BuyWorkflow.buy(
                orderId: "1",
                fees: [],
                signer: signer,
                starkSigner: StarkSignerMock(),
                ordersAPI: self.ordersAPI,
                tradesAPI: self.tradesAPI
            )
        }
    }

    func testBuyFlowThrowsWhenOrderStatusIsNotActive() {
        let orderCompanion = OrdersAPIMockGetCompanion()
        orderCompanion.returnValue = orderFilledStub1
        ordersAPI.mock(orderCompanion, id: "1")

        XCTAssertThrowsErrorAsync { [unowned self] in
            _ = try await BuyWorkflow.buy(
                orderId: "1",
                fees: [],
                signer: SignerMock(),
                starkSigner: StarkSignerMock(),
                ordersAPI: self.ordersAPI,
                tradesAPI: self.tradesAPI
            )
        }
    }

    func testBuyFlowThrowsWhenGetOrderFails() {
        let orderCompanion = OrdersAPIMockGetCompanion()
        orderCompanion.throwableError = DummyError.something
        ordersAPI.mock(orderCompanion, id: "1")

        XCTAssertThrowsErrorAsync { [unowned self] in
            _ = try await BuyWorkflow.buy(
                orderId: "1",
                fees: [],
                signer: SignerMock(),
                starkSigner: StarkSignerMock(),
                ordersAPI: self.ordersAPI,
                tradesAPI: self.tradesAPI
            )
        }
    }

    func testBuyFlowThrowsWhenGetSignableTradeFails() {
        let tradeGetCompanion = TradesAPIMockGetCompanion()
        tradeGetCompanion.throwableError = DummyError.something
        tradesAPI.mock(tradeGetCompanion, id: 1)

        XCTAssertThrowsErrorAsync { [unowned self] in
            _ = try await BuyWorkflow.buy(
                orderId: "1",
                fees: [],
                signer: SignerMock(),
                starkSigner: StarkSignerMock(),
                ordersAPI: self.ordersAPI,
                tradesAPI: self.tradesAPI
            )
        }
    }

    func testBuyFlowThrowsWhenCreateSignableTradeFails() {
        let tradeCreateCompanion = TradesAPIMockCreateCompanion()
        tradeCreateCompanion.throwableError = DummyError.something
        tradesAPI.mock(tradeCreateCompanion, id: 1)

        XCTAssertThrowsErrorAsync { [unowned self] in
            _ = try await BuyWorkflow.buy(
                orderId: "1",
                fees: [],
                signer: SignerMock(),
                starkSigner: StarkSignerMock(),
                ordersAPI: self.ordersAPI,
                tradesAPI: self.tradesAPI
            )
        }
    }
}
