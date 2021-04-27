//
//  AppDelegate.swift
//  GetMeCab
//
//  Created by Yogesh on 01/03/21.
//  Copyright © 2021 Yogesh Aherwar. All rights reserved.
//

import UIKit
import Swinject
import SwinjectStoryboard
import GoogleMaps
import GooglePlaces

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    public var interModuleContainer: Container!
    public var assembler: Assembler!
    let googleAPIKey = "" //add your google API key here
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        GMSServices.provideAPIKey(googleAPIKey)
        GMSPlacesClient.provideAPIKey(googleAPIKey)
        interModuleContainer = Container()
        assembler = Assembler([AppAssembly(interModuleContainer)])
        setViewController()
        return true
    }

    func setViewController() {
        var storyboard : SwinjectStoryboard
        storyboard = SwinjectStoryboard.create(name: "Main", bundle: nil, container: interModuleContainer)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ViewController")
        self.window?.rootViewController = viewController
        self.window?.makeKeyAndVisible()
    }
}
