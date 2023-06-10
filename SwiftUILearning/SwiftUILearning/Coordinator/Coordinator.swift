//
//  Coordinator.swift
//  SwiftUILearning
//
//  Created by unkn0wn on 3/7/23.
//

import Foundation
import SwiftUI

@MainActor
final class Coordinator: ObservableObject {
    
    @Published var path = NavigationPath()
    @Published var mySheet: MySheet?
    
    @State var emailID: String = ""
    @State var password: String = ""
    @State var isDisplayed: Bool = false
    
    var data: String = ""
    
    @ViewBuilder
    func getPage(page: MyPage) -> some View {
        switch page {
            case .home:
                ContentView(emailID: $emailID, password: $password)
                    .environmentObject(UserInfo())
            case .list:
                ListScreen(viewModel: EmployeeViewModel(networkable: NetworkManager()))
            case .grid:
                GridView()
            case .details:
                DetailsScreen(detailTitle: self.data)
            case .imageDisplay:
                ImageDisplayView()
            default:
                GridView()
        }
    }
    
    @ViewBuilder
    func getSheet(sheet: MySheet) -> some View {
        switch sheet {
        case .imageDisplay:
            ImageDisplayView()
        case .presentedView:
            PresentedView(isShown: $isDisplayed, titleName: $emailID)
        }
    }
    
    func navigateToListScreen() {
        path.append(MyPage.list)
    }
    
    func navigateToGridView() {
        path.append(MyPage.grid)
    }
    
    func navigateToDetailsScreen(data: Employee) {
        self.data = data.firstName
        path.append(MyPage.details)
    }
    
    func presentImageDisplayScreen() {
        mySheet = MySheet.imageDisplay
    }
    
    func presentPresentedView() {
        mySheet = MySheet.presentedView
    }
    
}

enum MyPage: String, CaseIterable, Identifiable {
    case home
    case list
    case grid
    case details
    case imageDisplay
    case presentedView
    
    var id: String { self.rawValue }
}

enum MySheet: String, CaseIterable, Identifiable {
    
    case imageDisplay
    case presentedView
    
    var id: String { self.rawValue }
}
