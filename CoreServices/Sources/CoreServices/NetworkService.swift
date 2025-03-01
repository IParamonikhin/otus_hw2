//
//  NetworkService.swift
//  otus_hw2
//
//  Created by Иван on 01.03.2025.
//

import Foundation

public protocol NetworkServiceProtocol {
    func fetchData(from url: URL) async throws -> Data
}
// MARK: - Сетевой сервис
public final class NetworkService: NetworkServiceProtocol {
    public init() {}
    public func fetchData(from url: URL) async throws -> Data {
        let (data, _) = try await URLSession.shared.data(from: url)
        return data
    }
}
