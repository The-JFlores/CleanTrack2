//
//  SwiftUIView.swift
//  CleanTrack2.0
//
//  Created by Jose Flores on 2026-01-09.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var errorMessage = ""
    @State private var isShowingRegister = false
    @State private var isLoading = false

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Login")
                    .font(.largeTitle)
                    .bold()

                TextField("Email", text: $email)
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(8)

                SecureField("Password", text: $password)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(8)

                if !errorMessage.isEmpty {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                }

                Button(action: {
                    login()
                }) {
                    if isLoading {
                        ProgressView()
                    } else {
                        Text("Log In")
                            .bold()
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
                .disabled(isLoading)

                Spacer()

                NavigationLink(destination: RegisterView(), isActive: $isShowingRegister) {
                Button("Create Account") {
                        isShowingRegister = true
                    }
                }
            }
            .padding()
        }
    }

    func login() {
        isLoading = true
        errorMessage = ""

        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            isLoading = false
            if let error = error {
                errorMessage = error.localizedDescription
            } else {
                // Login successful
                // Aquí puedes navegar a la pantalla principal
                print("User logged in: \(result?.user.email ?? "")")
            }
        }
    }
}

#Preview {
    LoginView()
}
