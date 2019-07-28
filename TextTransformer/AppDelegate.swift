//
//  AppDelegate.swift
//  TextTransformer
//
//  Created by taco on 7/28/19.
//  Copyright © 2019 tacoTruck. All rights reserved.
//

import Cocoa

//THIS IS THE ONLY THING THAT EXISTS WHEN THE PROGRAM RUNS
@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    //this line allows macOS to determine the appropriate width of menu bar space occupied
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        
        //this acts as the icon text
        statusItem.button?.title = "🌮"
        
        statusItem.button?.target = self
        statusItem.button?.action = #selector(showSettings)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


    @objc func showSettings() {
        
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        
        guard let vc = storyboard.instantiateController(withIdentifier: "ViewController") as?
            ViewController else {
                fatalError("Unable to find ViewController in the storyboard")
        }
        
        guard let button = statusItem.button else {
            fatalError("Couldn't find status item button")
        }
        
        let popoverView = NSPopover()       //this creates the drop down menu
        popoverView.contentViewController = vc  //set the view of the popover to the UI built earlier
        popoverView.behavior = .transient       //this allows popover to disappear when clicked off of
        popoverView.show(relativeTo: button.bounds, of: button, preferredEdge: .maxY)
    }
}

