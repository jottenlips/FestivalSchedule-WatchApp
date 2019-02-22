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
        let festData = UserDefaults.standard.string(forKey: "festData")
        let dataFromString = festData?.data(using: .utf8, allowLossyConversion: false) ?? Data.init()
        if let json = try? JSON(data: dataFromString) {
            if let name = json["name"].string {
                self.label.setText(name)
            }
            loadTableData(data: json)
        }
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
        

        let dataFromString = jsonString.data(using: .utf8, allowLossyConversion: false) ?? Data.init()
        
        if let json = try? JSON(data: dataFromString) {
            if let name = json["name"].string {
                self.label.setText(name)
            }
            loadTableData(data: json)
        }
    }
    
    func formatTime(time: Int) -> String {
        let date = convertMilliToDate(milliseconds: time)
        let df = DateFormatter()
        df.dateFormat = "dd H:m"
        return df.string(from: date)
    }
    
    func convertMilliToDate(milliseconds: Int) -> Date {
        return Date(timeIntervalSince1970: (TimeInterval(milliseconds) / 1000))
    }
    
    func loadTableData(data: JSON) {
        // Set total row count. Remember our identifier was Cell
        let performers = data["performers"]
        let events = data["events"]
        tableView.setNumberOfRows(events.count, withRowType: "PerformerTableRow")
        var i = 0

        for event in events {
            if let name = event.1["name"].string {
                    if let row = tableView.rowController(at: i) as? PerformerTableRow {
                        if let milli = event.1["startsAt"].string {
                            let time = formatTime(time: Int(milli) ?? 0)
                            row.artistWithTimeLabel.setText(time+" "+name)
                        }
                    }
                i += 1
            }
        }
    }
}
