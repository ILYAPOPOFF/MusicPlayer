//
//  ModalController.swift
//  UISlider(06-ДЗ.2)
//
//  Created by ILYA POPOV on 31.10.2022.
//

import UIKit



class ModalController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        let label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "Tap to dismiss"
        label.textColor = .black
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(
            UITapGestureRecognizer(target: self, action: #selector(labelDidTap))
        )
        
        view.addSubview(label)
        self.view = view
    }
    
    @objc
    private func labelDidTap() {
        dismiss(animated: true, completion: nil)
    }
    }
    
    

