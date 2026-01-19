//
//  AddBuildingView.swift
//  CleanTrack2.0
//
//  Created by Jose Flores on 2026-01-09.
//

import SwiftUI

struct AddBuildingView2: View {
    @Environment(\.presentationMode) var presentationMode

    @State private var name = ""
    @State private var alarmCode = ""
    @State private var address = ""
    @State private var contact = ""

    // Callback to send the new building back to HomeView
    var onSave: ((Building) -> Void)?

    // Dependency to save a building (injected)
    let saver: BuildingSaving

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Building Info")) {
                    TextField("Name", text: $name)
                    TextField("Alarm Code", text: $alarmCode)
                    TextField("Address", text: $address)
                    TextField("Contact", text: $contact)
                }
            }
            .navigationTitle("Add Building")
            .navigationBarItems(
                leading: Button("Cancel") {
                    presentationMode.wrappedValue.dismiss()
                },
                trailing: Button("Save") {
                    let newBuilding = Building(name: name, alarmCode: alarmCode, address: address, contact: contact)
                    saver.save(newBuilding)      // Save building using injected service
                    onSave?(newBuilding)         // Add building to local list
                    presentationMode.wrappedValue.dismiss()
                }
                .disabled(name.isEmpty || alarmCode.isEmpty || address.isEmpty || contact.isEmpty)
            )
        }
    }
}

#Preview {
    AddBuildingView2(onSave: { _ in }, saver: MockBuildingSaver())
}
