//
//  MainViewModel.swift
//  GetACocktail
//
//  Created by unkn0wn on 6/15/23.
//

import Foundation
import SwiftUI

class MainViewModel: ObservableObject {
    func textColor(_ scheme: ColorScheme) -> Color {
        let selectedScheme = scheme
        switch selectedScheme {
        case .light:
            return .black
        case .dark:
            return .white
        @unknown default:
            return .green
        }
    }
    
    func shadowColor(_ scheme: ColorScheme) -> Color {
        let selectedScheme = scheme
        switch selectedScheme {
        case .light:
            return .white
        case .dark:
            return .black
        @unknown default:
            return .green
        }
    }
}
