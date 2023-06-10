//
//  Coordinator.swift
//  LoginScreen
//
//  Created by unkn0wn on 3/6/23.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    
    var childCoordinators: [Coordinator] { get }
    
    var navigationController: UINavigationController { get set }
    
    func startCoordinator()
    
}
