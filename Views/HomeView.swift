//
//  HomeView.swift
//  CleanTrack2.0
//
//  Created by Jose Flores on 2026-01-09.
//

import SwiftUI
import FirebaseDatabase

struct HomeView: View {
    @State private var buildings = [
        Building(name: "Edificio 1", alarmCode: "1234", address: "Calle 1", contact: "cliente1@mail.com"),
        Building(name: "Edificio 2", alarmCode: "5678", address: "Calle 2", contact: "cliente2@mail.com"),
        Building(name: "Edificio 3", alarmCode: "9101", address: "Calle 3", contact: "cliente3@mail.com")
    ]

    @State private var showAddBuilding = false

    let saver = MockBuildingSaver()  // aquí el mock

    var body: some View {
        NavigationView {
            List(buildings, id: \.self) { building in
                VStack(alignment: .leading) {
                    Text(building.name).font(.headline)
                    Text("Alarm Code: \(building.alarmCode)")
                    Text("Address: \(building.address)")
                    Text("Contact: \(building.contact)")
                }
                .padding(.vertical, 5)
            }
            .navigationTitle("Buildings Today")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showAddBuilding = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddBuilding) {
                AddBuildingView2(onSave: { newBuilding in
                    buildings.append(newBuilding)
                }, saver: saver)  // aquí pasas el mock
            }
        }
    }
}

#Preview {
    HomeView()
}


