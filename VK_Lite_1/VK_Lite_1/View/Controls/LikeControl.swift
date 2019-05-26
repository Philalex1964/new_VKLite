//
//  LikeControl.swift
//  VK_Lite_1
//
//  Created by Александр Филиппов on 17.04.2019.
//  Copyright © 2019 Philalex. All rights reserved.
//

import UIKit

class LikeControl: UIControl {

    public var isLiked: Bool = false
    let heartImageView = UIImageView()
    let likeNumberLabel = UILabel()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupView()
    }
    
    private func setupView() {
        
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(likeTapped))
        heartImageView.isUserInteractionEnabled = true
        heartImageView.addGestureRecognizer(tapGR)
        heartImageView.image = UIImage(named: "heart")
        addSubview(heartImageView)
        addSubview(likeNumberLabel)
        likeNumberLabel.text = "0"
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        heartImageView.translatesAutoresizingMaskIntoConstraints = false
        likeNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            heartImageView.heightAnchor.constraint(equalToConstant: bounds.height),
            heartImageView.widthAnchor.constraint(equalTo: heartImageView.heightAnchor),
            heartImageView.topAnchor.constraint(equalTo: self.topAnchor),
            heartImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            likeNumberLabel.trailingAnchor.constraint(equalTo: heartImageView.leadingAnchor),
            likeNumberLabel.widthAnchor.constraint(equalToConstant: 20),
            likeNumberLabel.bottomAnchor.constraint(equalTo: heartImageView.bottomAnchor)
            ])
    }
    
    //MARK: - Privates
    @objc func likeTapped() {
        isLiked.toggle()
        likeNumberLabel.textColor = isLiked ? .red : .black
        
        if isLiked == true {
        UIView.transition(with: likeNumberLabel,
                          duration: 1,
                          options: .transitionCrossDissolve,
                          animations: {
                            self.likeNumberLabel.text = "1"
                          })
        UIView.transition(with: heartImageView,
                          duration: 1,
                          options: .transitionCrossDissolve,
                          animations: {
                            self.heartImageView.image = UIImage(named: "heartred")
                          })
        } else {
            UIView.transition(with: likeNumberLabel,
                              duration: 1,
                              options: .transitionCrossDissolve,
                              animations: {
                                self.likeNumberLabel.text = "0"
                              })
            UIView.transition(with: heartImageView,
                              duration: 1,
                              options: .transitionCrossDissolve,
                              animations: {
                                self.heartImageView.image = UIImage(named: "heart")
                              })
          }

        sendActions(for: .valueChanged)
    }
}



