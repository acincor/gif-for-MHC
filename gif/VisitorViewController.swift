//
//  MainViewController.swift
//  gif
//
//  Created by Monkey hammer on 2022/10/11.
//

import UIKit
import SnapKit
import SwiftGifOrigin
import SwiftUI

class VisitorViewController: UIViewController {
    static let VisitorShared: VisitorViewController = VisitorViewController()
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    var imageView = UIImageView(image: UIImage(named: "MHC提示界面"))
    @objc func touchTheButton() {
        // 此方法如下
        // imageView.loadGif(name: "")
        // ButtonView.isHidden = true
        // imageView.snp.makeConstraints { make in
            // make.height.equalTo(500)
        // }
    }
    let cardView = UIImageView(image: UIImage(named: "App"))
    var ButtonView = UIButton(title: "播放我的gif", color: .white, backImageName: "MHC",backColor: .red)
}
