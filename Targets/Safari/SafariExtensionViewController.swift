//
//  SafariExtensionViewController.swift
//  Safari
//
//  Created by Kamaal Farah on 17/11/2021.
//

import SafariServices

class SafariExtensionViewController: SFSafariExtensionViewController {

    static let shared: SafariExtensionViewController = {
        let shared = SafariExtensionViewController()
        shared.preferredContentSize = NSSize(width: 320, height: 240)
        return shared
    }()

}
