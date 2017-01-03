//
//  StatusItemController.swift
//  cuImage
//
//  Created by HuLizhen on 03/01/2017.
//  Copyright © 2017 HuLizhen. All rights reserved.
//

import Cocoa

class StatusItemController: NSObject {
    static let shared = StatusItemController()
    
    @IBOutlet weak var menu: NSMenu!
    @IBOutlet weak var preferencesMenuItem: NSMenuItem!
    @IBOutlet weak var aboutMenuItem: NSMenuItem!

    let statusItem = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)
    
    private override init() {
        super.init()
        
        guard let nibName = self.className.components(separatedBy: ".").last,
            let nib = NSNib(nibNamed: nibName, bundle: nil),
            nib.instantiate(withOwner: self, topLevelObjects: nil) else {
                fatalError("Failed to instantiate \(self.className)")
        }
        
        statusItem.title = Bundle.main.infoDictionary![kIOBundleNameKey] as? String
        statusItem.toolTip = Bundle.main.infoDictionary![kIOBundleNameKey] as? String
        statusItem.menu = menu
    }

    @IBAction func handleTappedMenuItem(_ item: NSMenuItem) {
    }
}