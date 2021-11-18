//
//  SupportedWebHosts.swift
//  GitHubCode
//
//  Created by Kamaal M Farah on 18/11/2021.
//

import Foundation

enum SupportedWebHosts: String {
    case githubDev = "github.dev"
    case githubCom = "github.com"

    var replacement: SupportedWebHosts {
        switch self {
        case .githubCom: return .githubDev
        case .githubDev: return .githubCom
        }
    }
}
