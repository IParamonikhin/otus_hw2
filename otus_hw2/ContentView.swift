//
//  ContentView.swift
//  otus_hw2
//
//  Created by Иван on 22.02.2025.
//

import SwiftUI
import SUINavigation
import KinopoiskAPI

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
                .onChange(of: selectedCategory) { newCategory in
                    viewModel.fetch(category: newCategory, page: 1) 
                }
                
                List {
                    ForEach(viewModel.films, id: \.kinopoiskId) { film in
                        FilmCell(film: film, isFlying: flyingFilmId == film.kinopoiskId) {
                            withAnimation(.easeInOut(duration: 0.6)) {
                                flyingFilmId = film.kinopoiskId
                                isAnimating = true
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                                filmId = film.kinopoiskId
                                flyingFilmId = nil
                                isAnimating = false
                            }
                        }
                        .onAppear {
                            if film == viewModel.films.last {
                                viewModel.fetch(category: selectedCategory, page: viewModel.page)
                            }
                        }
                    }
                }
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
