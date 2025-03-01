//
//  FilmServices.swift
//  otus_hw2
//
//  Created by Иван on 01.03.2025.
//

import Foundation
import KinopoiskAPI
import CoreServices

protocol FilmsServiceProtocol {
    func fetchFilmsCollection(type: FilmsAPI.ModelType_apiV22FilmsCollectionsGet, page: Int) async throws -> FilmCollectionResponse
    func fetchFilmDetails(id: Int) async throws -> Film
}

final class FilmsService: FilmsServiceProtocol {
    
    private let networkService: NetworkServiceProtocol
    private let apiConfiguration = OpenAPIClientAPIConfiguration(customHeaders: ["X-API-KEY" : "134aebc6-5099-4a05-9579-b3f47f482aaa"] )

    init(
        networkService: NetworkServiceProtocol = ServiceLocator.shared.resolve()!
    ) {
        self.networkService = networkService
    }

    func fetchFilmsCollection(type: FilmsAPI.ModelType_apiV22FilmsCollectionsGet, page: Int = 1) async throws -> FilmCollectionResponse {
        let result = try await FilmsAPI.apiV22FilmsCollectionsGet(page: page, type: type, apiConfiguration: apiConfiguration)
        return result
    }
    
    func fetchFilmDetails(id: Int) async throws -> Film {
        let result = try await FilmsAPI.apiV22FilmsIdGet(id: id, apiConfiguration: apiConfiguration)
        return result
    }
}
