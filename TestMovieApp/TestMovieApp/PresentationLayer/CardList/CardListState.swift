//
//  CardListState.swift
//  TestMovieApp
//
//  Created by Andrey Barsukov on 11.04.2024.
//

import Foundation
import ComposableArchitecture
import TCANetworkReducers

// MARK: - CardListState

public struct CardListState: Equatable {
    
    // MARK: - Properties
    
    /// Title of element in `items`
    public var title: String = ""
    
    /// ID of `DeckItem`
    public let deckID: DeckPlainObject.ID
    
    // MARK: - Children
    
    /// An array of items representing the data to be displayed in the interactive list.
    ///
    /// The `items` property is of type `IdentifiedArrayOf<CardListState>`, where `CardListState` is a type
    /// describing the state of individual cells in the interactive list.
    public var items = IdentifiedArrayOf<CardListItemState>()
    
    /// `CardItemBuilderState` instance
    ///
    /// It's an instance of `CardItemBuilder` submodule.
    /// We use it here to be able to integrate `CardItemBuilder` feature into a current module logic.
    /// All necessary processing is placed inside current reducer. Also, if you change the state
    /// inside the `counter` module all changes will be saved here.
    @PresentationState public var cardItemBuilder: CardItemBuilderState!
    
    // MARK: - Relodable
    
    /// ReloadableState instace for network operations
    public var reloadableDeckInfo: IDReloadableState<[CardPlainObject], Int, CardServiceError>
    
    // MARK: - Pagination
    
    /// Pagination state instance
    public var pagination: IDPaginationState<CardPlainObject, DeckPlainObject.ID>
}

// MARK: - Initializers

extension CardListState {
    
    public init(defaultCount: Int, deckID: DeckPlainObject.ID) {
        reloadableDeckInfo = IDReloadableState(id: defaultCount)
        pagination = IDPaginationState(id: deckID, pageSize: AppConstants.Pagination.pageSize)
        self.deckID = deckID
    }
}
