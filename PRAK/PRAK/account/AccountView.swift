//
//  AccountView.swift
//  Bobbyn
//
//  Created by Brainmobi on 31/07/26.
//

import SwiftUI

struct AccountView: View {
    
    @ObservedObject var store:StoreViewModel
    var accountSection:[accountModel] {
        get{
            [YourAccount,support]
        }
    }
    
    let YourAccount = accountModel(Headertitle: "Your Account", celldata: [Celldata(cellTitle: "Orders", cellSubTitle: "No oders yet", dest: .orders),Celldata(cellTitle: "Saved Addresses", cellSubTitle: "Manage delivery Locations", dest: .savedAdress)])
    
    let support = accountModel(Headertitle: "SUPPORT", celldata: [Celldata(cellTitle: "Shipping & Return", cellSubTitle: "Free shipping over ₹1299", dest: .shippingReturn),Celldata(cellTitle: "Size Guide", cellSubTitle: "Oversize fit refrences", dest: .sizeGuide),Celldata(cellTitle: "Help & contacts", cellSubTitle: "FAQ and support hours", dest: .FAQ)])
    
    
    var body: some View {
        NavigationStack{
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                Text("Account").font(.system(size: 28, weight: .medium, design: .serif)).tracking(2).padding(.top, 18)
                Text("Manage order,sizes, and support.").font(.system(size: 14)).foregroundStyle(.secondary).padding(.top,0)
                    .padding(.bottom,20)
                profileview()
                    .padding(.bottom,20)
                HStack {
                    statView(value: "0", title: "Orders")
                    
                    Divider()
                        .frame(height: 40)
                    
                    statView(value: "2", title: "Saved")
                    
                    Divider()
                        .frame(height: 40)
                    
                    statView(value: "0", title: "In Bag")
                    
                    
                }
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding()
                .background(
                    Color.bobbynSand
                )
                
                LazyVStack(alignment: .leading, spacing: 10) {
                    
                    ForEach(accountSection) { section in
                        
                        Text(section.Headertitle)
                            .font(.bodyFont)
                            .padding(.top, 10)
                        
                        VStack(alignment: .leading, spacing: 0) {
                            
                            ForEach(Array(section.celldata.enumerated()),id: \.element.id) {index,cell in
                                
                                NavigationLink {
                                    switch cell.dest {
                                    case .orders:
                                        orderListview(store: store)
                                    case .profile:
                                        orderListview(store: store)
                                    case .savedAdress:
                                        orderListview(store: store)
                                    case .shippingReturn:
                                        orderListview(store: store)
                                    case .sizeGuide:
                                        orderListview(store: store)
                                    case .helpcontacts:
                                        orderListview(store: store)
                                    case .FAQ:
                                        orderListview(store: store)
                                    }
                                } label:{
                                    VStack(alignment: .leading) {
                                        
                                        Text(cell.cellTitle)
                                            .font(.bodyFont)
                                        
                                        HStack{
                                            Text(cell.cellSubTitle)
                                                .font(.captionFont)
                                                .foregroundStyle(.secondary)
                                            Spacer()
                                            
                                            Button {
                                                print("button click")
                                            } label: {
                                                Image(systemName: "arrow.up.right")
                                                    .foregroundColor(.secondary)
                                            }
                                        }
                                        
                                        if index != section.celldata.count-1{
                                            Divider()
                                        }
                                        
                                    }
                                    .padding()

                                }
                                .buttonStyle(.plain)
                                
                            }
                        }
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .background(Color.bobbynSand)
                    }
                }
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            .padding()
        }
    }
        
        
    }
}

struct profileview: View {
    var body: some View {
        HStack{
            Text("G").font(.titleFont)
                .foregroundStyle(.white)
                .frame(width: 50, height: 50)
                .background(
                    Circle()
                )
            VStack(alignment: .leading){
                Text("Guest").font(.bodyFont)
                Text("sign in to sync orders & address").font(.captionFont)
                    .foregroundStyle(.secondary)
                
            }
        }
        .frame(maxWidth: .infinity,alignment: .leading)
        .padding()
        .background(
            Color.bobbynSand
        )
    }
}

struct statView: View {
    
    let value: String
    let title: String
    
    var body: some View {
        VStack(spacing: 8) {
            Text(value)
                .font(.bodyFont)
                .foregroundStyle(.black)
            
            Text(title)
                .font(.captionFont)
                .foregroundStyle(.gray)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    AccountView(store: StoreViewModel())
}


extension Font {
    static let titleFont = Font.system(size: 28, weight: .medium,design: .serif)
    static let bodyFont = Font.system(size: 16,weight: .regular,design: .serif)
    static let captionFont = Font.system(size: 14,weight: .regular,design: .serif)
}


struct accountModel:Identifiable{
    let id = UUID()
    let Headertitle:String
    let celldata:[Celldata]
}

struct Celldata:Identifiable{
    let id = UUID()
    let cellTitle: String
    let cellSubTitle: String
    let  dest: AccountDestination
}

enum AccountDestination {
    case profile
    case orders
    case savedAdress
    case shippingReturn
    case sizeGuide
    case helpcontacts
    case FAQ
}
