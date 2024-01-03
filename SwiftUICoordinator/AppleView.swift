//
//  AppleView.swift
//  SwiftUICoordinator
//
//  Created by Alex Nagy on 29.01.2023.
//

import SwiftUI

struct AppleView: View {
    @State var amount = 1
    @EnvironmentObject private var coordinator: Coordinator
    
    var body: some View {
        List {
            Button("Push 🍌") {
                amount += 1
                coordinator.push(.banana)
            }
            Button("Present 🍋") {
                coordinator.present(.lemon)
            }
            Button("Present 🫒") {
                coordinator.present(fullScreenCover: .olive)
            }
        }
        .navigationTitle("🍎")
        .onAppear{
            print("see amount \($amount)")
        }
    }
}

struct AppleView_Previews: PreviewProvider {
    static var previews: some View {
        AppleView()
    }
}
