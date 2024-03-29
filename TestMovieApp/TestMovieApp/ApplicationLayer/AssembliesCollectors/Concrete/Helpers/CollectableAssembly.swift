//
//  CollectableAssembly.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 29.03.2024.
//

import Swinject

// MARK: - CollectableAssembly

protocol CollectableAssembly {

    // MARK: - Initializers
    
    init()

    /// Method for registering your assemblies
    ///
    /// - Parameter container: Container for dependency ijection
    func assemble(inContainer container: Container)
}

extension CollectableAssembly {

    /// Container with all dependencies
    var container: Container {
        AssembliesHolder.container
    }

    /// Wrapper for protocol's assemble method
    func assemble() {
        assemble(inContainer: container)
    }
}
