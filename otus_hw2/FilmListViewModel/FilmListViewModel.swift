//
//  FilmListViewModel.swift
//  otus_hw2
//
//  Created by Иван on 22.02.2025.
//

import Foundation
import Combine
import KinopoiskAPI

final class FilmListViewModel: ObservableObject {
    @Published var films: [FilmCollectionResponseItems] = []
    
    private let filmsService: FilmsServiceProtocol
    var page = 1
    var finished = false
    var canLoad = true

    init(
        filmsService: FilmsServiceProtocol = ServiceLocator.shared.resolve()!
    ) {
        self.filmsService = filmsService
    }

    func fetch(category: FilmsAPI.ModelType_apiV22FilmsCollectionsGet, page: Int = 1) {
        guard canLoad, !finished else { return }
        canLoad = false

        Task { @MainActor in
            do {
                let result = try await filmsService.fetchFilmsCollection(type: category, page: page)

                if page == 1 {
                    films.removeAll()
                    finished = false
                }

                self.page = page + 1
                finished = result.totalPages < self.page
                films.append(contentsOf: result.items)
                canLoad = true
            } catch {
                print("Ошибка загрузки: \(error)")
                canLoad = true
            }
        }
    }
}
