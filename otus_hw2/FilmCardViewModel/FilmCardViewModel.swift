//
//  FilmCardViewModel.swift
//  otus_hw2
//
//  Created by Иван on 22.02.2025.
//

import Foundation
import SwiftUI
import KinopoiskAPI

final class FilmCardViewModel: ObservableObject {
    @Published var filmDetails: Film?
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

    func fetchFilmDetails(filmId: Int) {
        Task { @MainActor in
            isLoading = true
            errorMessage = nil
            
            do {
                let result = try await FilmsAPI.apiV22FilmsIdGet(
                    id: filmId,
                    apiConfiguration: OpenAPIClientAPIConfiguration(customHeaders: ["X-API-KEY": "134aebc6-5099-4a05-9579-b3f47f482aaa"])
                )
                self.filmDetails = result
            } catch {
                self.errorMessage = "Ошибка загрузки: \(error.localizedDescription)"
            }
            
            isLoading = false
        }
    }
}
