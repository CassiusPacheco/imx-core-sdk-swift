//
// WithdrawalsAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

internal class WithdrawalsAPI {

    /**
     Creates a withdrawal of a token
     
     - parameter xImxEthAddress: (header) eth address 
     - parameter xImxEthSignature: (header) eth signature 
     - parameter createWithdrawalRequest: (body) create a withdrawal 
     - returns: CreateWithdrawalResponse
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    internal class func createWithdrawal(xImxEthAddress: String, xImxEthSignature: String, createWithdrawalRequest: CreateWithdrawalRequest) async throws -> CreateWithdrawalResponse {
        let requestBuilder = createWithdrawalWithRequestBuilder(xImxEthAddress: xImxEthAddress, xImxEthSignature: xImxEthSignature, createWithdrawalRequest: createWithdrawalRequest)
        let requestTask = requestBuilder.requestTask
        return try await withTaskCancellationHandler {
            try Task.checkCancellation()
            return try await withCheckedThrowingContinuation { continuation in
                guard !Task.isCancelled else {
                  continuation.resume(throwing: CancellationError())
                  return
                }

                requestBuilder.execute { result in
                    switch result {
                    case let .success(response):
                        continuation.resume(returning: response.body)
                    case let .failure(error):
                        continuation.resume(throwing: error)
                    }
                }
            }
        } onCancel: {
            requestTask.cancel()
        }
    }

    /**
     Creates a withdrawal of a token
     - POST /v1/withdrawals
     - Creates a withdrawal
     - parameter xImxEthAddress: (header) eth address 
     - parameter xImxEthSignature: (header) eth signature 
     - parameter createWithdrawalRequest: (body) create a withdrawal 
     - returns: RequestBuilder<CreateWithdrawalResponse> 
     */
    internal class func createWithdrawalWithRequestBuilder(xImxEthAddress: String, xImxEthSignature: String, createWithdrawalRequest: CreateWithdrawalRequest) -> RequestBuilder<CreateWithdrawalResponse> {
        let localVariablePath = "/v1/withdrawals"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: createWithdrawalRequest)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            "x-imx-eth-address": xImxEthAddress.encodeToJSON(),
            "x-imx-eth-signature": xImxEthSignature.encodeToJSON(),
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<CreateWithdrawalResponse>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: false)
    }

    /**
     Gets details of a signable withdrawal
     
     - parameter getSignableWithdrawalRequest: (body) get details of signable withdrawal 
     - returns: GetSignableWithdrawalResponse
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    internal class func getSignableWithdrawal(getSignableWithdrawalRequest: GetSignableWithdrawalRequest) async throws -> GetSignableWithdrawalResponse {
        let requestBuilder = getSignableWithdrawalWithRequestBuilder(getSignableWithdrawalRequest: getSignableWithdrawalRequest)
        let requestTask = requestBuilder.requestTask
        return try await withTaskCancellationHandler {
            try Task.checkCancellation()
            return try await withCheckedThrowingContinuation { continuation in
                guard !Task.isCancelled else {
                  continuation.resume(throwing: CancellationError())
                  return
                }

                requestBuilder.execute { result in
                    switch result {
                    case let .success(response):
                        continuation.resume(returning: response.body)
                    case let .failure(error):
                        continuation.resume(throwing: error)
                    }
                }
            }
        } onCancel: {
            requestTask.cancel()
        }
    }

    /**
     Gets details of a signable withdrawal
     - POST /v1/signable-withdrawal-details
     - Gets details of a signable withdrawal
     - parameter getSignableWithdrawalRequest: (body) get details of signable withdrawal 
     - returns: RequestBuilder<GetSignableWithdrawalResponse> 
     */
    internal class func getSignableWithdrawalWithRequestBuilder(getSignableWithdrawalRequest: GetSignableWithdrawalRequest) -> RequestBuilder<GetSignableWithdrawalResponse> {
        let localVariablePath = "/v1/signable-withdrawal-details"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters = JSONEncodingHelper.encodingParameters(forEncodableObject: getSignableWithdrawalRequest)

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<GetSignableWithdrawalResponse>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "POST", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: false)
    }

    /**
     Gets details of withdrawal with the given ID
     
     - parameter id: (path) Withdrawal ID 
     - returns: Withdrawal
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    internal class func getWithdrawal(id: String) async throws -> Withdrawal {
        let requestBuilder = getWithdrawalWithRequestBuilder(id: id)
        let requestTask = requestBuilder.requestTask
        return try await withTaskCancellationHandler {
            try Task.checkCancellation()
            return try await withCheckedThrowingContinuation { continuation in
                guard !Task.isCancelled else {
                  continuation.resume(throwing: CancellationError())
                  return
                }

                requestBuilder.execute { result in
                    switch result {
                    case let .success(response):
                        continuation.resume(returning: response.body)
                    case let .failure(error):
                        continuation.resume(throwing: error)
                    }
                }
            }
        } onCancel: {
            requestTask.cancel()
        }
    }

    /**
     Gets details of withdrawal with the given ID
     - GET /v1/withdrawals/{id}
     - Gets details of withdrawal with the given ID
     - parameter id: (path) Withdrawal ID 
     - returns: RequestBuilder<Withdrawal> 
     */
    internal class func getWithdrawalWithRequestBuilder(id: String) -> RequestBuilder<Withdrawal> {
        var localVariablePath = "/v1/withdrawals/{id}"
        let idPreEscape = "\(APIHelper.mapValueToPathItem(id))"
        let idPostEscape = idPreEscape.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        localVariablePath = localVariablePath.replacingOccurrences(of: "{id}", with: idPostEscape, options: .literal, range: nil)
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        let localVariableUrlComponents = URLComponents(string: localVariableURLString)

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<Withdrawal>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: false)
    }

    /**
     Get a list of withdrawals
     
     - parameter withdrawnToWallet: (query) Withdrawal has been transferred to user&#39;s Layer 1 wallet (optional)
     - parameter rollupStatus: (query) Status of the on-chain batch confirmation for this withdrawal (optional)
     - parameter pageSize: (query) Page size of the result (optional)
     - parameter cursor: (query) Cursor (optional)
     - parameter orderBy: (query) Property to sort by (optional)
     - parameter direction: (query) Direction to sort (asc/desc) (optional)
     - parameter user: (query) Ethereum address of the user who submitted this withdrawal (optional)
     - parameter status: (query) Status of this withdrawal (optional)
     - parameter minTimestamp: (query) Minimum timestamp for this deposit, in ISO 8601 UTC format. Example: &#39;2022-05-27T00:10:22Z&#39; (optional)
     - parameter maxTimestamp: (query) Maximum timestamp for this deposit, in ISO 8601 UTC format. Example: &#39;2022-05-27T00:10:22Z&#39; (optional)
     - parameter tokenType: (query) Token type of the withdrawn asset (optional)
     - parameter tokenId: (query) ERC721 Token ID of the minted asset (optional)
     - parameter assetId: (query) Internal IMX ID of the minted asset (optional)
     - parameter tokenAddress: (query) Token address of the withdrawn asset (optional)
     - parameter tokenName: (query) Token name of the withdrawn asset (optional)
     - parameter minQuantity: (query) Min quantity for the withdrawn asset (optional)
     - parameter maxQuantity: (query) Max quantity for the withdrawn asset (optional)
     - parameter metadata: (query) JSON-encoded metadata filters for the withdrawn asset (optional)
     - returns: ListWithdrawalsResponse
     */
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    internal class func listWithdrawals(withdrawnToWallet: Bool? = nil, rollupStatus: String? = nil, pageSize: Int? = nil, cursor: String? = nil, orderBy: String? = nil, direction: String? = nil, user: String? = nil, status: String? = nil, minTimestamp: String? = nil, maxTimestamp: String? = nil, tokenType: String? = nil, tokenId: String? = nil, assetId: String? = nil, tokenAddress: String? = nil, tokenName: String? = nil, minQuantity: String? = nil, maxQuantity: String? = nil, metadata: String? = nil) async throws -> ListWithdrawalsResponse {
        let requestBuilder = listWithdrawalsWithRequestBuilder(withdrawnToWallet: withdrawnToWallet, rollupStatus: rollupStatus, pageSize: pageSize, cursor: cursor, orderBy: orderBy, direction: direction, user: user, status: status, minTimestamp: minTimestamp, maxTimestamp: maxTimestamp, tokenType: tokenType, tokenId: tokenId, assetId: assetId, tokenAddress: tokenAddress, tokenName: tokenName, minQuantity: minQuantity, maxQuantity: maxQuantity, metadata: metadata)
        let requestTask = requestBuilder.requestTask
        return try await withTaskCancellationHandler {
            try Task.checkCancellation()
            return try await withCheckedThrowingContinuation { continuation in
                guard !Task.isCancelled else {
                  continuation.resume(throwing: CancellationError())
                  return
                }

                requestBuilder.execute { result in
                    switch result {
                    case let .success(response):
                        continuation.resume(returning: response.body)
                    case let .failure(error):
                        continuation.resume(throwing: error)
                    }
                }
            }
        } onCancel: {
            requestTask.cancel()
        }
    }

    /**
     Get a list of withdrawals
     - GET /v1/withdrawals
     - Get a list of withdrawals
     - parameter withdrawnToWallet: (query) Withdrawal has been transferred to user&#39;s Layer 1 wallet (optional)
     - parameter rollupStatus: (query) Status of the on-chain batch confirmation for this withdrawal (optional)
     - parameter pageSize: (query) Page size of the result (optional)
     - parameter cursor: (query) Cursor (optional)
     - parameter orderBy: (query) Property to sort by (optional)
     - parameter direction: (query) Direction to sort (asc/desc) (optional)
     - parameter user: (query) Ethereum address of the user who submitted this withdrawal (optional)
     - parameter status: (query) Status of this withdrawal (optional)
     - parameter minTimestamp: (query) Minimum timestamp for this deposit, in ISO 8601 UTC format. Example: &#39;2022-05-27T00:10:22Z&#39; (optional)
     - parameter maxTimestamp: (query) Maximum timestamp for this deposit, in ISO 8601 UTC format. Example: &#39;2022-05-27T00:10:22Z&#39; (optional)
     - parameter tokenType: (query) Token type of the withdrawn asset (optional)
     - parameter tokenId: (query) ERC721 Token ID of the minted asset (optional)
     - parameter assetId: (query) Internal IMX ID of the minted asset (optional)
     - parameter tokenAddress: (query) Token address of the withdrawn asset (optional)
     - parameter tokenName: (query) Token name of the withdrawn asset (optional)
     - parameter minQuantity: (query) Min quantity for the withdrawn asset (optional)
     - parameter maxQuantity: (query) Max quantity for the withdrawn asset (optional)
     - parameter metadata: (query) JSON-encoded metadata filters for the withdrawn asset (optional)
     - returns: RequestBuilder<ListWithdrawalsResponse> 
     */
    internal class func listWithdrawalsWithRequestBuilder(withdrawnToWallet: Bool? = nil, rollupStatus: String? = nil, pageSize: Int? = nil, cursor: String? = nil, orderBy: String? = nil, direction: String? = nil, user: String? = nil, status: String? = nil, minTimestamp: String? = nil, maxTimestamp: String? = nil, tokenType: String? = nil, tokenId: String? = nil, assetId: String? = nil, tokenAddress: String? = nil, tokenName: String? = nil, minQuantity: String? = nil, maxQuantity: String? = nil, metadata: String? = nil) -> RequestBuilder<ListWithdrawalsResponse> {
        let localVariablePath = "/v1/withdrawals"
        let localVariableURLString = OpenAPIClientAPI.basePath + localVariablePath
        let localVariableParameters: [String: Any]? = nil

        var localVariableUrlComponents = URLComponents(string: localVariableURLString)
        localVariableUrlComponents?.queryItems = APIHelper.mapValuesToQueryItems([
            "withdrawn_to_wallet": (wrappedValue: withdrawnToWallet?.encodeToJSON(), isExplode: false),
            "rollup_status": (wrappedValue: rollupStatus?.encodeToJSON(), isExplode: false),
            "page_size": (wrappedValue: pageSize?.encodeToJSON(), isExplode: false),
            "cursor": (wrappedValue: cursor?.encodeToJSON(), isExplode: false),
            "order_by": (wrappedValue: orderBy?.encodeToJSON(), isExplode: false),
            "direction": (wrappedValue: direction?.encodeToJSON(), isExplode: false),
            "user": (wrappedValue: user?.encodeToJSON(), isExplode: false),
            "status": (wrappedValue: status?.encodeToJSON(), isExplode: false),
            "min_timestamp": (wrappedValue: minTimestamp?.encodeToJSON(), isExplode: false),
            "max_timestamp": (wrappedValue: maxTimestamp?.encodeToJSON(), isExplode: false),
            "token_type": (wrappedValue: tokenType?.encodeToJSON(), isExplode: false),
            "token_id": (wrappedValue: tokenId?.encodeToJSON(), isExplode: false),
            "asset_id": (wrappedValue: assetId?.encodeToJSON(), isExplode: false),
            "token_address": (wrappedValue: tokenAddress?.encodeToJSON(), isExplode: false),
            "token_name": (wrappedValue: tokenName?.encodeToJSON(), isExplode: false),
            "min_quantity": (wrappedValue: minQuantity?.encodeToJSON(), isExplode: false),
            "max_quantity": (wrappedValue: maxQuantity?.encodeToJSON(), isExplode: false),
            "metadata": (wrappedValue: metadata?.encodeToJSON(), isExplode: false),
        ])

        let localVariableNillableHeaders: [String: Any?] = [
            :
        ]

        let localVariableHeaderParameters = APIHelper.rejectNilHeaders(localVariableNillableHeaders)

        let localVariableRequestBuilder: RequestBuilder<ListWithdrawalsResponse>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return localVariableRequestBuilder.init(method: "GET", URLString: (localVariableUrlComponents?.string ?? localVariableURLString), parameters: localVariableParameters, headers: localVariableHeaderParameters, requiresAuthentication: false)
    }
}
