//
//  URLSessionMock.swift
//  PopcornSwirl
//
//  Created by Alexandra Ivanova on 20/06/2024.
//

import Foundation

class MockURLSession: URLSessionProtocol {
    var data: Data?
    var error: Error?

    func data(from url: URL) async throws -> (Data, URLResponse) {
        if let error = error {
            throw error
        }
        let response = URLResponse(url: url, mimeType: nil, expectedContentLength: data?.count ?? 0, textEncodingName: nil)
        return (data ?? Data(), response)
    }
}
