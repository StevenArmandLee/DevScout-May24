//
//  LoginScreen.swift
//  Sample
//
//  Created by steven lee on 19/5/24.
//

import SwiftUI

struct LoginScreen<ViewModel, Builder>: View where ViewModel: LoginScreenModelProtocol, Builder: LoginBuildable {
    @State var viewModel: ViewModel
    var builder: Builder
    var body: some View {
        VStack {
            Button("Login") {
                viewModel.onLoginPressed()
            }
        }
        .task{
            await viewModel.onAppear()
        }
        
    }
}

#Preview {
    @MainActor class MockLoginScreenModel: LoginScreenModelProtocol {
        func onLoginPressed() {
            
        }
        
        func onAppear() async {}
    }
    class MockLoginBuilder: LoginBuildable {
        func build() -> some View {
            Text("Mock")
        }
    }
    return LoginScreen(viewModel: MockLoginScreenModel(), builder: MockLoginBuilder())
}
