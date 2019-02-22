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
        configureWatchWithData()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func configureWatchWithData() {
        let festData = UserDefaults.standard.string(forKey: "festData")
        let dataFromString = festData?.data(using: .utf8, allowLossyConversion: false) ?? Data.init()
        if let json = try? JSON(data: dataFromString) {
            if let name = json["name"].string {
                self.label.setText(name)
            }
            loadTableData(data: json)
        }
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        let jsonString = message["result"] as! String
        UserDefaults.standard.set(jsonString, forKey: "festData")
        
        let dataFromString = jsonString.data(using: .utf8, allowLossyConversion: false) ?? Data.init()
        
        configureWatchWithData();
    }
    
    func formatTime(time: Int) -> String {
        let date = convertMilliToDate(milliseconds: time)
        let df = DateFormatter()
        df.dateFormat = "MMM dd, h:mm a"
        return df.string(from: date)
    }
    
    func convertMilliToDate(milliseconds: Int) -> Date {
        return Date(timeIntervalSince1970: (TimeInterval(milliseconds) / 1000))
    }
    
    func loadTableData(data: JSON) {
        let events = data["events"]
        tableView.setNumberOfRows(events.count, withRowType: "PerformerTableRow")
        var i = 0
        var timeObjects = Array<String>();
        for event in events {
            if let name = event.1["name"].string {
                    if let row = tableView.rowController(at: i) as? PerformerTableRow {
                        if let milli = event.1["startsAt"].string {
                            let time = formatTime(time: Int(milli) ?? 0)
                            row.artistWithTimeLabel.setText(time+" "+name)
                            timeObjects.append(milli);
                        } else {
                            row.artistWithTimeLabel.setText("TBD"+" "+name)
                            timeObjects.append("0");
                        }
                        i += 1
                    }
            }
        }
    }
}
