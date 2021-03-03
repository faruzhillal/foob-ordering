//
//  Home.swift
//  Food Ordering
//
//  Created by Faruz Hillal Albany on 01/03/21.
//

import SwiftUI
 
struct Home: View {
    //: Mark Properties
    @StateObject var HomeModel = HomeViewModel()
    //: Mark Body
    var body: some View {
        ZStack{
            VStack{
                HStack(spacing: 15){
 
                    Button (action: {
 
                        withAnimation(.easeIn){
                            HomeModel.showMenu.toggle()
                        }//buat nampilin menu
 
                    }, label: {
                        Image(systemName: "line.horizontal.3")
                            .font(.title)
                            .foregroundColor(Color.blue)
                    })
 
                    Text(HomeModel.userLocation == nil ? "Lokasi.." : "Kirim Ke" )
                        .foregroundColor(Color.black)
 
                    Text(HomeModel.userAddress)
                        .font(.caption)
                        .fontWeight(.heavy)
                        .foregroundColor(.blue)
 
                    Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                }//:HStack tab bar
                .padding([.horizontal, .top])
 
                HStack(spacing: 15){
                    TextField("Search", text: $HomeModel.search)
 
                    if HomeModel.search != "" {
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image(systemName: "magnifyingglass")
                                .font(.title)
                                .foregroundColor(.gray)
                        })
                        .animation(.easeIn)
                    }
                }//: HStack Search Bar
 
                Divider()
 
                Spacer()
            }//:VStack
 
                HStack{
                    Menu(homeData: HomeModel)
                        .offset(x: HomeModel.showMenu ? 0 : -UIScreen.main.bounds.width / 1.6)
 
                    Spacer(minLength: 0)
 
                }//:HStack Menu
                .background(Color.black.opacity(HomeModel.showMenu ? 0.3 : 0).ignoresSafeArea()
                                .onTapGesture(perform: {
                                    withAnimation(.easeIn){HomeModel.showMenu.toggle()}
                                })
                )
 
            if HomeModel.noLocation {
                Text("Please Enable Location Acces In Settings To Futher Move on !!")
                    .foregroundColor(.black)
                    .frame(width: UIScreen.main.bounds.width - 100, height: 120)
                    .background(Color.white)
                    .cornerRadius(10)
                    .frame(minWidth: .infinity, maxWidth: .infinity)
                    .background(Color.black.opacity(0.3).ignoresSafeArea())
            }
 
        }//: ZSatck
        .onAppear(perform: {
           HomeModel.locationManager.delegate = HomeModel
        })
    }
}
 
 
//: Mark Preview
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
