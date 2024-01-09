//
//  DetailView.swift
//  SwiftUICoordinator
//
//  Created by GIGL-MAC on 09/01/2024.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject private var coordinator: Coordinator
    let profile: Profile

    var body: some View {
        VStack {
            Text("Hello \(profile.name)")
            Spacer()
                .frame(height: 20)
            Button("Present ☕️") {
                coordinator.pop()
            }
        }
        .toolbar(.hidden)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(profile: Profile(name: "K"))
    }
}
