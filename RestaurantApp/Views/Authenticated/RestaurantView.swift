//
//  RestaurantView.swift
//  RestaurantApp
//
//  Created by Christian Malki on 2022-11-10.
//

import SwiftUI

struct RestaurantView: View {
    
    @EnvironmentObject var dbConnection: DatabaseConnection
    var restaurant: Restaurant
    
    @State var showPopup = false
    
    var body: some View {
        
        ZStack() {
            
            GeometryReader { geometry in
                
                Color(.systemGray6).ignoresSafeArea()
                ScrollView {
                    VStack(alignment: .leading) {
                        AsyncImage(url: URL(string: restaurant.image), content: {
                            image in
                            
                            image.resizable().overlay(alignment: .bottomLeading, content: {
                                VStack {
                                    Text(restaurant.title).bold().font(.title).foregroundColor(.white)
                                    
                                    
                                }.padding()
                            })
                            
                        }, placeholder: {
                            Text("Loading...").foregroundColor(.white)
                            
                        }).frame(height: 360)
                        
                        
                        VStack(alignment: .leading, spacing: 20) {
                            
                            Text(restaurant.openingHours).font(.system(.subheadline, design: .monospaced, weight: .thin))
                            
                            Text(restaurant.title).bold().font(.title)
                            
                            Text(restaurant.description)
                            
                            HStack {
                                Text("Reviews").bold().font(.title)
                                Spacer()
                                Button(action: {
                                    showPopup.toggle()
                                }, label: {
                                    Text("Add review").padding().background(.black).foregroundColor(.white).cornerRadius(9)
                                })
                            }
                                
                                ForEach(restaurant.reviews) { review in
                                    
                                    VStack(alignment: .leading, spacing: 5) {
                                        Text(review.name).bold()
                                        Text(review.message).font(.caption)
                                    }.padding(.vertical)
                                }
                            
                            
                            
                        }.padding()
                        
                    }
                }.ignoresSafeArea().blur(radius: showPopup ? 2 : 0)
            }
            

            if showPopup {
                ReviewPopupView(restaurantId: restaurant.id, showPopup: $showPopup)
            }
            
        
        }

    }
}

struct RestaurantView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantView(restaurant: Restaurant(id: "1", title: "Bap Burgers", openingHours: "Öppet alla dagar", image: "https://www.burgerdudes.se/wp-content/uploads/2020/11/bap_bbq_sway_jun21_med.jpg", description: "Stockholms godaste hamburgare", latitude: 18.0828879283391, longitude: 59.33685985829314, reviews: [Review(id: "1", name: "Christian", message: "Rekommenderas starkt!")]))
    }
}
