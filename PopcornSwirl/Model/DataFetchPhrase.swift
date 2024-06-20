//
//  DataFetchPhrase.swift
//  PopcornSwirl
//
//  Created by Alexandra Ivanova on 07/06/2024.
//

import Foundation

enum DataFetchPhase<V: Equatable & EmptyData>: Equatable {
    case empty
    case success(V)
    case failure(Error)
    
    static func ==(lhs: DataFetchPhase<V>, rhs: DataFetchPhase<V>) -> Bool {
        switch (lhs, rhs) {
        case (.empty, .empty):
            return true
        case (.success(let lhsValue), .success(let rhsValue)):
            return lhsValue == rhsValue
        case (.failure(let lhsError as NSError), .failure(let rhsError as NSError)):
            return lhsError == rhsError
        default:
            return false
        }
    }
    
    var value: V? {
        if case .success(let value) = self {
            return value
        }
        return nil
    }
}
