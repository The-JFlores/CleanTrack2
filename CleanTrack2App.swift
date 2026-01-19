//
//  CleanTrack2_0App.swift
//  CleanTrack2.0
//
//  Created by Jose Flores on 2026-01-09.
//

import SwiftUI
import Firebase

@main
struct CleanTrack2_0App: App {
    
    // Init Firebase once when app launches
      init() {
          FirebaseApp.configure()
      }
    
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}

