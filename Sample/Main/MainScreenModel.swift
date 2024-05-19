//
//  MainScreenModel.swift
//  Sample
//
//  Created by steven lee on 19/5/24.
//

import SwiftUI

struct Number: Hashable {
    let value: Int
}

@MainActor protocol MainScreenModelProtocol {
    var homePath: NavigationPath { get set }
    var numbers: [Number] { get set }
    func onAppear() async
}

@Observable @MainActor class MainScreenModel: MainScreenModelProtocol {
    var homePath: NavigationPath
    var numbers: [Number]
    init() {
        self.homePath = NavigationPath()
        self.numbers = [Number(value: 1), Number(value: 2), Number(value: 3)]
    }
    func onAppear() async {
        
    }
    
    
}
