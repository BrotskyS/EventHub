//
//  CategoriesModel.swift
//  EventHub
//
//  Created by Sergiy Brotsky on 04.05.2022.
//

import Foundation


struct Categorie: Identifiable {
    let id = UUID()
    var image: String
    var title: String
    var color: String
}

var categoriesList = [
    Categorie(image: "fork.knife", title: "Food", color: "#29D697"),
    Categorie(image: "fork.knife", title: "Sport", color: "#F0635A"),
    Categorie(image: "fork.knife", title: "Music", color: "#F59762"),
    Categorie(image: "fork.knife", title: "Art", color: "#46CDFB")
]
