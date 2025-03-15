//
//  ItemModifier.swift
//  otus_hw2
//
//  Created by Иван on 22.02.2025.
//

import Foundation
import SwiftUI

struct ItemModifier: ViewModifier {
    let isLoading: Bool

    func body(content: Content) -> some View {
        if isLoading {
            VStack {
                content
                HStack {
                    Spacer()
                    ProgressView()
                    Spacer()
                }
            }
        } else {
            content
        }
    }
}
