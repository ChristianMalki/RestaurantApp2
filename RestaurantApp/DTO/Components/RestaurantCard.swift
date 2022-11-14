//
//  RestaurantCard.swift
//  RestaurantApp
//
//  Created by Christian Malki on 2022-11-10.
//

import SwiftUI

struct RestaurantCard: View {
    
    var restaurant: Restaurant
    
    var isMini: Bool
    
    var body: some View {
            
        AsyncImage(url: URL(string: restaurant.image), content: {
                image in
            
                image.resizable().overlay(alignment: .bottomLeading, content: {
                    VStack {
                        Text(restaurant.title).bold().font(.title).foregroundColor(.white)
                    }.padding()
                })
                        
                
            }, placeholder: {
                Text("Loading...").foregroundColor(.white)
                
            }).frame(width: isMini ? 225 : 325, height: isMini ? 150 : 210).background(.black).cornerRadius(9)
    }
}

struct RestaurantCard_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantCard(restaurant: Restaurant(id: "1", title: "Bap Burgers", openingHours: "Öppet alla dagar", image: "https://www.burgerdudes.se/wp-content/uploads/2020/11/bap_bbq_sway_jun21_med.jpg", description: "Stokholms godaste hamburgare", latitude: 18.0828879283391, longitude: 59.33685985829314, reviews: [Review(id: "1", name: "Christian", message: "Rekommenderas starkt!")]), isMini: false)
    }
}

