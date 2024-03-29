//
//  TestMovieAppAssembliesCollector.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 29.03.2024.
//

import Swinject
import Foundation

// MARK: - TestMovieAppAssembliesCollector

final class TestMovieAppAssembliesCollector: AssembliesCollector {

    // MARK: - Initializers
    
    required init() {}

    // MARK: - AssembliesCollector
    
    func collect(inContainer container: Container) {

        let typeCount = Int(objc_getClassList(nil, 0))
        let types = UnsafeMutablePointer<AnyClass?>.allocate(capacity: typeCount)
        let autoreleasingTypes = AutoreleasingUnsafeMutablePointer<AnyClass>(types)

        objc_getClassList(autoreleasingTypes, Int32(typeCount))

        for index in 0..<typeCount {
            if let assemblyType = (types[index] as? CollectableAssembly.Type) {
                let object = assemblyType.init()
                object.assemble(inContainer: container)
            }
        }
        types.deallocate()
    }
}
