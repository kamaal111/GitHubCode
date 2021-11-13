//
//  ViewController.swift
//  Shared (App)
//
//  Created by Kamaal M Farah on 13/11/2021.
//

import WebKit

#if os(iOS)
import UIKit
typealias PlatformViewController = UIViewController
#elseif os(macOS)
import Cocoa
import SafariServices
typealias PlatformViewController = NSViewController
#endif

let extensionBundleIdentifier = "io.kamaal.GitHubCode.Extension"

class ViewController: PlatformViewController, WKNavigationDelegate, WKScriptMessageHandler {

    @IBOutlet var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.webView.navigationDelegate = self

        #if os(iOS)
        self.webView.scrollView.isScrollEnabled = false
        #endif

        self.webView.configuration.userContentController.add(self, name: "controller")

        let mainHTMLURL = Bundle.main.url(forResource: "Main", withExtension: "html")!
        let resourceURL = Bundle.main.resourceURL!
        self.webView.loadFileURL(mainHTMLURL, allowingReadAccessTo: resourceURL)
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        #if os(iOS)
        webView.evaluateJavaScript("show('ios')")
        #elseif os(macOS)
        webView.evaluateJavaScript("show('mac')")

        SFSafariExtensionManager.getStateOfSafariExtension(withIdentifier: extensionBundleIdentifier) { state, error in
            guard let state = state, error == nil else {
                // Insert code to inform the user that something went wrong.
                return
            }

            DispatchQueue.main.async {
                webView.evaluateJavaScript("show('mac', \(state.isEnabled)")
            }
        }
        #endif
    }

    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        #if os(macOS)
        guard message.body as? String == "open-preferences" else { return }

        SFSafariApplication.showPreferencesForExtension(withIdentifier: extensionBundleIdentifier) { error in
            guard error == nil else {
                // Insert code to inform the user that something went wrong.
                return
            }

            DispatchQueue.main.async {
                NSApplication.shared.terminate(nil)
            }
        }
        #endif
    }

}
