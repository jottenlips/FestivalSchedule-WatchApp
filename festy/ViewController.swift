//
//  ViewController.swift
//  festy
//
//  Created by John on 1/22/19.
//  Copyright © 2019 JohnOttenlips. All rights reserved.
//

import UIKit
import Apollo
import WatchConnectivity
import PromiseKit

class ViewController: UIViewController, WCSessionDelegate {
    
    var festapp: PerformersQuery.Data.Festapp? {
        didSet {
        }
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
    
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    
    @IBAction func updateWatchData(_ sender: Any) {
        if (WCSession.isSupported()) {
            let session = WCSession.default
            session.delegate = self
            session.activate()
            if let json = self.festapp?.jsonObject {
            let stringifiedJson = jsonToString(json: json)
                    session.sendMessage(["result" : stringifiedJson], replyHandler:nil, errorHandler:nil)
            }
        }
    }
    
    func jsonToString(json: JSONObject) -> String {
        do {
            let data1 =  try JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions.prettyPrinted)
            let convertedString = String(data: data1, encoding: String.Encoding.utf8)
            return convertedString!
        } catch let myJSONError {
            print(myJSONError)
            return ""
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let 👩‍🚀 = configureApollo()
        loadData(apollo: 👩‍🚀)
    }
    
//    func parseFestappPerformers(performers: <PerformersQuery.Data.Festapp.Performers>) {
//
//    }
    
    func configureApollo() -> ApolloClient {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = CONFIG_HEADERS;
        let url = URL(string: "https://api.aloompa.com/graphql")!
        let 👩‍🚀 = ApolloClient(networkTransport: HTTPNetworkTransport(url: url, configuration: configuration))
        👩‍🚀.cacheKeyForObject = { $0["id"] }
        return 👩‍🚀;
    }
    
    var watcher: GraphQLQueryWatcher<PerformersQuery>?
    
    func loadData(apollo: ApolloClient) {
            watcher = apollo.watch(query: PerformersQuery()) { (result, error) in
                if let error = error {
                    NSLog("Error while fetching query: \(error.localizedDescription)")
                    return;
                }
                self.festapp = result?.data?.festapp;
            }
    }
}
