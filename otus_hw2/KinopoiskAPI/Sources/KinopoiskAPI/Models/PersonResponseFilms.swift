//
// PersonResponseFilms.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation

public struct PersonResponseFilms: Sendable, Codable, JSONEncodable, Hashable {

    public enum ProfessionKey: String, Sendable, Codable, CaseIterable {
        case writer = "WRITER"
        case _operator = "OPERATOR"
        case editor = "EDITOR"
        case composer = "COMPOSER"
        case producerUssr = "PRODUCER_USSR"
        case himself = "HIMSELF"
        case herself = "HERSELF"
        case hronoTitrMale = "HRONO_TITR_MALE"
        case hronoTitrFemale = "HRONO_TITR_FEMALE"
        case translator = "TRANSLATOR"
        case director = "DIRECTOR"
        case design = "DESIGN"
        case producer = "PRODUCER"
        case actor = "ACTOR"
        case voiceDirector = "VOICE_DIRECTOR"
        case unknown = "UNKNOWN"
    }
    public var filmId: Int?
    public var nameRu: String?
    public var nameEn: String?
    public var rating: String?
    public var general: Bool?
    public var description: String?
    public var professionKey: ProfessionKey?

    public init(filmId: Int? = nil, nameRu: String? = nil, nameEn: String? = nil, rating: String? = nil, general: Bool? = nil, description: String? = nil, professionKey: ProfessionKey? = nil) {
        self.filmId = filmId
        self.nameRu = nameRu
        self.nameEn = nameEn
        self.rating = rating
        self.general = general
        self.description = description
        self.professionKey = professionKey
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case filmId
        case nameRu
        case nameEn
        case rating
        case general
        case description
        case professionKey
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(filmId, forKey: .filmId)
        try container.encodeIfPresent(nameRu, forKey: .nameRu)
        try container.encodeIfPresent(nameEn, forKey: .nameEn)
        try container.encodeIfPresent(rating, forKey: .rating)
        try container.encodeIfPresent(general, forKey: .general)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(professionKey, forKey: .professionKey)
    }
}

