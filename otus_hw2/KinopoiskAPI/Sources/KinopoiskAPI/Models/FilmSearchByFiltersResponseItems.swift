//
// FilmSearchByFiltersResponseItems.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct FilmSearchByFiltersResponseItems: Sendable, Codable, JSONEncodable, Hashable {

    public enum ModelType: String, Sendable, Codable, CaseIterable {
        case film = "FILM"
        case tvShow = "TV_SHOW"
        case video = "VIDEO"
        case miniSeries = "MINI_SERIES"
        case tvSeries = "TV_SERIES"
        case unknown = "UNKNOWN"
    }
    public var kinopoiskId: Int?
    public var imdbId: String?
    public var nameRu: String?
    public var nameEn: String?
    public var nameOriginal: String?
    public var countries: [Country]?
    public var genres: [Genre]?
    public var ratingKinopoisk: Double?
    public var ratingImdb: Double?
    public var year: Double?
    public var type: ModelType?
    public var posterUrl: String?
    public var posterUrlPreview: String?

    public init(kinopoiskId: Int? = nil, imdbId: String? = nil, nameRu: String? = nil, nameEn: String? = nil, nameOriginal: String? = nil, countries: [Country]? = nil, genres: [Genre]? = nil, ratingKinopoisk: Double? = nil, ratingImdb: Double? = nil, year: Double? = nil, type: ModelType? = nil, posterUrl: String? = nil, posterUrlPreview: String? = nil) {
        self.kinopoiskId = kinopoiskId
        self.imdbId = imdbId
        self.nameRu = nameRu
        self.nameEn = nameEn
        self.nameOriginal = nameOriginal
        self.countries = countries
        self.genres = genres
        self.ratingKinopoisk = ratingKinopoisk
        self.ratingImdb = ratingImdb
        self.year = year
        self.type = type
        self.posterUrl = posterUrl
        self.posterUrlPreview = posterUrlPreview
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case kinopoiskId
        case imdbId
        case nameRu
        case nameEn
        case nameOriginal
        case countries
        case genres
        case ratingKinopoisk
        case ratingImdb
        case year
        case type
        case posterUrl
        case posterUrlPreview
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(kinopoiskId, forKey: .kinopoiskId)
        try container.encodeIfPresent(imdbId, forKey: .imdbId)
        try container.encodeIfPresent(nameRu, forKey: .nameRu)
        try container.encodeIfPresent(nameEn, forKey: .nameEn)
        try container.encodeIfPresent(nameOriginal, forKey: .nameOriginal)
        try container.encodeIfPresent(countries, forKey: .countries)
        try container.encodeIfPresent(genres, forKey: .genres)
        try container.encodeIfPresent(ratingKinopoisk, forKey: .ratingKinopoisk)
        try container.encodeIfPresent(ratingImdb, forKey: .ratingImdb)
        try container.encodeIfPresent(year, forKey: .year)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(posterUrl, forKey: .posterUrl)
        try container.encodeIfPresent(posterUrlPreview, forKey: .posterUrlPreview)
    }
}

