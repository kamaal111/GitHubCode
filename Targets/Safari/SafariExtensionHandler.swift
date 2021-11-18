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
        NSLog("The extension's toolbar item was clicked")
        window.getActiveTab { tab in
            tab?.getActivePage { page in
                guard let page = page else { return }
                page.getPropertiesWithCompletionHandler { properties in
                    guard let webpageURL = properties?.url else { return }
                    let codeURL = webpageURL.absoluteString.replacingOccurrences(of: "github.com/", with: "github.dev/")
                    UserDefaults(suiteName: "io.kamaal.GitHubCode.Group")?
                        .set(codeURL, forKey: "webpage_url")
                    page.dispatchMessageToScript(withName: "redirectPage", userInfo: ["url": codeURL])
                }
            }
        }
    }

    override func validateToolbarItem(
        in window: SFSafariWindow,
        validationHandler: @escaping ((Bool, String) -> Void)) {
            // This is called when Safari's state changed in some way that would require
            // the extension's toolbar item to be validated again.
            validationHandler(true, "")
        }

}
