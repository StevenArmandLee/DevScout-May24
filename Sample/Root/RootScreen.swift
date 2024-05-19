//
//  RootScreen.swift
//  Sample
//
//  Created by steven lee on 19/5/24.
//

import SwiftUI

struct RootScreen<ViewModel, Builder>: View where ViewModel: RootScreenModelProtocol, Builder: RootBuildable {
    @State var viewModel: ViewModel
    var builder: Builder
    var body: some View {
        Group {
            if viewModel.isLoggedIn {
                builder.buildMain()
            } else {
                builder.buildLogin()
            }
        }
        .task{
            await viewModel.onAppear()
        }
        
    }
}

#Preview {
    @MainActor class MockRootScreenModel: RootScreenModelProtocol {
        func onAppear() async {}
        var isLoggedIn: Bool = false
    }
    class MockRootBuilder: RootBuildable {
        func build() -> some View {
            Text("Mock")
        }
        func buildLogin() -> some View {
            Text("login")
        }
        
        func buildMain() -> some View {
            Text("main")
        }
    }
    return RootScreen(viewModel: MockRootScreenModel(), builder: MockRootBuilder())
}
