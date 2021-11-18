//
//  ContentView.swift
//  GitHubCode
//
//  Created by Kamaal Farah on 17/11/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world! \(lastSelectedURL)")
            .padding()
    }

    private var lastSelectedURL: String {
        UserDefaults(suiteName: "io.kamaal.GitHubCode.Group")?.string(forKey: "webpage_url") ?? ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
