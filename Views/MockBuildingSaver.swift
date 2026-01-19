//
//  MockBuildingSaver.swift
//  CleanTrack2.0
//
//  Mock implementation of BuildingSaving for previews and tests.
//

import Foundation

struct MockBuildingSaver: BuildingSaving {
    func save(_ building: Building) {
        // No-op: used in previews to avoid touching Firebase
        print("MockBuildingSaver.save: \(building.name)")
    }
}
