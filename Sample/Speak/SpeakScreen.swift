//
//  SpeakScreen.swift
//  Sample
//
//  Created by steven lee on 19/5/24.
//

import SwiftUI

struct SpeakScreen<ViewModel, Builder>: View where ViewModel: SpeakScreenModelProtocol, Builder: SpeakBuildable {
    @State var viewModel: ViewModel
    var builder: Builder
    var body: some View {
        VStack {
            TextField("text to speak", text: $viewModel.textToSpeak)
            Button("Speak") {
                Task {
                    await viewModel.onSpeakPressed()
                }
            }
        }
        .task{
            await viewModel.onAppear()
        }
        
    }
}

#Preview {
    @MainActor class MockSpeakScreenModel: SpeakScreenModelProtocol {
        var textToSpeak: String = ""
        func onAppear() async {}
        func onSpeakPressed() async {
            
        }
    }
    class MockSpeakBuilder: SpeakBuildable {
        func build() -> some View {
            Text("Mock")
        }
    }
    return SpeakScreen(viewModel: MockSpeakScreenModel(), builder: MockSpeakBuilder())
}
