//
//  Building.swift
//  CleanTrack2.0
//
//  Created by Jose Flores on 2026-01-09.
//

import Foundation
struct Building: Identifiable, Hashable {
    let id: String
    let name: String
    let alarmCode: String
    let address: String
    let contact: String

    // Initialize with default UUID string if no id is provided
    init(id: String = UUID().uuidString, name: String, alarmCode: String, address: String, contact: String) {
        self.id = id
        self.name = name
        self.alarmCode = alarmCode
        self.address = address
        self.contact = contact
    }

    // Convert Building to dictionary for Firebase
    func toDictionary() -> [String: Any] {
        return [
            "id": id,
            "name": name,
            "alarmCode": alarmCode,
            "address": address,
            "contact": contact
        ]
    }

    // Initialize Building from Firebase dictionary
    init?(from dictionary: [String: Any]) {
        guard let id = dictionary["id"] as? String,
              let name = dictionary["name"] as? String,
              let alarmCode = dictionary["alarmCode"] as? String,
              let address = dictionary["address"] as? String,
              let contact = dictionary["contact"] as? String else {
            return nil
        }
        self.id = id
        self.name = name
        self.alarmCode = alarmCode
        self.address = address
        self.contact = contact
    }
}
