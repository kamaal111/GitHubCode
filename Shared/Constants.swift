//
//  Constants.swift
//  GitHubCode
//
//  Created by Kamaal M Farah on 18/11/2021.
//

import Foundation

enum Constants {
    static let bundleIdentifier: String = {
        let identifier = Bundle.main.bundleIdentifier!
        if identifier.contains("Safari") {
            return identifier.split(separator: ".").dropFirst().joined(separator: ".")
        }
        return identifier
    }()

    static let appGroup = bundleIdentifier.appending("Group")
}
