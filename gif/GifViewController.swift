//
//  GifViewController.swift
//  gif
//
//  Created by Monkey hammer on 2022/10/29.
//

import UIKit
import SwiftUI
import Photos
import SVProgressHUD

class GifViewController: VisitorViewController,UITextFieldDelegate {
    var ViewImage = UIImageView(image: UIImage(named: "MHC for png"))
    var textField: UITextField = UITextField(frame: VisitorShared.view.bounds)
    override func viewDidLoad() {
        super.viewDidLoad()
        let TextView = {
            let text = UITextView()
            text.text = "从URL里获取gif或图片（输入到下面的文本框，并按下return键，提示：可以使用z4a图床）"
            text.textColor = .black
            text.frame = CGRectMake(50, 300, 300, 200)
            text.font = UIFont(name: "Helvetica-Bold", size: 18)
            text.backgroundColor = .brown
            text.sizeToFit()
            return text
        }()
        self.view.addSubview(ViewImage)
        ViewImage.snp.makeConstraints { make in
            make.size.equalTo(view.snp.size)
        }
        textField.delegate=self
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.placeholder="Input your gif url: "
        self.view.addSubview(TextView)
        self.view.addSubview(textField)
        textField.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.centerY.equalTo(view.snp.centerY)
        }
        /** 水平对齐 **/
        textField.textAlignment = .right //水平右对齐
        textField.textAlignment = .center //水平居中对齐
        textField.textAlignment = .left //水平左对齐

        /** 垂直对齐 **/
        textField.contentVerticalAlignment = .top  //垂直向上对齐
        textField.contentVerticalAlignment = .center  //垂直居中对齐
        textField.contentVerticalAlignment = .bottom  //垂直向下对齐
        textField.returnKeyType = UIReturnKeyType.done
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if textField.text != nil {
            let url = URL(string: textField.text!)
            if url != nil {
                let data = try? NSData(contentsOf: url!)
                do {
                    if textField.text?.hasSuffix(".gif") == true {
                        PHPhotoLibrary.shared().performChanges {
                            PHAssetCreationRequest.forAsset().addResource(with: .photo, data: data! as Data, options: PHAssetResourceCreationOptions())
                        }
                    } else {
                        guard data != nil else {
                            SVProgressHUD.showInfo(withStatus: "下载失败，请使用只有图片或gif的url链接")
                            return false
                        }
                        guard let image = UIImage(data: data! as Data) else {
                            SVProgressHUD.showInfo(withStatus: "下载失败，请使用只有图片或gif的url链接")
                            return false
                        }
                        try UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                    }
                    SVProgressHUD.showInfo(withStatus: "下载成功")
                }
            } else {
                SVProgressHUD.showInfo(withStatus: "不能为空")
                return false
            }
        }
        return false
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    // 键盘 delegate 协议必须的方法
        func keyWasTapped(character: String) {
            textField.insertText(character)
        }
}
