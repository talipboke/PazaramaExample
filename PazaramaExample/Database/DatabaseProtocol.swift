//
//  DatabaseProtocol.swift
//  PazaramaExample
//
//  Created by Talip on 24.06.2023.
//

import Foundation

protocol DatabaseProtocol {
    func fetchAll<M: DatabaseEntity>(entityType: M.Type, completion: @escaping (Result<[M], DatabaseError>) -> Void)
}
