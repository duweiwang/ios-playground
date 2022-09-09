////
////  DragDropDemo.swift
////  ios-playground
////
////  Created by 王杜伟 on 2022/9/7.
////
//
//import SwiftUI
//import Cocoa
//
//class DragDropDemo: SwiftWithUikitVC<DragDropView> {
//    override var body: DragDropView {
//        DragDropView()
//    }
//}
//
//struct DragDropView: View {
//    let img1url = Bundle.main.url(forResource: "Images/grapes", withExtension: "png")
//    let img2url = Bundle.main.url(forResource: "Images/banana", withExtension: "png")
//    let img3url = Bundle.main.url(forResource: "Images/peach", withExtension: "png")
//    let img4url = Bundle.main.url(forResource: "Images/kiwi", withExtension: "png")
//
//    var body: some View {
//        HStack {
//            VStack {
//                DragableImage(url: img1url!)
//
//                DragableImage(url: img3url!)
//            }
//
//            VStack {
//                DragableImage(url: img2url!)
//
//                DragableImage(url: img4url!)
//            }
//
//            DroppableArea()
//        }.padding(40)
//    }
//
//    struct DragableImage: View {
//           let url: URL
//
//           var body: some View {
//               Image(nsImage: NSImage(byReferencing: url))
//                   .resizable()
//                   .frame(width: 150, height: 150)
//                   .clipShape(Circle())
//                   .overlay(Circle().stroke(Color.white, lineWidth: 2))
//                   .padding(2)
//                   .overlay(Circle().strokeBorder(Color.black.opacity(0.1)))
//                   .shadow(radius: 3)
//                   .padding(4)
//                   .onDrag { return NSItemProvider(object: self.url as NSURL) }
//           }
//       }
//
//    struct DroppableArea: View {
//           @State private var imageUrls: [Int: URL] = [:]
//           @State private var active = 0
//
//           var body: some View {
//               let dropDelegate = MyDropDelegate(imageUrls: $imageUrls, active: $active)
//
//               return VStack {
//                   HStack {
//                       GridCell(active: self.active == 1, url: imageUrls[1])
//
//                       GridCell(active: self.active == 3, url: imageUrls[3])
//                   }
//
//                   HStack {
//                       GridCell(active: self.active == 2, url: imageUrls[2])
//
//                       GridCell(active: self.active == 4, url: imageUrls[4])
//                   }
//
//               }
//               .background(Rectangle().fill(Color.gray))
//               .frame(width: 300, height: 300)
//               .onDrop(of: ["public.file-url"], delegate: dropDelegate)
//
//           }
//       }
//
//
//    struct GridCell: View {
//            let active: Bool
//            let url: URL?
//
//            var body: some View {
//                let img = Image(nsImage: url != nil ? NSImage(byReferencing: url!) : NSImage())
//                    .resizable()
//                    .frame(width: 150, height: 150)
//
//                return Rectangle()
//                    .fill(self.active ? Color.green : Color.clear)
//                    .frame(width: 150, height: 150)
//                    .overlay(img)
//            }
//        }
//
//
//    struct MyDropDelegate: DropDelegate {
//            @Binding var imageUrls: [Int: URL]
//            @Binding var active: Int
//
//            func validateDrop(info: DropInfo) -> Bool {
//                return info.hasItemsConforming(to: ["public.file-url"])
//            }
//
//            func dropEntered(info: DropInfo) {
//                NSSound(named: "Morse")?.play()
//            }
//
//            func performDrop(info: DropInfo) -> Bool {
//                NSSound(named: "Submarine")?.play()
//
//                let gridPosition = getGridPosition(location: info.location)
//                self.active = gridPosition
//
//                if let item = info.itemProviders(for: ["public.file-url"]).first {
//                    item.loadItem(forTypeIdentifier: "public.file-url", options: nil) { (urlData, error) in
//                        DispatchQueue.main.async {
//                            if let urlData = urlData as? Data {
//                                self.imageUrls[gridPosition] = NSURL(absoluteURLWithDataRepresentation: urlData, relativeTo: nil) as URL
//                            }
//                        }
//                    }
//
//                    return true
//
//                } else {
//                    return false
//                }
//
//            }
//
//            func dropUpdated(info: DropInfo) -> DropProposal? {
//                self.active = getGridPosition(location: info.location)
//
//                return nil
//            }
//
//            func dropExited(info: DropInfo) {
//                self.active = 0
//            }
//
//            func getGridPosition(location: CGPoint) -> Int {
//                if location.x > 150 && location.y > 150 {
//                    return 4
//                } else if location.x > 150 && location.y < 150 {
//                    return 3
//                } else if location.x < 150 && location.y > 150 {
//                    return 2
//                } else if location.x < 150 && location.y < 150 {
//                    return 1
//                } else {
//                    return 0
//                }
//            }
//        }
//}
//
//struct DragDropDemo_Previews: PreviewProvider {
//    static var previews: some View {
//        DragDropView()
//    }
//}
