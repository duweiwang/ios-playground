//
//  NavigationDemo.swift
//  ios-playground
//
//  Created by 王杜伟 on 2022/9/7.
//
// matchedGeometryEffect,一个进入，一个退出
//
//

import SwiftUI

class NavigationDemo: SwiftWithUikitVC<NavigationView> {
    override var body: NavigationView {
        NavigationView()
    }
}

struct NavigationView: View {
    var body: some View {
        VStack {
            NavigationLink(destination: Animation1()) {
                Text("同一个View动画").padding()
            }
            
            Group {
                Divider()
                NavigationLink(destination: Animation2()) {
                    Text("同一图层不同View动画（替换关系）").padding()
                }
            }
          
            Group {
                Divider()
                NavigationLink(destination: Animation3()) {
                    Text("不同图层不同View动画（非替换关系）").padding()
                }
            }
           
            Group {
                Divider()
                NavigationLink(destination: SwitchViewExample()) {
                    Text("简单的切换View").padding()
                }
            }
          
            Group {
                Divider()
                NavigationLink(destination: SwitchViewAnimationExample()) {
                    Text("动画切换View").padding()
                }
            }
          
            Group {
                Divider()
                NavigationLink(destination: matchedGeometryEffectExample()) {
                    Text("matchedGeometryEffectExample").padding()
                }
            }
         
        }
    }
}

struct SwitchViewExample: View {
    @State private var flag: Bool = true

        var body: some View {
            HStack {
                if flag {
                    Rectangle().fill(Color.green).frame(width: 100, height: 100)
                }
                Spacer()
                Button("Switch") { flag.toggle() }
                Spacer()
                if !flag {
                    Circle().fill(Color.blue).frame(width: 50, height: 50)
                }
            }.frame(width: 400).border(Color.gray, width: 3)
        }
}

struct SwitchViewAnimationExample: View {
    @State private var flag: Bool = true

        var body: some View {
            HStack {
                if flag {
                    Rectangle().fill(Color.green).frame(width: 100, height: 100)
                }
                Spacer()
                Button("Switch") { withAnimation(.easeInOut(duration: 2.0)) { flag.toggle() } }
                Spacer()
                if !flag {
                    Circle().fill(Color.blue).frame(width: 50, height: 50)
                }
            }.frame(width: 400).border(Color.gray, width: 3)
        }
}

struct matchedGeometryEffectExample: View {
    @Namespace var nspace
        @State private var flag: Bool = true

        var body: some View {
            HStack {
                if flag {
                    Rectangle().fill(Color.green)
                        .matchedGeometryEffect(id: "geoeffect1", in: nspace)
                        .frame(width: 100, height: 100)
                }

                Spacer()

                Button("Switch") { withAnimation(.easeInOut(duration: 2.0)) { flag.toggle() } }

                Spacer()

                if !flag {
                    Circle()
                        .fill(Color.blue)
                        .matchedGeometryEffect(id: "geoeffect1", in: nspace)
                        .frame(width: 50, height: 50)
                }
            }
            .frame(width: 250).padding(10).border(Color.gray, width: 3)
        }
}

struct Animation1: View {
    @State private var zoomValue = 1.0
    
    var body: some View {
        VStack {
            Spacer()
            Circle()
                .fill(Color.blue)
                .frame(width: 100, height: 100)
                .scaleEffect(zoomValue)
                
            Spacer()
            HStack(alignment: .center) {
                Button("放大") {
                    withAnimation(.spring()) {
                        zoomValue = 1.5
                    }
                }
                Color.clear.frame(width: 32)
                Button("缩小") {
                    withAnimation(.spring()) {
                        zoomValue = 0.8
                    }
                }
            }
            .frame(height: 48)
        }
    }
}

struct Animation2: View {
    @Namespace private var namespace
    @State private var show = false
    
    var body: some View {
        VStack {
            if show {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.blue)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .matchedGeometryEffect(id: "id1", in: namespace)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            show = false
                        }
                    }
            } else {
                Circle()
                    .fill(Color.blue)
                    .frame(width: 48, height: 48)
                    .overlay(Image(systemName: "plus")
                        .foregroundColor(Color.white))
                    .matchedGeometryEffect(id: "id1", in: namespace)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                    .padding()
                    .onTapGesture {
                        withAnimation(.spring()) {
                            show = true
                        }
                    }
            }
        }.navigationViewStyle(.stack)
    }
}

struct Animation3: View {
    @Namespace var namespace
    @State var show: Bool = false
    @State var selectedIndex: Int = 0
    
    var body: some View {
        ZStack {
            ScrollView(.vertical) {
                VStack {
                    if show {
                        ForEach(0 ..< 100) { _ in
                            Rectangle()
                                .fill(Color.clear)
                                .frame(maxWidth: .infinity)
                                .frame(height: 50)
                                .padding()
                                .background(Color.clear)
                                .padding()
                        }

                    } else {
                        ForEach(0 ..< 100) { index in
                            
                            HStack {
                                Image("111")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 50, height: 50, alignment: .center)
                                    .clipShape(Circle())
                                    .matchedGeometryEffect(id: "Image\(index)", in: namespace, anchor: .center, isSource: true)
                                
                                Text("测试\(index)")
                                    .matchedGeometryEffect(id: "Text\(index)", in: namespace, isSource: true)
                            }
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                            .frame(height: 50)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white)
                                .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
                                .matchedGeometryEffect(id: "background\(index)", in: namespace, isSource: true))
                            .padding()
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    selectedIndex = index
                                    show = true
                                }
                            }
                        }
                    }
                }
            }
            
            if show {
                ModalView(namespace: namespace, show: $show, index: $selectedIndex)
                    .zIndex(1)
            }
        }
    }
}

struct ModalView: View {
    var namespace: Namespace.ID
    
    @Binding var show: Bool
    @Binding var index: Int
    
    var body: some View {
        ZStack {
            VStack {
                Image("111")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
                    .frame(width: 50, height: 50, alignment: .center)
                    .scaleEffect(2)
                    .matchedGeometryEffect(id: "Image\(index)", in: namespace, anchor: .center, isSource: true)
                
                Text("测试\(index)")
                    .padding(.top, 40)
                    .matchedGeometryEffect(id: "Text\(index)", in: namespace, isSource: true)
                
                Button("关闭") {
                    withAnimation(.spring()) {
                        show = false
                    }
                }
                .padding(.top, 80)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .background(RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
                .matchedGeometryEffect(id: "background\(index)", in: namespace, isSource: true))
        }.ignoresSafeArea()
    }
}

struct NavigationDemo_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView()
    }
}
