//
//  InterfaceController.swift
//  festy WatchKit Extension
//
//  Created by John on 1/22/19.
//  Copyright © 2019 JohnOttenlips. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity
import SwiftyJSON

class InterfaceController: WKInterfaceController, WCSessionDelegate {
    
    @IBOutlet weak var tableView: WKInterfaceTable!
    @IBOutlet weak var label: WKInterfaceLabel!
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
    }
    
    override func willActivate() {
        super.willActivate()

        if (WCSession.isSupported()) {
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        let jsonString = message["result"] as! String
        UserDefaults.standard.set(jsonString, forKey: "festData") //String
        
        let festData = UserDefaults.standard.string(forKey: "festData")

        let dataFromString = jsonString.data(using: .utf8, allowLossyConversion: false) ?? Data.init()
        
        if let json = try? JSON(data: dataFromString) {
            if let name = json["name"].string {
                self.label.setText(name)
            }
            loadTableData(data: json)
        }
    }
    
    
    func loadTableData(data: JSON) {
        // Set total row count. Remember our identifier was Cell
        let performers = data["performers"]
        let eventsCount = data["eventsCount"].int ?? 0
        tableView.setNumberOfRows(eventsCount, withRowType: "PerformerTableRow")
        
        var i = 0
        for performer in performers {
            if let row = tableView.rowController(at: i) as? PerformerTableRow {
                if let performerName = performer.1["name"].string {
                    row.artistWithTimeLabel.setText(performerName)
                        if let performerEvents = performer.1["events"] {

                        }
                }
            }
            i += 1;// Move onto the next item
        }
    }
    

}
