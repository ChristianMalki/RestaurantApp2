//
//  RestaurantListView.swift
//  RestaurantApp
//
//  Created by Christian Malki on 2022-11-10.
//

import SwiftUI

struct RestaurantsListView: View {
    @EnvironmentObject var dbConnection: DatabaseConnection
    
    @State var viewOnMap = false
    
    var body: some View {
        
        ZStack {
            ScrollView {
                Text("Restaurants").bold().font(.title)
                
                Spacer()
                
                ForEach(dbConnection.restaurantList) { restaurant in
                    NavigationLink(destination: RestaurantView(restaurant: restaurant), label: {
                        RestaurantCard(restaurant: restaurant, isMini: false)
                    })
                }
                
                
                //            Button("Sign out") {
                //                dbConnection.SignOut()
                //            }.buttonStyle(.borderedProminent)
            }.overlay(alignment: .bottom, content: {
                
                
                Button(action: {
                    viewOnMap.toggle()
                }, label: {
                    Text("View on map").padding().background(.black).foregroundColor(.white).cornerRadius(9)
                })
                
            })
            
            if viewOnMap {
                RestaurantsMapView(viewOnMap: $viewOnMap)
            }
        }
    }
}

struct RestaurantsListView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantsListView().environmentObject(DatabaseConnection())
    }
}
