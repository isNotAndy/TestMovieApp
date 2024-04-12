//
//  InfrastructureAssembly.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 05.04.2024.
//

import Foundation
import Swinject
import RealmSwift
import ServiceCore
import Monreau

// MARK: - InfrastructureAssembly

public final class InfrastructureAssembly: CollectableAssembly {
    
    func assemble(inContainer container: Container) {
        
        // MARK: - RealmConfiguration
        
        container.register(Realm.self) { resolver in
            let configuration = container.resolve(RealmConfiguration.self).unsafelyUnwrapped
            do {
                func pathForFileName(_ fileName: String) -> URL? {
                    let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first as NSString?
                    guard let realmPath = documentDirectory?.appendingPathComponent(fileName) else {
                        return nil
                    }
                    return URL(string: realmPath)
                }
                let configuration = resolver.resolve(RealmConfiguration.self)!
                var config =  Realm.Configuration.defaultConfiguration
                config.schemaVersion = configuration.databaseVersion
                config.fileURL = pathForFileName(configuration.databaseFileName)
                return try Realm(configuration: config)
            } catch {
                fatalError(":(")
            }
        }.inObjectScope(.container)
        
        container.register(RealmConfiguration.self) { resolver in
            RealmConfiguration(
                databaseFileName: "TestMovieApp.realm",
                databaseVersion: 4
            )
        }
    }
}

