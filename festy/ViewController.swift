//
//  ViewController.swift
//  festy
//
//  Created by John on 1/22/19.
//  Copyright © 2019 JohnOttenlips. All rights reserved.
//

import UIKit
import Apollo

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let apollo = configureApollo()
        loadData(apollo: apollo)
    }
    
    func configureApollo() -> ApolloClient {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = CONFIG_HEADERS;
        let url = URL(string: "https://api.aloompa.com/graphql")!
        let apollo = ApolloClient(networkTransport: HTTPNetworkTransport(url: url, configuration: configuration))
        apollo.cacheKeyForObject = { $0["id"] }
        return apollo;
    }
    
    func loadData(apollo: ApolloClient) {
        
        let watcher = apollo.watch(query: PerformersQuery()) { (result, error) in
            if let error = error {
                NSLog("Error while fetching query: \(error.localizedDescription)")
                return
            }
            
//            self.festapp = result?.data?.festapp
        }
    }


}

