//
//  SafariWebExtensionHandler.swift
//  Shared (Extension)
//
//  Created by Kamaal M Farah on 13/11/2021.
//

import SafariServices
import os.log

let SFExtensionMessageKey = "message"

class SafariWebExtensionHandler: NSObject, NSExtensionRequestHandling {

    func beginRequest(with context: NSExtensionContext) {
        guard let item = context.inputItems.first as? NSExtensionItem else {
            fatalError("something went wrong with unwrapping context.input")
        }

        let message = item.userInfo?[SFExtensionMessageKey]

        guard let messageArg = message as? CVarArg else { fatalError("could not cast to CVarArg") }
        os_log(.default, "Received message from browser.runtime.sendNativeMessage: %@", messageArg)

        let response = NSExtensionItem()
        response.userInfo = [ SFExtensionMessageKey: [ "Response to": message ] ]

        context.completeRequest(returningItems: [response], completionHandler: nil)
    }

}
