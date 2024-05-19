//___FILEHEADER___

import SwiftUI

protocol ___VARIABLE_productName___Dependency{
    
}

class ___VARIABLE_productName___Component: Component<___VARIABLE_productName___Dependency> {
    
    init(dependency: ___VARIABLE_productName___Dependency) {
        super.init(with: dependency)
    }
}

protocol ___VARIABLE_productName___Buildable {
    associatedtype Screen: View
    @ViewBuilder @MainActor func build() -> Screen
}

class ___VARIABLE_productName___Builder: ___VARIABLE_productName___Buildable {
    private var component: ___VARIABLE_productName___Component
    init(component: ___VARIABLE_productName___Component) {
        self.component = component
    }
    @ViewBuilder @MainActor func build() -> some View {
        let ___VARIABLE_productName___ScreenModel: some ___VARIABLE_productName___ScreenModelProtocol = ___VARIABLE_productName___ScreenModel()
        ___VARIABLE_productName___Screen(viewModel: ___VARIABLE_productName___ScreenModel, builder: self)
    }
}
