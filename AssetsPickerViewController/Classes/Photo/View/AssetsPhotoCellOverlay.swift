//
//  AssetsPhotoCellOverlay.swift
//  Pods
//
//  Created by DragonCherry on 5/26/17.
//
//

import UIKit

open class AssetsPhotoCellOverlay: UIView {
    
    open var count: Int = 0 {
        didSet { countLabel.text = "\(count)" }
    }
    
    // MARK: - Views
    
    let countLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(forStyle: .subheadline)
        label.isHidden = true
        return label
    }()
    
    let checkmark: SSCheckMark = {
        let view = SSCheckMark()
        return view
    }()
    
    // MARK: - Lifecycle
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    private func commonInit() {
        dim(animated: false, color: .white, alpha: 0.25)
        addSubview(countLabel)
        addSubview(checkmark)
        
        countLabel.fillToSuperview()
        
        checkmark.anchor(
            bottom: superview?.bottomAnchor,
            trailing: superview?.trailingAnchor,
            bottomConstant: 1,
            trailingConstant: 1,
            widthConstant: 30,
            heightConstant: 30
        )
    }
}
