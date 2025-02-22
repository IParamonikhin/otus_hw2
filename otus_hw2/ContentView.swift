//
//  ContentView.swift
//  otus_hw2
//
//  Created by Иван on 22.02.2025.
//

import SwiftUI
import Foundation
import KinopoiskAPI
import SUINavigation

struct ContentView: View {
    
    @StateObject var viewModel = FilmListViewModel()
    @State var filmId: Int?
    @State private var flyingFilmId: Int?
    @State private var isAnimating = false
    @State private var selectedCategory: FilmsAPI.ModelType_apiV22FilmsCollectionsGet = .topPopularAll
    
    var body: some View {
        NavigationStorageView {
            VStack {
                Picker("Категория", selection: $selectedCategory) {
                    Text("Популярные").tag(FilmsAPI.ModelType_apiV22FilmsCollectionsGet.topPopularAll)
                    Text("Популярные фильмы").tag(FilmsAPI.ModelType_apiV22FilmsCollectionsGet.top250Movies)
                    Text("Популярные сериалы").tag(FilmsAPI.ModelType_apiV22FilmsCollectionsGet.top250TvShows)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                List(viewModel.films) { film in
                    FilmCell(film: film, isFlying: flyingFilmId == film.kinopoiskId) {
                        flyingFilmId = film.kinopoiskId
                        isAnimating = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                            filmId = film.kinopoiskId
                            flyingFilmId = nil
                        }
                    }
                    .onAppear {
                        if viewModel.films.needToLoad(item: film) {
                            viewModel.fetch(category: selectedCategory)
                        }
                    }
                }
            }

            .onChange(of: selectedCategory) { _ in
                viewModel.fetch(category: selectedCategory)
            }
            .navigationTitle(selectedCategory.displayName)
            .navigationAction(item: $filmId) { id in
                FilmCardView(filmId: id)
            }
            .onAppear {
                viewModel.fetch(category: selectedCategory)
            }
        }
        
    }
}


#Preview {
    ContentView()
}
