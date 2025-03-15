//
//  FilmDescriptionView.swift
//  otus_hw2
//
//  Created by Иван on 22.02.2025.
//

import SwiftUI
import KinopoiskAPI

struct FilmDescriptionView: View {
    let film: Film
       @Environment(\.presentationMode) var presentationMode

       var body: some View {
           VStack {
               HStack {
                   Spacer()
                   Button(action: {
                       presentationMode.wrappedValue.dismiss()
                   }) {
                       Image(systemName: "xmark.circle.fill")
                           .resizable()
                           .frame(width: 30, height: 30)
                           .foregroundColor(.gray)
                   }
                   .padding()
               }

               ScrollView {
                   VStack(alignment: .leading, spacing: 10) {
                       Text(film.nameRu ?? film.nameOriginal ?? "Без названия")
                           .font(.title)
                           .bold()
                           .padding(.bottom, 10)

                       Text(film.description ?? "Описание отсутствует")
                           .font(.body)
                           .padding()

                       Spacer()
                   }
                   .padding()
               }
           }
           .background(Color.white)
           .edgesIgnoringSafeArea(.all)
       }
   }
