//
//  Array+Identifiable.swift
//  MemoryGame
//
//  Created by Ahmed Abaza on 15/06/2021.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matches: Element) -> Int? {
        return self.first { element in
            return element.id == matches.id
        }?.id as? Int ?? nil
    }
}
