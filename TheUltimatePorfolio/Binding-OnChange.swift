//
//  Binding-OnChange.swift
//  TheUltimatePorfolio
//
//  Created by Huy Ong on 11/10/20.
//

import SwiftUI

extension Binding {
    func onChange(_ handler: @escaping () -> Void) -> Binding<Value> {
        Binding(
            get: { self.wrappedValue },
            set: { newValue in
                self.wrappedValue = newValue
                handler()
            }
        )
    }
}
