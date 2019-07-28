//
//  ViewController.swift
//  TextTransformer
//
//  Created by taco on 7/28/19.
//  Copyright © 2019 tacoTruck. All rights reserved.
// https://www.youtube.com/watch?v=ii89L7LVAs4

//SEE INFO.PLIST APPLICATION IS AGENT (YES) TO MAKE APP HIDE FROM DOCK
import Cocoa

class ViewController: NSViewController, NSTextFieldDelegate {
    
    @IBOutlet var input: NSTextField!
    @IBOutlet var type: NSSegmentedControl!
    @IBOutlet var output: NSTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        typeChanged(self)
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    func controlTextDidChange(_ obj: Notification) {
        typeChanged(self)
    }

    @IBAction func typeChanged(_ sender: Any) {
        switch type.selectedSegment {
        case 0:
            output.stringValue = rot13(input.stringValue)
        case 1:
            output.stringValue = similar(input.stringValue)
        case 2:
            output.stringValue = strike(input.stringValue)
        default:
            output.stringValue = zalgo(input.stringValue)
        }
    }
    
    @IBAction func copyToPasteboard(_ sender: Any) {
    }
    
    func rot13(_ input: String) -> String {
        return "ROT13: " + input
    }
    
    func similar(_ input: String) -> String {
        return "Similar: " + input
    }
    
    func strike(_ input: String) -> String {
        return "Strike: " + input
    }
    
    func zalgo(_ input: String) -> String {
        return "Zalgo: " + input
    }
}

