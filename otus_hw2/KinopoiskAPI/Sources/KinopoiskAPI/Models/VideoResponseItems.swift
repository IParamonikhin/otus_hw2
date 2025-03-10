//
// VideoResponseItems.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct VideoResponseItems: Sendable, Codable, JSONEncodable, Hashable {

    public enum Site: String, Sendable, Codable, CaseIterable {
        case youtube = "YOUTUBE"
        case kinopoiskWidget = "KINOPOISK_WIDGET"
        case yandexDisk = "YANDEX_DISK"
        case unknown = "UNKNOWN"
    }
    public var url: String?
    public var name: String?
    public var site: Site?

    public init(url: String? = nil, name: String? = nil, site: Site? = nil) {
        self.url = url
        self.name = name
        self.site = site
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case url
        case name
        case site
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(url, forKey: .url)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(site, forKey: .site)
    }
}

