//
//  Coordinator.swift
//  SwiftUICoordinator
//
//  Created by GIGL-MAC on 03/01/2024.
//

import SwiftUI

//enum Page: String, Identifiable {
//    case apple, banana, carrot
//
//    var id: String {
//        self.rawValue
//    }
//}
//
//enum Sheet: String, Identifiable {
//    case lemon
//
//    var id: String {
//        self.rawValue
//    }
//}
//
//enum FullScreenCover: String, Identifiable {
//    case olive
//
//    var id: String {
//        self.rawValue
//    }
//}
//
//
//class Coordinator: ObservableObject {
//    @Published var path = NavigationPath()
//    @Published var sheet: Sheet?
//    @Published var fullScreenCover: FullScreenCover?
//
//    func push(_ page: Page) {
//        path.append(page)
//    }
//
//    func present(_ sheet: Sheet) {
//        self.sheet = sheet
//    }
//
//    func present(fullScreenCover: FullScreenCover) {
//        self.fullScreenCover = fullScreenCover
//    }
//
//    func pop(){
//        path.removeLast()
//    }
//
//    func popToRoot(){
//        path.removeLast(path.count)
//    }
//
//    func dismissSheet(){
//        self.sheet = nil
//    }
//
//    func dismissFullScreenCover(){
//        self.fullScreenCover = nil
//    }
//
//    @ViewBuilder
//    func build(page: Page) -> some View {
//        switch page {
//        case .apple:
//            AppleView()
//        case .banana:
//            BananaView()
//        case .carrot:
//            CarrotView()
//        }
//    }
//
//    @ViewBuilder
//    func build(sheet: Sheet) -> some View {
//        switch sheet {
//        case .lemon:
//            NavigationStack {
//                LemonView()
//            }
//        }
//    }
//
//    @ViewBuilder
//    func build(fullScreenCover: FullScreenCover) -> some View {
//        switch fullScreenCover {
//        case .olive:
//            NavigationStack {
//                OliveView()
//            }
//        }
//    }
//}

enum Page: Hashable, Equatable, Identifiable {
    case apple, banana, carrot
    case detail(profile: Profile)
    
    var id: String {
        switch self {
        case .apple:
            return "apple"
        case .banana:
            return "banana"
        case .carrot:
            return "carrot"
        case .detail:
            return "detail"
        }
    }
}

enum Sheet: Hashable, Equatable, Identifiable {
    case lemon
    
    var id: String {
        "lemon"
    }
}

enum FullScreenCover: Hashable, Equatable, Identifiable {
    case olive
    
    var id: String {
        "olive"
    }
}


class Coordinator: ObservableObject {
    @Published var path = NavigationPath()
    @Published var sheet: Sheet?
    @Published var fullScreenCover: FullScreenCover?

    func push(_ page: Page) {
        path.append(page)
    }
    
    func present(_ sheet: Sheet) {
        self.sheet = sheet
    }
    
    func present(fullScreenCover: FullScreenCover) {
        self.fullScreenCover = fullScreenCover
    }
    
    func pop(){
        path.removeLast()
    }
    
    func popToRoot(){
        path.removeLast(path.count)
    }
    
    func dismissSheet(){
        self.sheet = nil
    }
    
    func dismissFullScreenCover(){
        self.fullScreenCover = nil
    }
    
    @ViewBuilder
    func build(page: Page) -> some View {
        switch page {
        case .apple:
            AppleView()
        case .banana:
            BananaView()
        case .carrot:
            CarrotView()
        case .detail(let profile):
            DetailView(profile: profile)
        }
    }
    
    @ViewBuilder
    func build(sheet: Sheet) -> some View {
        switch sheet {
        case .lemon:
            NavigationStack {
                LemonView()
            }
        }
    }
    
    @ViewBuilder
    func build(fullScreenCover: FullScreenCover) -> some View {
        switch fullScreenCover {
        case .olive:
            NavigationStack {
                OliveView()
            }
        }
    }
}

struct Profile: Hashable, Equatable {
    let name: String
}
