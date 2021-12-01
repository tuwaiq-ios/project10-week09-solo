//
//  ProfilButtonMenu.swift
//  ModerneShopping
//
//  Created by Hassan Yahya on 19/04/1443 AH.
//
import SwiftUI

/// Styling to the button in the profil view
struct ProfilButtonMenu: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.headline)
            .padding()
            .background(configuration.isPressed ? Color.tertiary : Color.secondaryBackground)
            .cornerRadius(12)
            .shadow(color: .accentColor.opacity(0.1), radius: 2, x: 0.5, y: 1)
    }
}
