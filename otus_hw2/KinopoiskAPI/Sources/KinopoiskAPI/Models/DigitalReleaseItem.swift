//
// DigitalReleaseItem.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct DigitalReleaseItem: Sendable, Codable, JSONEncodable, Hashable {

    public var filmId: Int
    public var nameRu: String
    public var nameEn: String
    public var year: Int
    public var posterUrl: String
    public var posterUrlPreview: String
    public var countries: [Country]
    public var genres: [Genre]
    public var rating: Double
    public var ratingVoteCount: Int
    public var expectationsRating: Double
    public var expectationsRatingVoteCount: Int
    public var duration: Int
    public var releaseDate: String

    public init(filmId: Int, nameRu: String, nameEn: String, year: Int, posterUrl: String, posterUrlPreview: String, countries: [Country], genres: [Genre], rating: Double, ratingVoteCount: Int, expectationsRating: Double, expectationsRatingVoteCount: Int, duration: Int, releaseDate: String) {
        self.filmId = filmId
        self.nameRu = nameRu
        self.nameEn = nameEn
        self.year = year
        self.posterUrl = posterUrl
        self.posterUrlPreview = posterUrlPreview
        self.countries = countries
        self.genres = genres
        self.rating = rating
        self.ratingVoteCount = ratingVoteCount
        self.expectationsRating = expectationsRating
        self.expectationsRatingVoteCount = expectationsRatingVoteCount
        self.duration = duration
        self.releaseDate = releaseDate
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case filmId
        case nameRu
        case nameEn
        case year
        case posterUrl
        case posterUrlPreview
        case countries
        case genres
        case rating
        case ratingVoteCount
        case expectationsRating
        case expectationsRatingVoteCount
        case duration
        case releaseDate
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(filmId, forKey: .filmId)
        try container.encode(nameRu, forKey: .nameRu)
        try container.encode(nameEn, forKey: .nameEn)
        try container.encode(year, forKey: .year)
        try container.encode(posterUrl, forKey: .posterUrl)
        try container.encode(posterUrlPreview, forKey: .posterUrlPreview)
        try container.encode(countries, forKey: .countries)
        try container.encode(genres, forKey: .genres)
        try container.encode(rating, forKey: .rating)
        try container.encode(ratingVoteCount, forKey: .ratingVoteCount)
        try container.encode(expectationsRating, forKey: .expectationsRating)
        try container.encode(expectationsRatingVoteCount, forKey: .expectationsRatingVoteCount)
        try container.encode(duration, forKey: .duration)
        try container.encode(releaseDate, forKey: .releaseDate)
    }
}

