//
//  DataFetchPhrase.swift
//  PopcornSwirl
//
//  Created by Alexandra Ivanova on 07/06/2024.
//

import Foundation

enum DataFetchPhase<V> {
    
    case empty
    case success(V)
    case failure(Error)
    
    var value: V? {
        if case .success(let value) = self {
            return value
        }
        return nil
    }
    
}
