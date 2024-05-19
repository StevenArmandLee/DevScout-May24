//
//  MainScreen.swift
//  Sample
//
//  Created by steven lee on 19/5/24.
//

import SwiftUI

struct MainScreen<ViewModel, Builder>: View where ViewModel: MainScreenModelProtocol, Builder: MainBuildable {
    @State var viewModel: ViewModel
    var builder: Builder
    var body: some View {
        NavigationStack(path: $viewModel.homePath){
            List(viewModel.numbers, id: \.value) { number in
                NavigationLink("number \(number.value)", value: number)
            }
            .task{
                await viewModel.onAppear()
            }
            .navigationDestination(for: Number.self) { number in
                builder.buildDetail(for: number)
            }
            .navigationDestination(for: String.self) { number in
                builder.buildSpeech()
            }
        }
        
    }
}

#Preview {
    @MainActor class MockMainScreenModel: MainScreenModelProtocol {
        var homePath: NavigationPath = NavigationPath()
        
        var numbers: [Number] = [Number(value: 1), Number(value: 2)]
        
        func onAppear() async {}
    }
    class MockMainBuilder: MainBuildable {
        func build() -> some View {
            Text("Mock")
        }
        func buildDetail(for number: Number) -> some View {
            Text("Mock")
        }
        func buildSpeech() -> some View {
            Text("Mock")
        }
    }
    return MainScreen(viewModel: MockMainScreenModel(), builder: MockMainBuilder())
}
