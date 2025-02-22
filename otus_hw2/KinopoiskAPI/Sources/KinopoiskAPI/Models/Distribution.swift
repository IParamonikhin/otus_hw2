//
// Distribution.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct Distribution: Sendable, Codable, JSONEncodable, Hashable {

    public enum ModelType: String, Sendable, Codable, CaseIterable {
        case local = "LOCAL"
        case countrySpecific = "COUNTRY_SPECIFIC"
        case premiere = "PREMIERE"
        case all = "ALL"
        case worldPremier = "WORLD_PREMIER"
    }
    public enum SubType: String, Sendable, Codable, CaseIterable {
        case cinema = "CINEMA"
        case dvd = "DVD"
        case digital = "DIGITAL"
        case bluray = "BLURAY"
    }
    public var type: ModelType
    public var subType: SubType?
    public var date: String?
    public var reRelease: Bool?
    public var country: DistributionCountry
    public var companies: [Company]

    public init(type: ModelType, subType: SubType?, date: String?, reRelease: Bool?, country: DistributionCountry, companies: [Company]) {
        self.type = type
        self.subType = subType
        self.date = date
        self.reRelease = reRelease
        self.country = country
        self.companies = companies
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case type
        case subType
        case date
        case reRelease
        case country
        case companies
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        try container.encode(subType, forKey: .subType)
        try container.encode(date, forKey: .date)
        try container.encode(reRelease, forKey: .reRelease)
        try container.encode(country, forKey: .country)
        try container.encode(companies, forKey: .companies)
    }
}

