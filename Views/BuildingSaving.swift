//
//  BuildingSaving.swift
//  CleanTrack2.0
//
//  Defines a protocol for saving Building entities so that views can depend on abstractions.
//

import Foundation

protocol BuildingSaving {
    func save(_ building: Building)
}
