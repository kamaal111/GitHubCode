//
//  SFSafariWindow+extensions.swift
//  GitHubCode Safari (macOS)
//
//  Created by Kamaal M Farah on 18/11/2021.
//

import SafariServices

extension SFSafariWindow {
    func getActivePage(completion: @escaping (SFSafariPage?) -> Void) {
        self.getActiveTab { tab in
            guard let tab = tab else {
                completion(nil)
                return
            }
            tab.getActivePage(completionHandler: completion)
        }
    }
}
