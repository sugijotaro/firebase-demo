//
//  UserDataStore.swift
//  firebase-demo
//
//  Created by JotaroSugiyama on 2023/01/28.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

struct User: Codable {
    let displayName: String
    let createdTime: Date?
    let uid: String

    enum CodingKeys: String, CodingKey {
        case displayName = "display_name"
        case createdTime = "created_time"
        case uid
    }
}

final class UserDataStore{
    
}

