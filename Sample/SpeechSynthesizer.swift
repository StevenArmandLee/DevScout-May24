//
//  SpeechSynthesizer.swift
//  Sample
//
//  Created by steven lee on 19/5/24.
//

import AVFoundation

protocol SpeechSynthesizerProtocol {
    func speak(text: String) async
    func pause() -> Bool
    func resume() -> Bool
}

class SpeechSynthesizer: SpeechSynthesizerProtocol {
    private var synthesizer = AVSpeechSynthesizer()
    private var continuation: CheckedContinuation<Void, Never>?
    
    var voice: AVSpeechSynthesisVoice?
    
    init(voice: AVSpeechSynthesisVoice?) {
        synthesizer.usesApplicationAudioSession = true
        try? AVAudioSession.sharedInstance().setCategory(.playback)
        self.voice = voice
    }
    
    func speak(text: String) async {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = voice
        synthesizer.speak(utterance)
        
        await withCheckedContinuation { continuation in
            self.continuation = continuation
        }
    }
    
    func pause() -> Bool {
        return synthesizer.pauseSpeaking(at: .immediate)
    }
    
    func resume() -> Bool {
        return synthesizer.continueSpeaking()
    }
}
