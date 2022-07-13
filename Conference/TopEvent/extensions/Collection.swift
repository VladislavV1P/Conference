//
//  Collection.swift
//  TopEvent
//
//  Created by Владислав Патраков on 07.06.2022.
//

import Foundation

extension Collection {

    subscript(optional i: Index) -> Iterator.Element? {
        return self.indices.contains(i) ? self[i] : nil
    }

}
