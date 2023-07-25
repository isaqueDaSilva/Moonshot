//
//  DividerView.swift
//  Moonshot
//
//  Created by Isaque da Silva on 25/07/23.
//

import SwiftUI

struct DividerView: View {
    let text: String
    var showingLine: Bool
    
    var body: some View {
        LazyVStack(alignment: .leading) {
            Text(text)
            
            if showingLine {
                Rectangle()
                    .frame(height: 2)
            }
        }
        .padding(.horizontal)
    }
}
