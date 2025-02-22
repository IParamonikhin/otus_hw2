//
// PersonByNameResponseItems.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct PersonByNameResponseItems: Sendable, Codable, JSONEncodable, Hashable {

    public enum Sex: String, Sendable, Codable, CaseIterable {
        case male = "MALE"
        case female = "FEMALE"
        case unknown = "UNKNOWN"
    }
    public var kinopoiskId: Int?
    public var webUrl: String?
    public var nameRu: String?
    public var nameEn: String?
    public var sex: Sex?
    public var posterUrl: String?

    public init(kinopoiskId: Int? = nil, webUrl: String? = nil, nameRu: String? = nil, nameEn: String? = nil, sex: Sex? = nil, posterUrl: String? = nil) {
        self.kinopoiskId = kinopoiskId
        self.webUrl = webUrl
        self.nameRu = nameRu
        self.nameEn = nameEn
        self.sex = sex
        self.posterUrl = posterUrl
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case kinopoiskId
        case webUrl
        case nameRu
        case nameEn
        case sex
        case posterUrl
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(kinopoiskId, forKey: .kinopoiskId)
        try container.encodeIfPresent(webUrl, forKey: .webUrl)
        try container.encodeIfPresent(nameRu, forKey: .nameRu)
        try container.encodeIfPresent(nameEn, forKey: .nameEn)
        try container.encodeIfPresent(sex, forKey: .sex)
        try container.encodeIfPresent(posterUrl, forKey: .posterUrl)
    }
}

