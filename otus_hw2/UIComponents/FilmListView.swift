//
//  FilmListView.swift
//  otus_hw2
//
//  Created by Иван on 02.03.2025.
//

import SwiftUI
import KinopoiskAPI
import SUINavigation

struct FilmListView: View {
    @StateObject private var store = FilmStore.shared
    @EnvironmentObject var mediator: FilmMediator
    @State private var filmId: Int?
    @State private var flyingFilmId: Int?
    @State private var isAnimating = false

    var body: some View {
        NavigationStorageView {
            VStack {
                CategoryPicker(selectedCategory: $mediator.selectedCategory)
                    .onChange(of: mediator.selectedCategory) { newCategory in
                        store.fetchFilms(category: newCategory, page: 1)
                    }

                FilmList(store: store, filmId: $filmId, flyingFilmId: $flyingFilmId, isAnimating: $isAnimating, selectedCategory: $mediator.selectedCategory)
            }
            .navigationTitle(mediator.selectedCategory.displayName)
            .navigationAction(item: $filmId) { id in
                FilmCardView(filmId: id)
            }
            .onAppear {
                store.fetchFilms(category: mediator.selectedCategory) 
            }
        }
    }
}

// MARK: - Category Picker
struct CategoryPicker: View {
    @Binding var selectedCategory: FilmsAPI.ModelType_apiV22FilmsCollectionsGet
    
    var body: some View {
        Picker("Категория", selection: $selectedCategory) {
            Text("Популярные").tag(FilmsAPI.ModelType_apiV22FilmsCollectionsGet.topPopularAll)
            Text("Популярные фильмы").tag(FilmsAPI.ModelType_apiV22FilmsCollectionsGet.top250Movies)
            Text("Популярные сериалы").tag(FilmsAPI.ModelType_apiV22FilmsCollectionsGet.top250TvShows)
        }
        .pickerStyle(SegmentedPickerStyle())
        .padding()
    }
}

struct FilmList: View {
    @ObservedObject var store: FilmStore
    @Binding var filmId: Int?
    @Binding var flyingFilmId: Int?
    @Binding var isAnimating: Bool
    @Binding var selectedCategory: FilmsAPI.ModelType_apiV22FilmsCollectionsGet

    var body: some View {
        List {
            ForEach(store.films, id: \.kinopoiskId) { film in
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
                    if store.films.needToLoad(item: film) {
                        store.fetchFilms(category: selectedCategory, page: store.page)
                    }
                }
            }
        }
    }
}

#Preview {
    FilmListView()
}
