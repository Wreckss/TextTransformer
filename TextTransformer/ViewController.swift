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
    let zalgoCharacters = ZalgoCharacters()
    
    
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
        //clear whatever was previously in the pasteboard
        NSPasteboard.general.clearContents()
        //grab text from output field and copies to pasteboard
        NSPasteboard.general.setString(output.stringValue, forType: .string)
    }
    
    func rot13(_ input: String) -> String {
        return "ROT13: " + input
    }
    
    func similar(_ input: String) -> String {
        var output = input
        
        output = output.replacingOccurrences(of: "a", with: "а")
        output = output.replacingOccurrences(of: "e", with: "е")
        output = output.replacingOccurrences(of: "i", with: "і")
        output = output.replacingOccurrences(of: "o", with: "о")
        output = output.replacingOccurrences(of: "c", with: "с")
        
        output = output.replacingOccurrences(of: "A", with: "А")
        output = output.replacingOccurrences(of: "P", with: "Р")
        
        return output
    }
    
    func strike(_ input: String) -> String {
        var output = ""
        for letter in input {
            output.append(letter)
            
            output.append("\u{0335}")       //unicode string for strikethrough
        }
        return output
    }
    
    func zalgo(_ input: String) -> String {
        var output = ""
        
        for letter in input {
            output.append(letter)
            
            for _ in 1...Int.random(in: 1...8) {
                output.append(zalgoCharacters.above.randomElement())
            }
            
            for _ in 1...Int.random(in: 1...3) {
                output.append(zalgoCharacters.inline.randomElement())
            }
            
            for _ in 1...Int.random(in: 1...8) {
                output.append(zalgoCharacters.below.randomElement())
            }
        }
        
        return output
    }
}


extension String {
    mutating func append(_ str: String?) {
        guard let str = str else { return }
        append(str)
    }
}
