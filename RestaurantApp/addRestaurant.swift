//
//  addRestaurant.swift
//  RestaurantApp
//
//  Created by Christian Malki on 2022-11-11.
//

import SwiftUI

struct addRestaurant: View {
    @EnvironmentObject var dbConnection: DatabaseConnection
    
    @State var title = ""
    @State var description = ""
    @State var openingHours = ""
    @State var image = ""
    @State var latitude = 0.0
    @State var longitude = 0.0
    @State var reviews = ""
    
    var body: some View {
        
        VStack {
            Spacer()
            Text("Add title")
            TextField("", text: $title)
            
        }
        VStack {
            Text("Add description")
            TextField("", text: $description)
        }
        VStack {
            Text("Add openingHours")
            TextField("", text: $openingHours)
        }
        VStack {
            Text("Add image")
            TextField("", text: $image)
        }
        VStack {
            Text("Add reviews")
            TextField("", text: $reviews)
        }
        Button(action: {
        }, label: {
            Text("Add Restaurant").padding().background(.black).foregroundColor(.white).cornerRadius(9)
        })
    }
    
   
    struct addRestaurant_Previews: PreviewProvider {
        static var previews: some View {
            addRestaurant()
        }
    }
}
