//
// Client.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
import AnyCodable

public struct Client: Codable, Hashable {

    public private(set) var client: String?

    public init(client: String? = nil) {
        self.client = client
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case client
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(client, forKey: .client)
    }
}
