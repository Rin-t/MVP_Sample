//
//  AppDelegate.swift
//  MVP_Sample
//
//  Created by Rin on 2022/02/12.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController(rootViewController: PokemonListViewController())
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        setup(navigationController: navigationController)
        return true
    }

    private func setup(navigationController: UINavigationController) {
        if #available(iOS 15.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            appearance.backgroundColor = .systemPink
            navigationController.navigationBar.standardAppearance = appearance
            navigationController.navigationBar.scrollEdgeAppearance = appearance
        } else {
            navigationController.navigationBar.barTintColor = .systemPink
        }
    }
}

