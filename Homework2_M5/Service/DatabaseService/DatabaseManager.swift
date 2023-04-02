//
//  DatabaseManager.swift
//  Homework2_M5
//
//  Created by Aziza A on 29/3/23.
//

import Foundation
import FirebaseCore
import FirebaseFirestore
 
class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    private let db = Firestore.firestore()
    
    private init() {}
    
    public func setTo(collection: String, document: String, withData data: [String: Any]) {
        db.collection(collection)
            .document(document)
            .setData(data) { err in
                if let err = err {
                    print("Error writing document: \(err)")
                } else {
                    print("Document successfully written!")
                }
            }
    }
    
    public func readFrom(collection: String, document: String) {
        let docRef = db.collection(collection).document(document)
        
        docRef.getDocument{ (document, error) in
            if let document = document, document.exists {
                let dataDescripton = document.data().map(String.init(describing:)) ?? "nil"
                print("Document data: \(dataDescripton)")
            } else {
                print("Document does not exist")
            }
        }
    }
    
    public func deleteFrom(collection: String, document: String) {
        db.collection(collection).document(document).delete()
    }
}
