//
// RelatedFilmResponse.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct RelatedFilmResponse: Sendable, Codable, JSONEncodable, Hashable {

    public var total: Int
    public var items: [RelatedFilmResponseItems]

    public init(total: Int, items: [RelatedFilmResponseItems]) {
        self.total = total
        self.items = items
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case total
        case items
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(total, forKey: .total)
        try container.encode(items, forKey: .items)
    }
}

