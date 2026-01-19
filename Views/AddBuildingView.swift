//
//  AddBuildingView.swift
//  CleanTrack2.0
//
//  Created by Jose Flores on 2026-01-09.
//

import SwiftUI
import FirebaseDatabase

struct AddBuildingView: View {
    @Environment(\.presentationMode) var presentationMode

    @State private var name = ""
    @State private var alarmCode = ""
    @State private var address = ""
    @State private var contact = ""

    // Function to save building data to Firebase Realtime Database
    func saveBuilding(_ building: Building) {
        let ref = Database.database().reference()
        ref.child("buildings").child(building.id).setValue(building.toDictionary())
    }

    // Callback to send the new building back to HomeView
    var onSave: ((Building) -> Void)?

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
                    saveBuilding(newBuilding)      // Save building to Firebase
                    onSave?(newBuilding)           // Add building to local list
                    presentationMode.wrappedValue.dismiss()
                }
                .disabled(name.isEmpty || alarmCode.isEmpty || address.isEmpty || contact.isEmpty)
            )
        }
    }
}

struct AddBuildingView_Previews: PreviewProvider {
    static var previews: some View {
        AddBuildingView()
    }
}
