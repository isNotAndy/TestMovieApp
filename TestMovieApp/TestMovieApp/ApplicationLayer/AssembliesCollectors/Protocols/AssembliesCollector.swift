//
//  AssembliesCollector.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 29.03.2024.
//

import Swinject
import Foundation

// MARK: - CollectToken

private let collectToken = "com.incetro.TestMovieApp.Collector"

// MARK: - AssembliesCollector

protocol AssembliesCollector {

    // MARK: - Initializers
    
    init()

    /// Collect all Application assemblies in container
    ///
    /// - Parameters:
    ///   - container: container for collection
    func collect(inContainer container: Container)
}

extension AssembliesCollector {

    /// Collect all Application assemblies
    func collect() {
        DispatchQueue.once(token: collectToken) {
            self.collect(inContainer: AssembliesHolder.container)
        }
    }

    /// Collect all Application assemblies
    static func collect() {
        Self().collect()
    }

    /// Collect all Application assemblies in container
    ///
    /// - Parameters:
    ///   - container: container for collection
    static func collect(in container: Container) {
        Self().collect(inContainer: container)
    }
}
