//
//  MainCoordinator.swift
//  LoginScreen
//
//  Created by unkn0wn on 3/6/23.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController = UINavigationController()
    
    func startCoordinator() {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        vc.mainCoordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func navigateToListViewController() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let listVC = storyBoard.instantiateViewController(withIdentifier: "ListViewController") as! ListViewController
        listVC.mainCoordinator = self
        navigationController.pushViewController(listVC, animated: true)
    }
    
    func navigateToWebviewController() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let webVC = storyBoard.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
        webVC.mainCoordinator = self
        navigationController.pushViewController(webVC, animated: true)
    }
    
    func navigateToDetailsViewController(data: String) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = storyBoard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        detailVC.name = data
        detailVC.mainCoordinator = self
        navigationController.pushViewController(detailVC, animated: true)
    }
    
    func navigateToGridViewController() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let gridVC = storyBoard.instantiateViewController(withIdentifier: "GridViewController") as! GridViewController
        gridVC.mainCoordinator = self
        navigationController.pushViewController(gridVC, animated: true)
    }
    
}
