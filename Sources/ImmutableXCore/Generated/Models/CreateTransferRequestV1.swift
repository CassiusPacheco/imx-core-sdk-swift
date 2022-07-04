//
// CreateTransferRequestV1.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct CreateTransferRequestV1: Codable, JSONEncodable, Hashable {

    /** Amount to transfer */
    public private(set) var amount: String
    /** ID of the asset to transfer */
    public private(set) var assetId: String
    /** Expiration timestamp for this transfer */
    public private(set) var expirationTimestamp: Int
    /** Nonce of the transfer */
    public private(set) var nonce: Int
    /** Public stark key of the user receiving the transfer */
    public private(set) var receiverStarkKey: String
    /** ID of the vault into which the asset will be transferred to */
    public private(set) var receiverVaultId: Int
    /** Public stark key of the user sending the transfer */
    public private(set) var senderStarkKey: String
    /** ID of the vault into which the asset is from */
    public private(set) var senderVaultId: Int
    /** Transfer payload signature */
    public private(set) var starkSignature: String

    public init(amount: String, assetId: String, expirationTimestamp: Int, nonce: Int, receiverStarkKey: String, receiverVaultId: Int, senderStarkKey: String, senderVaultId: Int, starkSignature: String) {
        self.amount = amount
        self.assetId = assetId
        self.expirationTimestamp = expirationTimestamp
        self.nonce = nonce
        self.receiverStarkKey = receiverStarkKey
        self.receiverVaultId = receiverVaultId
        self.senderStarkKey = senderStarkKey
        self.senderVaultId = senderVaultId
        self.starkSignature = starkSignature
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case amount
        case assetId = "asset_id"
        case expirationTimestamp = "expiration_timestamp"
        case nonce
        case receiverStarkKey = "receiver_stark_key"
        case receiverVaultId = "receiver_vault_id"
        case senderStarkKey = "sender_stark_key"
        case senderVaultId = "sender_vault_id"
        case starkSignature = "stark_signature"
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(amount, forKey: .amount)
        try container.encode(assetId, forKey: .assetId)
        try container.encode(expirationTimestamp, forKey: .expirationTimestamp)
        try container.encode(nonce, forKey: .nonce)
        try container.encode(receiverStarkKey, forKey: .receiverStarkKey)
        try container.encode(receiverVaultId, forKey: .receiverVaultId)
        try container.encode(senderStarkKey, forKey: .senderStarkKey)
        try container.encode(senderVaultId, forKey: .senderVaultId)
        try container.encode(starkSignature, forKey: .starkSignature)
    }
}

