//
//  StatePassDemo.swift
//  ios-playground
//
//  Created by 王杜伟 on 2022/10/25.
//

///
///
/// 传递状态参数到比较深的子View
///
import SwiftUI
import UIKit

class StatePassDemo: SwiftWithUikitVC<StatePassView> {
    override var body: StatePassView {
        StatePassView()
    }
}

struct StatePassView: View {
    @ObservedObject var sports = SportData()

    var body: some View {
        NavigationView {
            List {
                ForEach($sports.store) { sport in
                    NavigationLink(destination: ScreenTwo(sport: sport)) {
                        HStack {
//                                    Text(sport.value.name)
//                                    Spacer()
//                                    Text(sport.value.isFavorite.description)
                        }
                    }
                }
            }
        }.navigationBarTitle("Settings")
    }
}

struct ScreenTwo: View {
    @Binding var sport: Sport

    var body: some View {
        NavigationLink(destination: DetailsView(sport: $sport)) {
            Text(sport.isFavorite.description)
        }
    }
}

struct DetailsView: View {
    @Binding var sport: Sport

    var body: some View {
        Button(action: {
            self.sport.isFavorite.toggle()
            self.sport.name = "Ricky"
        }) {
            Text(sport.isFavorite.description)
            Text(sport.name)
        }
    }
}

struct Sport: Identifiable {
    var id = UUID()
    var name: String
    var isFavorite = false
    var school: String
}

final class SportData: ObservableObject {
    @Published var store =
        [
            Sport(name: "soccer", isFavorite: false, school: "WPI"),
            Sport(name: "tennis", isFavorite: false, school: "WPI"),
            Sport(name: "swimming", isFavorite: true, school: "WPI"),
            Sport(name: "running", isFavorite: true, school: "RIT"),
        ]
}
