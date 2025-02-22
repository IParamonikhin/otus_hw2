//
// ApiKeyResponseDailyQuota.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct ApiKeyResponseDailyQuota: Sendable, Codable, JSONEncodable, Hashable {

    public var value: Int
    public var used: Int

    public init(value: Int, used: Int) {
        self.value = value
        self.used = used
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case value
        case used
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(value, forKey: .value)
        try container.encode(used, forKey: .used)
    }
}

