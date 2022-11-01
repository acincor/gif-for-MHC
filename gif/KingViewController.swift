//
//  KingViewController.swift
//  gif
//
//  Created by Monkey hammer on 2022/10/11.
//

import UIKit

class KingViewController: VisitorViewController {
    override func touchTheButton() {
        imageView.loadGif(name: "秦始皇")
        ButtonView.isHidden = true
        imageView.snp.makeConstraints { make in
            make.height.equalTo(500)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(cardView)
        view.addSubview(imageView)
        view.addSubview(ButtonView)
        
        ButtonView.snp.makeConstraints { make in
            make.center.equalTo(cardView.snp.center)
            make.size.equalTo(cardView.snp.size).multipliedBy(0.6)
        }
        cardView.snp.makeConstraints { make in
            make.center.equalTo(view.snp.center)
            make.centerX.equalTo(view.snp.centerX)
            make.centerY.equalTo(view.snp.centerY)
            make.size.equalTo(view.snp.size)
        }
        ButtonView.addTarget(self, action: #selector(touchTheButton), for: .touchUpInside)
        imageView.snp.makeConstraints { make in
            make.center.equalTo(cardView.snp.center)
            make.size.equalTo(cardView.snp.size).multipliedBy(0.6)
        }
        
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
