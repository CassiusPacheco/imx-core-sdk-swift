//
// AddMetadataSchemaToCollectionRequest.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct AddMetadataSchemaToCollectionRequest: Codable, JSONEncodable, Hashable {

    /** Not required from API user */
    public private(set) var contractAddress: String?
    /** The metadata container */
    public private(set) var metadata: [MetadataSchemaRequest]

    public init(contractAddress: String? = nil, metadata: [MetadataSchemaRequest]) {
        self.contractAddress = contractAddress
        self.metadata = metadata
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case contractAddress = "contract_address"
        case metadata
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(contractAddress, forKey: .contractAddress)
        try container.encode(metadata, forKey: .metadata)
    }
}

