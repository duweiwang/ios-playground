//
//  ListDemo.swift
//  ios-playground
//
//  Created by 王杜伟 on 2022/9/3.
//

import SwiftUI
import UIKit

class ListDemo: SwiftWithUikitVC<ListView> {
    override var body: ListView {
        ListView()
    }
}

struct ListView: View {
    let items = [
        Item(name: "BeReal", scheme: "bere.al://"), /// 验证通过
        Item(name: "Twitter", scheme: "Twitter://"), /// 验证通过
        Item(name: "Whatsapp", scheme: "whatsapp://"), /// 验证通过
        Item(name: "Messenger", scheme: "fb-messenger://"), /// 验证通过
        Item(name: "Facebook", scheme: "fb://"), /// 验证通过
        Item(name: "Discord", scheme: "discord://"), /// 验证通过
        Item(name: "Instagram", scheme: "instagram://app"), /// 验证通过
        Item(name: "Pinterest", scheme: "pinterest://"), /// 验证通过
        Item(name: "Reddit", scheme: "reddit://"), /// 验证通过
        Item(name: "Snapchat", scheme: "snapchat://"), /// 验证通过
        Item(name: "Tinder", scheme: "tinder://"), /// 验证通过
        Item(name: "Tiktok", scheme: "tiktok://"), /// 验证通过
        Item(name: "Youtube", scheme: "youtube://"), /// 验证通过
        Item(name: "Netflix", scheme: "nflx://"), /// 验证通过
        Item(name: "Amazon", scheme: "com.amazon.mobile.shopping://"), /// 验证通过
        Item(name: "Google", scheme: "googlechrome://"), /// 验证通过
        Item(name: "Gmail", scheme: "googlegmail://"), /// 验证通过
        Item(name: "Google maps", scheme: "GoogleMaps://"), /// 验证通过
        Item(name: "Life360", scheme: "life360://"), /// 验证通过
        Item(name: "Pokemon Go", scheme: "PokemonGo://"), /// 验证通过
        Item(name: "Spotify", scheme: "spotify://"), /// 验证通过
        Item(name: "Roblox", scheme: "roblox://"), /// 验证通过
        Item(name: "Subway Surfers", scheme: "SubwaySurfers://"), /// 验证通过
        Item(name: "Candy Crush", scheme: "CandyCrushSaga://"), /// 验证通过
        ///
        Item(name: "Books", scheme: "ibooks://"),///验证通过
      
      
        Item(name: "TV", scheme: "videos://"),///验证通过
        Item(name: "Mail", scheme: "message://"),///验证通过
        Item(name: "Maps", scheme: "maps://"),/// 验证通过
        Item(name: "Messages", scheme: "messages://"),///验证通过
        Item(name: "Music", scheme: "music://"),///验证通过
        Item(name: "Photos", scheme: "photos-redirect://"),/// 验证通过
        ///
        Item(name: "Podcasts", scheme: "podcast://"),/// 验证通过
        Item(name: "Safari", scheme: "x-web-search://"),/// 验证通过
        Item(name: "备忘录", scheme: "mobilenotes://"),///验证通过
        Item(name: "Wallet", scheme: "wallet://"),//shoebox://    /// 验证通过
        
        Item(name: "Calculator", scheme: "shortcuts://x-callback-url/run-shortcut?x-error=calc://"),///
        Item(name: "指南针", scheme: ""),
        Item(name: "Phone", scheme: "telprompt://"),
        Item(name: "Phone-2", scheme: "shortcuts://x-callback-url/run-shortcut?x-error=mobilephone://"),
        Item(name: "Translate", scheme: "itranslate://"),
        Item(name: "Magnifier", scheme: "CandyCrushSaga://"),
        Item(name: "Contact", scheme: "shortcuts://x-callback-url/run-shortcut?x-error=contact://"),
        Item(name: "日历", scheme: "calsjow://"),
        Item(name: "设置", scheme: "com.apple.preferences://"),
        Item(name: "相机", scheme: "shortcuts://x-callback-url/run-shortcut?x-error=camera://"),
        Item(name: "天气", scheme: "shortcuts://x-callback-url/run-shortcut?x-error=weather://"),
        Item(name: "1password", scheme: "onepassword://"),
    ]

    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(0 ..< items.count, id: \.self) { index in
                    let item = items[index]
                    Text(item.name)
                        .padding(.vertical, 16)
                        .overlay(
                            Divider()
                                .background(Color.black.opacity(0.04)),
                            alignment: .bottom
                        ).onTapGesture {
                            UIApplication.shared.open(URL(string: item.scheme)!) { success in
                                print("\(item.name) = \(success)")
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
