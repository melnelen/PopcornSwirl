//
//  URLSessionProtocol.swift
//  PopcornSwirl
//
//  Created by Alexandra Ivanova on 20/06/2024.
//

import Foundation

protocol URLSessionProtocol {
    func data(from url: URL) async throws -> (Data, URLResponse)
}

extension URLSession: URLSessionProtocol {
    func data(from url: URL) async throws -> (Data, URLResponse) {
        return try await self.data(from: url, delegate: nil)
    }
}
