//
//  SpeakScreenModel.swift
//  Sample
//
//  Created by steven lee on 19/5/24.
//

import SwiftUI

@MainActor protocol SpeakScreenModelProtocol {
    var textToSpeak: String {get set}
    func onSpeakPressed() async
    func onAppear() async
}

@Observable @MainActor class SpeakScreenModel: SpeakScreenModelProtocol {
    var textToSpeak: String
    let speechSynthesizer: SpeechSynthesizerProtocol
    init(speechSynthesizer: SpeechSynthesizerProtocol) {
        self.speechSynthesizer = speechSynthesizer
        self.textToSpeak = ""
    }
    func onAppear() async {
        
    }
    func onSpeakPressed() async {
        await speechSynthesizer.speak(text: textToSpeak)
    }
}
