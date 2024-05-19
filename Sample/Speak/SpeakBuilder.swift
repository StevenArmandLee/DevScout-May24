//
//  SpeakBuilder.swift
//  Sample
//
//  Created by steven lee on 19/5/24.
//

import SwiftUI

protocol SpeakDependency{
    
}

class SpeakComponent: Component<SpeakDependency> {
    let speechSynthesizer: SpeechSynthesizerProtocol
    init(dependency: SpeakDependency) {
        self.speechSynthesizer = SpeechSynthesizer(voice: nil)
        super.init(with: dependency)
    }
}

protocol SpeakBuildable {
    associatedtype Screen: View
    @ViewBuilder @MainActor func build() -> Screen
}

class SpeakBuilder: SpeakBuildable {
    private var component: SpeakComponent
    init(component: SpeakComponent) {
        self.component = component
    }
    @ViewBuilder @MainActor func build() -> some View {
        let SpeakScreenModel: some SpeakScreenModelProtocol = SpeakScreenModel(speechSynthesizer: component.speechSynthesizer)
        SpeakScreen(viewModel: SpeakScreenModel, builder: self)
    }
}
