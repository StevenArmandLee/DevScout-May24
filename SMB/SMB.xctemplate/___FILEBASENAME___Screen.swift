//___FILEHEADER___

import SwiftUI

struct ___VARIABLE_productName___Screen<ViewModel, Builder>: View where ViewModel: ___VARIABLE_productName___ScreenModelProtocol, Builder: ___VARIABLE_productName___Buildable {
    @State var viewModel: ViewModel
    var builder: Builder
    var body: some View {
        VStack {
            Text("Hello")
        }
        .task{
            await viewModel.onAppear()
        }
        
    }
}

#Preview {
    @MainActor class Mock___VARIABLE_productName___ScreenModel: ___VARIABLE_productName___ScreenModelProtocol {
        func onAppear() async {}
    }
    class Mock___VARIABLE_productName___Builder: ___VARIABLE_productName___Buildable {
        func build() -> some View {
            Text("Mock")
        }
    }
    return ___VARIABLE_productName___Screen(viewModel: Mock___VARIABLE_productName___ScreenModel(), builder: Mock___VARIABLE_productName___Builder())
}
