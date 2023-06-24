//
//  DatabaseError.swift
//  PazaramaExample
//
//  Created by Talip on 24.06.2023.
//

import Foundation

enum DatabaseError: Error {
    case fetch(description: String)
    case emptyData

    var reason: String {
        switch self {
        case .fetch(let description):
            return description
        case .emptyData:
            return "There is no collection"
        }
    }
}
