//
//  RootSplitViewController.swift
//  NestableSplitView
//
//  Created by Martin Pilkington on 06/03/2020.
//  Copyright © 2020 M Cubed Software. All rights reserved.
//

import Cocoa

class RootSplitViewController: NSViewController {

    var splitView: NSSplitView {
        return self.view as! NSSplitView
    }

    @IBOutlet var innerSplitView: NestableSplitView!

    @objc dynamic var fixHoldingPriorityWhileDragging: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()
        self.innerSplitView.nestableDelegate = self
    }

}

extension RootSplitViewController: NestableSplitViewDelegate {
    func willStartDrag(in splitView: NestableSplitView) {
        guard self.fixHoldingPriorityWhileDragging else {
            return
        }
        self.splitView.setHoldingPriority(.init(490), forSubviewAt: 0)
        self.splitView.setHoldingPriority(.init(490), forSubviewAt: 2)
    }

    func didFinishDrag(in splitView: NestableSplitView) {
        guard self.fixHoldingPriorityWhileDragging else {
            return
        }
        self.splitView.setHoldingPriority(.init(260), forSubviewAt: 0)
        self.splitView.setHoldingPriority(.init(260), forSubviewAt: 2)
    }
}


