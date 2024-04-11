//
//  CardItemBuilderReducer.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 11.04.2024.
//

import ComposableArchitecture
import Foundation

// MARK: - CardItemBuilderReducer

public struct CardItemBuilderReducer: Reducer {
    
    /// `CardService` instance
    /// `@Swinjectable` cardService: CardService
    @Swinjectable var cardService: CardService
    
    // MARK: - Reducer
    
    public var body: some Reducer<CardItemBuilderState, CardItemBuilderAction> {
        BindingReducer()
        Reduce { state, action in
            switch action {
            case .buttonPressed(var frontName, var backName):
                let id = UUID().uuidString
                frontName = state.frontName
                backName = state.backName
                return cardService
                    .addCardWith(
                        id: id,
                        frontTitle: frontName,
                        backTitle: backName,
                        status: nil
                    )
                    .publish()
                    .map(CardServiceAction.sendCardCashe)
                    .catchToEffect(CardItemBuilderAction.cardService)
            default:
                break
            }
            return .none
        }
    }
}
