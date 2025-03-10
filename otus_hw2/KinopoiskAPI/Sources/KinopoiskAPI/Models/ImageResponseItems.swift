//
// ImageResponseItems.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct ImageResponseItems: Sendable, Codable, JSONEncodable, Hashable {

    public var imageUrl: String?
    public var previewUrl: String?

    public init(imageUrl: String? = nil, previewUrl: String? = nil) {
        self.imageUrl = imageUrl
        self.previewUrl = previewUrl
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case imageUrl
        case previewUrl
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(imageUrl, forKey: .imageUrl)
        try container.encodeIfPresent(previewUrl, forKey: .previewUrl)
    }
}

