//
//  MainViewController.swift
//  gif
//
//  Created by Monkey hammer on 2022/10/11.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addChilds()
    }
    private func addChilds() {
        // tabBar.tintColor = UIColor.darkGray
        tabBar.tintColor = UIColor.gray
        addChild(BearViewController(), "熊卷的多动症", "封面图片 2")
        addChild(KingViewController(), "秦始皇", "封面图片")
        addChild(___ViewController(), "自定义图片展示", system: "pencil.slash")
        addChild(GifViewController(), "从URL里获取gif或图片", system: "pencil.slash")
    }
    private func addChild(_ vc: UIViewController,_ title: String, _ imageName: String) {
        vc.title = title
        vc.tabBarItem.image = UIImage(named: imageName)
        let nav = UINavigationController(rootViewController: vc)
        addChild(nav)
    }
    private func addChild(_ vc: UIViewController,_ title: String,  system imageName: String) {
        vc.title = title
        vc.tabBarItem.image = UIImage(systemName: imageName)
        let nav = UINavigationController(rootViewController: vc)
        addChild(nav)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
