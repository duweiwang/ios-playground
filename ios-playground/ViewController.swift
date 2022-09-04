//
//  ViewController.swift
//  ios-playground
//
//  Created by 王杜伟 on 2022/8/23.
// https://swiftwithmajid.com/2022/08/10/mastering-grid-layout-in-swiftui/
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // 必须实现的方法
    func tableView(_: UITableView, numberOfRowsInSection section: Int) -> Int {
        return info[section].count
    }

    // 必须实现的方法
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 取得 tableView 目前使用的 cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell

        // 設置 Accessory 按鈕樣式
        if indexPath.section == 1 {
            if indexPath.row == 0 {
                cell.accessoryType = .checkmark
            } else if indexPath.row == 1 {
                cell.accessoryType = .detailButton
            } else if indexPath.row == 2 {
                cell.accessoryType = .detailDisclosureButton
            } else if indexPath.row == 3 {
                cell.accessoryType = .disclosureIndicator
            }
        }

        // 顯示的內容
        if let myLabel = cell.textLabel {
            myLabel.text =
                "\(info[indexPath.section][indexPath.row].name)"
        }

        return cell
    }

    let info = [
        [
            DemoItem(name: "Button", vc: ButtonVC()),
            DemoItem(name: "Text", vc: TextVC()),
        ],
        [
            DemoItem(name: "VStack", vc: VStackDemo()),
            DemoItem(name: "HStack", vc: ButtonVC()),
            DemoItem(name: "ZStack", vc: ButtonVC()),
            DemoItem(name: "Scroll", vc: ButtonVC()),
            DemoItem(name: "Text", vc: TextDemo()),
            DemoItem(name: "Image", vc: ImageDemo()),
            DemoItem(name: "Frame", vc: FrameDemo()),
            DemoItem(name: "Gride", vc: GridDemo()),
            DemoItem(name: "Alignment", vc: AlignmentDemo()),
            DemoItem(name: "List", vc: ListDemo()),
            DemoItem(name: "TextField", vc: TextFieldDemo()),
        ],
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpTitle()

        setUpTableView()
    }

    func setUpTableView() {
        let fullScreenSize = UIScreen.main.bounds.size

        let myTableView = UITableView(frame: CGRect(
            x: 0, y: 20,
            width: fullScreenSize.width,
            height: fullScreenSize.height - 20
        ), style: .grouped)

        // 註冊 cell
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")

        // 設置委任對象
        myTableView.delegate = self
        myTableView.dataSource = self

        // 分隔線的樣式
        myTableView.separatorStyle = .singleLine

        // 分隔線的間距 四個數值分別代表 上、左、下、右 的間距
        myTableView.separatorInset =
            UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)

        // 是否可以點選 cell
        myTableView.allowsSelection = true

        // 是否可以多選 cell
        myTableView.allowsMultipleSelection = false

        // 加入到畫面中
        view.addSubview(myTableView)
    }

    func setUpTitle() {
        title = "Demo List"
        navigationItem.rightBarButtonItem =
            UIBarButtonItem(title: "more",
                            style: .done,
                            target: self,
                            action: #selector(moreClick))
    }

    @objc func moreClick() {
        print("click more...")
    }

    // 點選 cell 後執行的動作
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 取消 cell 的選取狀態
        tableView.deselectRow(at: indexPath, animated: true)

        let item = info[indexPath.section][indexPath.row]

        navigationController?.pushViewController(item.vc, animated: true)

        print("選擇的是 \(item.name)")
    }

    // 點選 Accessory 按鈕後執行的動作
    // 必須設置 cell 的 accessoryType
    // 設置為 .DisclosureIndicator (向右箭頭)之外都會觸發
    func tableView(_: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let demoItem = info[indexPath.section][indexPath.row]
        print("按下的是 \(demoItem.name) 的 detail")
    }

    // 有幾組 section
    func numberOfSections(in _: UITableView) -> Int {
        return info.count
    }

    // 每個 section 的標題
    func tableView(_: UITableView, titleForHeaderInSection section: Int) -> String? {
        let title = section == 0 ? "UIKit" : "SwiftUI"
        return title
    }
}
