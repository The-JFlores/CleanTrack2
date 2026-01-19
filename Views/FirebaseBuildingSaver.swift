//
//  FirebaseBuildingSaver.swift
//  CleanTrack2.0
//
//  Concrete implementation of BuildingSaving that writes to Firebase Realtime Database.
//

import Foundation
import FirebaseDatabase

struct FirebaseBuildingSaver: BuildingSaving {
    func save(_ building: Building) {
        let ref = Database.database().reference()
        ref.child("buildings").child(building.id).setValue(building.toDictionary())
    }
}
