//
//  FireStoreService.swift
//  PazaramaExample
//
//  Created by Talip on 24.06.2023.
//

import Foundation
import FirebaseFirestore

final class FirestoreService: DatabaseProtocol {
    private let database: Firestore
    
    init(database: Firestore = Firestore.firestore()) {
        self.database = database
    }
    
    func fetchAll<M: DatabaseEntity>(entityType: M.Type, completion: @escaping (Result<[M], DatabaseError>) -> Void) {
        database.collection(entityType.entityIdentifier).getDocuments { snapshot, error in
            if let error = error as? NSError {
                completion(.failure(.fetch(description: error.localizedDescription)))
                return
            } else {
                guard let documents = snapshot?.documents else {
                    completion(.failure(.emptyData))
                    return
                }
                
                let list = documents.compactMap { document -> M? in
                    return try? document.data(as: entityType)
                }
                completion(.success(list))
            }
        }
    }
}
