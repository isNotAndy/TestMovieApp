//
//  DeskListReducer.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 30.03.2024.
//

import Foundation
import ComposableArchitecture

// MARK: - DeskListReducer

public struct DeskListReducer: Reducer {
    
    public var body: some Reducer<DeskListState, DeskListAction> {
        BindingReducer()
        Reduce { state, action in
            switch action {
            case .item(id: _, action: .itemTapped):
                return .send(.deskPressed)
            case .cardList(.presented(.onAppear)):
                return .none
            case .deskPressed:
                state.cardList = CardListState()
            case .buttonPressed(let title):
                let id = UUID().uuidString
                state.items.insert(DeskItemState(
                    id: id,
                    title: title,
                    count: 0), at: 0)
                state.title = ""
            default:
                break
            }
            return .none
        }
        .ifLet(\.$cardList, action: /DeskListAction.cardList) {
            CardListReducer()
        }
    }
}
