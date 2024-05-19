//
//  Component.swift
//  Sample
//
//  Created by steven lee on 19/5/24.
//

import Foundation
open class Component<Dependency> {
    public let dependency: Dependency
    
    public init(with dependency: Dependency) {
        self.dependency = dependency
    }
}
