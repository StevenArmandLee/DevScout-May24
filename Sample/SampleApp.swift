//
//  SampleApp.swift
//  Sample
//
//  Created by steven lee on 19/5/24.
//

import SwiftUI
import SwiftData

@main
struct SampleApp: App {
    let component: RootComponent = RootComponent()
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            RootBuilder(component: component).build()
        }
        .modelContainer(sharedModelContainer)
    }
}
