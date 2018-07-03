//
//  ViewController.swift
//  OnTrack
//
//  Created by Patrick Ma on 7/3/18.
//  Copyright © 2018 fivetwentysix. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    @IBOutlet var textField: NSTextField!
    @IBOutlet var table: NSTableView!
    var list: [String]!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.list = []
        self.table.delegate = self as? NSTableViewDelegate
        self.table.dataSource = self
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    override func controlTextDidEndEditing(_ obj: Notification) {
        if !textField.stringValue.isEmpty {
            list.append(textField.stringValue)
            reloadData()
        }
        textField.stringValue = ""
    }
    
    func reloadData() {
        table.reloadData();
    }
}

extension ViewController: NSTableViewDataSource{
    func numberOfRows(in tableView: NSTableView) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
        var result:NSTableCellView
        result  = tableView.makeView(withIdentifier: (tableColumn?.identifier)!, owner: self) as! NSTableCellView
        if (tableColumn?.title == "Task") {
            result.textField!.stringValue = list[row]
            return result
        } else {
            result.textField!.stringValue = list[row]
            return result
        }
    }
}
