//
// GetSignableTransferRequest.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct GetSignableTransferRequest: Codable, JSONEncodable, Hashable {

    /** Ethereum address of the transferring user */
    public private(set) var senderEtherKey: String
    /** List of signable transfer details */
    public private(set) var signableRequests: [SignableTransferDetails]

    public init(senderEtherKey: String, signableRequests: [SignableTransferDetails]) {
        self.senderEtherKey = senderEtherKey
        self.signableRequests = signableRequests
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case senderEtherKey = "sender_ether_key"
        case signableRequests = "signable_requests"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(senderEtherKey, forKey: .senderEtherKey)
        try container.encode(signableRequests, forKey: .signableRequests)
    }
}

