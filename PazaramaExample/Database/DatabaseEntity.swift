//
//  DatabaseEntity.swift
//  PazaramaExample
//
//  Created by Talip on 24.06.2023.
//

import Foundation

protocol DatabaseEntity: Decodable {
    /// The table name entity has connected
    static var entityIdentifier: String { get }
}
