//
//  LocationSearchView.swift
//  EventHub
//
//  Created by Sergiy Brotsky on 17.05.2022.
//


import SwiftUI

struct LocationSearchView: View {
    @StateObject private var viewModel = ContentViewModel()

    var body: some View {
        NavigationView{
            
                List(viewModel.viewData) { item in
                    VStack(alignment: .leading) {
                        Text(item.title)
                        Text(item.subtitle)
                            .foregroundColor(.secondary)
                    }
                }
            
            .navigationTitle("Contacts")
            .searchable(text: $viewModel.cityText)
        }
    }
}

struct LocationSearchView_Previews: PreviewProvider {
    static var previews: some View {
        
            LocationSearchView()
        
    }
}
