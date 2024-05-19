//
//  DetailScreen.swift
//  Sample
//
//  Created by steven lee on 19/5/24.
//

import SwiftUI

struct DetailScreen<ViewModel, Builder>: View where ViewModel: DetailScreenModelProtocol, Builder: DetailBuildable {
    @State var viewModel: ViewModel
    var builder: Builder
    var body: some View {
        VStack {
            Text("Number \(viewModel.number.value)")
            Button("Logout") {
                viewModel.onLogoutPressed()
            }
            NavigationLink("Go to Speech To text", value: "Number \(viewModel.number.value)")
        }
        .task{
            await viewModel.onAppear()
        }
        
    }
}

#Preview {
    @MainActor class MockDetailScreenModel: DetailScreenModelProtocol {
        var number: Number = Number(value: 1)
        
        func onAppear() async {}
        func onLogoutPressed() {
            
        }
    }
    class MockDetailBuilder: DetailBuildable {
        func build(for number: Number) -> some View {
            Text("Mock")
        }
    }
    return DetailScreen(viewModel: MockDetailScreenModel(), builder: MockDetailBuilder())
}
