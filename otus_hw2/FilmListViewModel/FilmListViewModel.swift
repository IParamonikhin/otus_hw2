//
//  FilmListViewModel.swift
//  otus_hw2
//
//  Created by Иван on 22.02.2025.
//

import Foundation
import KinopoiskAPI

final class FilmListViewModel: ObservableObject{
    private var page = 1
    
    var finished = false
    var canLoad = true
    
    @Published var films: [FilmCollectionResponseItems] = []
    private var currentCategory: FilmsAPI.ModelType_apiV22FilmsCollectionsGet?
    
    
    func fetch(category: FilmsAPI.ModelType_apiV22FilmsCollectionsGet){
        
        Task { @MainActor in
            
            if currentCategory != category {
                currentCategory = category
                page = 1
                films = []
                finished = false
            }
            
            let result = try await FilmsAPI.apiV22FilmsCollectionsGet(page: page, type: category, apiConfiguration: OpenAPIClientAPIConfiguration(customHeaders: ["X-API-KEY" : "134aebc6-5099-4a05-9579-b3f47f482aaa"] ))
            
            finished = result.totalPages <= page
            page += 1
            print ("Всего: \(result.totalPages) Загружено: \(page)")
            
            let parsedFilms = result.items.map { item in
                FilmCollectionResponseItems(
                    kinopoiskId: item.kinopoiskId,
                    nameRu: item.nameRu,
                    nameEn: item.nameEn,
                    nameOriginal: item.nameOriginal,
                    countries: item.countries,
                    genres: item.genres,
                    ratingKinopoisk: item.ratingKinopoisk,
                    ratingImbd: item.ratingImbd,
                    year: item.year,
                    type: item.type,
                    posterUrl: item.posterUrl,
                    posterUrlPreview: item.posterUrlPreview
                )
            }
            
            films.append(contentsOf: parsedFilms)
            
        }
    }
}
