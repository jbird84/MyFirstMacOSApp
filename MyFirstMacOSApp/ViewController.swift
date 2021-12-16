//
//  ViewController.swift
//  MyFirstMacOSApp
//
//  Created by Kinney Kare on 12/15/21.
//

import Cocoa

class ViewController: NSViewController, NSTableViewDelegate, NSTableViewDataSource {

    @IBOutlet weak var personName: NSTextField!
    @IBOutlet weak var personAge: NSTextField!
    @IBOutlet weak var tableView: NSTableView!
    
    var sample = Person.getSampleData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return sample.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        if tableColumn?.identifier == NSUserInterfaceItemIdentifier(rawValue: "Name") {
            let cellIdentifier = NSUserInterfaceItemIdentifier(rawValue: "nameCell")
            guard let cellView = tableView.makeView(withIdentifier: cellIdentifier, owner: self) as? NSTableCellView else {return nil}
        cellView.textField?.stringValue = sample[row].name
            return cellView
        } else if tableColumn?.identifier == NSUserInterfaceItemIdentifier(rawValue: "Age") {
            let cellIdentifier = NSUserInterfaceItemIdentifier(rawValue: "ageCell")
            guard let cellView = tableView.makeView(withIdentifier: cellIdentifier, owner: self) as? NSTableCellView else {return nil}
            cellView.textField?.integerValue = sample[row].age
            return cellView
        }
        return nil
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    
    @IBAction func addButtonTapped(_ sender: Any) {
        
        let newName = personName.stringValue
        let newAge = personAge.integerValue
        
        sample.append(Person.init(name: newName, age: newAge))
        tableView.reloadData()
    }
    

}

