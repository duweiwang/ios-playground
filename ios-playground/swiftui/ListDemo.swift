//
//  ListDemo.swift
//  ios-playground
//
//  Created by 王杜伟 on 2022/9/3.
//

import SwiftUI
import UIKit

class ListDemo : SwiftWithUikitVC<ListView> {
    
    
    override var body: ListView {
        ListView()
    }
    
}

struct ListView :View {
    
    let items = [
        Item(name: "BeReal", scheme: "bere.al://"),///验证通过
        Item(name: "Twitter", scheme: "Twitter://"),///验证通过
        Item(name: "Whatsapp", scheme: "whatsapp://"),///验证通过
        Item(name: "Messenger", scheme: "fb-messenger://"),///验证通过
        Item(name: "Facebook", scheme: "fb://"),///验证通过
        Item(name: "Discord", scheme: "discord://"),///验证通过
        Item(name: "Instagram", scheme: "instagram://app"),///验证通过
        Item(name: "Pinterest", scheme: "pinterest://"),///验证通过
        Item(name: "Reddit", scheme: "reddit://"),///验证通过
        Item(name: "Snapchat", scheme: "snapchat://"),///验证通过
        Item(name: "Tinder", scheme: "tinder://"),///验证通过
        Item(name: "Tiktok", scheme: "tiktok://"),///验证通过
        Item(name: "Youtube", scheme: "youtube://"),///验证通过
        Item(name: "Netflix", scheme: "nflx://"),///验证通过
        Item(name: "Amazon", scheme: "com.amazon.mobile.shopping://"),///验证通过
        Item(name: "Google", scheme: "googlechrome://"),///验证通过
        Item(name: "Gmail", scheme: "googlegmail://"),///验证通过
        Item(name: "Google maps", scheme: "GoogleMaps://"),///验证通过
        Item(name: "Life360", scheme: "life360://"),///验证通过
        Item(name: "Pokemon Go", scheme: "PokemonGo://"),///验证通过
        Item(name: "Spotify", scheme: "spotify://"),///验证通过
        Item(name: "Roblox", scheme: "roblox://"),///验证通过
        Item(name: "Subway Surfers", scheme: "SubwaySurfers://"),///验证通过
        Item(name: "Candy Crush", scheme: "CandyCrushSaga://"),///验证通过
    ]
    
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(0..<items.count, id: \.self) { index in
                    let item = items[index]
                    Text(item.name)
                        .padding(.vertical,16)
                        .overlay(
                            Divider()
                                .background(Color.black.opacity(0.04)),
                            alignment: .bottom
                        ).onTapGesture {
                            UIApplication.shared.open(URL(string: item.scheme)!) { success in
                                print ("\(item.name) = \(success)")
                            }
                        }
                }
            }
        }
        
    }
    
    
    
}


struct Item {
    var name: String
    var scheme: String
}


