//
//  HeaderView.swift
//  TopEvent
//
//  Created by Владислав Патраков on 03.06.2022.
//

import Foundation
import UIKit

class HeaderView: UIView {
    
    private enum Constants {
        static let xFrame: CGFloat = 0
        static let yFrame: CGFloat = 0
        static let heightFrame: CGFloat = 110
        
        static let labelFontSize: CGFloat = 25
        static let labelNumberOfLines: Int = 0
        static let labelLeftConstant: CGFloat = 10
        static let labelBottomConstant: CGFloat = -35
        static let labelHeightConstant: CGFloat = 70
        static let labelWidthConstant: CGFloat = 95

        static let viewHeightConstant: CGFloat = 30
    }
    
    var nameOfConference: String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(nameOfConference: String){
        self.init()
        
        self.nameOfConference = nameOfConference
        self.frame = CGRect(x: Constants.xFrame, y: Constants.yFrame, width: self.frame.width, height: Constants.heightFrame)
        self.backgroundColor = .systemCyan
        
        let label = UILabel()
        
        label.text = nameOfConference
        label.textColor = .systemBackground
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: Constants.labelFontSize)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = Constants.labelNumberOfLines
        label.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(label)
        
        label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: Constants.labelLeftConstant).isActive = true
        label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: Constants.labelBottomConstant).isActive = true
        label.heightAnchor.constraint(equalToConstant: Constants.labelHeightConstant).isActive = true
        label.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - Constants.labelWidthConstant).isActive = true
        
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
        view.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        view.heightAnchor.constraint(equalToConstant: Constants.viewHeightConstant).isActive = true
        view.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        view.backgroundColor = .systemGroupedBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
