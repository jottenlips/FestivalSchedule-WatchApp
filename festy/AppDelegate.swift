//
//  AppDelegate.swift
//  festy
//
//  Created by John on 1/22/19.
//  Copyright © 2019 JohnOttenlips. All rights reserved.
//

import UIKit
import Apollo

// Change localhost to your machine's local IP address when running from a device
//let apollo = ApolloClient(url: URL(string: "http://localhost:9000/graphql")!)

let apollo: ApolloClient = {
    let configuration = URLSessionConfiguration.default
    // Add additional headers as needed
    configuration.httpAdditionalHeaders = CONFIG_HEADERS;
    
    let url = URL(string: "http://localhost:9000/graphql")!
    
    return ApolloClient(networkTransport: HTTPNetworkTransport(url: url, configuration: configuration))
}()

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        apollo.cacheKeyForObject = { $0["id"] }
        return true
    }
}
