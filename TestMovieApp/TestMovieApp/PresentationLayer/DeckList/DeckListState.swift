//
//  DeckListState.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 05.04.2024.
//

import Foundation
import ComposableArchitecture
import TCANetworkReducers

// MARK: - DeckListState

public struct DeckListState: Equatable {
    
    // MARK: - Properties
    
    /// Title of element in `items`
    public var title: String = ""
    
    // MARK: - Children
    
    /// An array of items representing the data to be displayed in the interactive list.
    ///
    /// The `items` property is of type `IdentifiedArrayOf<DeckListState>`, where `DeckListState` is a type
    /// describing the state of individual cells in the interactive list.
    public var items = IdentifiedArrayOf<DeckListItemState>()
    
    /// `DeckItemBuilderState` instance
    ///
    /// It's an instance of `DeckItemBuilder` submodule.
    /// We use it here to be able to integrate `DeckItemBuilder` feature into a current module logic.
    /// All necessary processing is placed inside current reducer. Also, if you change the state
    /// inside the `counter` module all changes will be saved here.
    @PresentationState public var deckItemBuilder: DeckItemBuilderState!
    
    /// `CardState` instance
    ///
    /// It's an instance of `cardList` submodule.
    /// We use it here to be able to integrate `cardList` feature into a current module logic.
    /// All necessary processing is placed inside current reducer. Also, if you change the state
    /// inside the `counter` module all changes will be saved here.
    @PresentationState public var cardList: CardListState?
    
    // MARK: - Relodable
    
    /// ReloadableState instace for network operations
    public var reloadableDeckInfo: IDReloadableState<[DeckPlainObject], Int, DeckServiceError>
    
    // MARK: - Pagination
    
    /// Pagination state instance
    public var pagination: PaginationState<DeckPlainObject>
}

// MARK: - Initializers

extension DeckListState {
    
    public init(defaultCount: Int) {
        reloadableDeckInfo = IDReloadableState(id: defaultCount)
        pagination = PaginationState(pageSize: AppConstants.Pagination.pageSize)
    }
}
