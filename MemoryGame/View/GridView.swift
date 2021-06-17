//
//  GridView.swift
//  MemoryGame
//
//  Created by Ahmed Abaza on 15/06/2021.
//

import SwiftUI

struct GridView<Item, ItemView >: View where Item: Identifiable, ItemView: View{
    //MARK: -Properties
    private var items: [Item]
    private var viewForItem: (Item) -> ItemView
    
    
    //MARK: -Inits
    init(_ items: [Item], viewForItem: @escaping (Item) -> ItemView) {
        self.items = items.shuffled()
        self.viewForItem  = viewForItem
        print("==================================Shuffled Cards Supposedly================================")
        print(items)
    }
    
    
    //MARK: -UI Declarations
    var body: some View {
        
        GeometryReader { geo in 
            let layout = GridLayout(itemCount: items.count, in: geo.size)
            ForEach(items) {item in
                let itemIndex =  items.firstIndex(matches: item)
                Group {
                    if itemIndex != nil {
                        viewForItem(item)
                            .frame(
                                width: layout.itemSize.width,
                                height: layout.itemSize.height
                            )
                            .position(layout.location(ofItemAt: itemIndex!))
                    }
                }
            }
        }
    }
    
    
    //MARK: -Functions
}

