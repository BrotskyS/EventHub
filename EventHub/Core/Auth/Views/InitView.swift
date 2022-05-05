//
//  Init.swift
//  EventHub
//
//  Created by Sergiy Brotsky on 27.04.2022.
//

import SwiftUI

struct Init: View {
    var body: some View {
        ZStack{
            
            VStack{
                Text("Reasd")
            }
            .frame(width: .infinity, height: 300, alignment: .bottom)
            .background(.red)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        }
    }
}

struct Init_Previews: PreviewProvider {
    static var previews: some View {
        Init()
    }
}
