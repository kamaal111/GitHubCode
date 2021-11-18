//
//  SafariExtensionHandler.swift
//  Safari
//
//  Created by Kamaal Farah on 17/11/2021.
//

import SafariServices

class SafariExtensionHandler: SFSafariExtensionHandler {

    override func messageReceived(withName messageName: String, from page: SFSafariPage, userInfo: [String: Any]?) {
        page.getPropertiesWithCompletionHandler { properties in
            NSLog("The extension received a message (\(messageName)) from a script injected" +
                  " into (\(String(describing: properties?.url))) with userInfo (\(userInfo ?? [:]))")
        }
    }

    override func toolbarItemClicked(in window: SFSafariWindow) {
        window.getActivePage { page in
            guard let page = page else { return }
            page.getPropertiesWithCompletionHandler { properties in
                guard let webpageURL = properties?.url,
                      let webpageHost = SupportedWebHosts(rawValue: webpageURL.host ?? "") else { return }

                let redirectURL = webpageURL.absoluteString
                    .replacingOccurrences(of: webpageHost.rawValue, with: webpageHost.replacement.rawValue)
                page.dispatchMessageToScript(withName: "redirectPage", userInfo: ["url": redirectURL])
            }
        }
    }

    override func validateToolbarItem(
        in window: SFSafariWindow,
        validationHandler: @escaping ((Bool, String) -> Void)) {
            validationHandler(true, "")
        }

}
