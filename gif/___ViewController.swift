//
//  自定义ViewController.swift
//  gif
//
//  Created by Monkey hammer on 2022/10/28.
//

import UIKit
import SwiftUI
import SwiftGifOrigin
import PhotosUI

class ___ViewController: VisitorViewController {
    var button : UIButton!
    var newButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        newButton = UIButton(title: "自定义png", color: .white, backImageName: "MHC for png")
        newButton.addTarget(self, action: #selector(touchButton), for: .touchUpInside)
        view.addSubview(newButton)
        newButton.snp.makeConstraints { make in
            make.size.equalTo(view.snp.size)
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
    @objc func touchButton() {
        newButton.isHidden = true
        view.addSubview(cardView)
        cardView.isHidden = false
        ButtonView.isHidden = true
        imageView.backgroundColor = UIColor.cyan
        imageView.sizeToFit()
        self.view.addSubview(imageView)
        imageView.isUserInteractionEnabled = true
        button = UIButton(title: "选择你的图片", color: .blue, backImageName: "App")
        button.addTarget(self,action:#selector(___ViewController.huantu),for:.touchUpInside)
        self.view.addSubview(button)
        cardView.snp.makeConstraints { make in
            make.center.equalTo(view.snp.center)
            make.centerX.equalTo(view.snp.centerX)
            make.centerY.equalTo(view.snp.centerY)
            make.size.equalTo(view.snp.size)
        }
        button.snp.makeConstraints { make in
            make.centerX.equalTo(imageView.snp.centerX)
            make.center.equalTo(imageView.snp.center)
            make.centerY.equalTo(imageView.snp.centerY)
            make.size.equalTo(imageView.snp.size)
        }
        ButtonView.addTarget(self, action: #selector(touchTheButton), for: .touchUpInside)
        imageView.snp.makeConstraints { make in
            make.center.equalTo(cardView.snp.center)
            make.size.equalTo(cardView.snp.size).multipliedBy(0.6)
        }
    }
}
extension ___ViewController {
        var selectorController: UIAlertController {
            let controller = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            controller.addAction(UIAlertAction(title: "取消", style: .cancel, handler: nil)) // 取消按钮
            controller.addAction(UIAlertAction(title: "拍照选择", style: .default) { action in
                self.selectorSourceType(type: .camera)
            }) // 拍照选择
            controller.addAction(UIAlertAction(title: "相册选择", style: .default) { action in
                self.selectorSourceType(type: .photoLibrary)
            }) // 相册选择
        return controller
    }
    
    @objc func huantu(){
        present(selectorController, animated: true, completion: nil)
        
    }
    
    func selectorSourceType(type: UIImagePickerController.SourceType) {
        imagePickerController.sourceType = type
        // 打开图片选择器
        present(imagePickerController, animated: true, completion: nil)
    }
    
}
extension ___ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: 图片选择器界面
    var imagePickerController: UIImagePickerController {
        get {
            let imagePicket = UIImagePickerController()
            imagePicket.delegate = self
            imagePicket.sourceType = .photoLibrary
            return imagePicket
        }
    }
    
    // MARK: 当图片选择器选择了一张图片之后回调
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        dismiss(animated: true, completion: nil) // 选中图片, 关闭选择器...这里你也可以 picker.dismissViewControllerAnimated 这样调用...但是效果都是一样的...
        button.isHidden = true
        imageView.image = info[UIImagePickerController.InfoKey(rawValue: UIImagePickerController.InfoKey.originalImage.rawValue)] as? UIImage
        // 显示图片
        imageView.contentMode = .scaleToFill // 缩放显示, 便于查看全部的图片
    }
    // MARK: 当点击图片选择器中的取消按钮时回调
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil) // 效果一样的...
    }
}
