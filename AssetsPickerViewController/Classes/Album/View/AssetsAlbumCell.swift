//
//  AssetsAlbumCell.swift
//  Pods
//
//  Created by DragonCherry on 5/17/17.
//
//

import UIKit
import Photos

public protocol AssetsAlbumCellProtocol {
    var album: PHAssetCollection? { get set }
    var isSelected: Bool { get set }
    var imageView: UIImageView { get }
    var titleText: String? { get set }
    var count: Int { get set }
}

open class AssetsAlbumCell: UICollectionViewCell, AssetsAlbumCellProtocol {
    
    // MARK: - AssetsAlbumCellProtocol
    open var album: PHAssetCollection? {
        didSet {
            // customizable
        }
    }
    
    open override var isSelected: Bool {
        didSet {
            if isSelected {
                imageView.dim(animated: false)
            } else {
                imageView.undim(animated: false)
            }
        }
    }
    
    public let imageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor(rgbHex: 0xF0F0F0)
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.layer.cornerRadius = 5
        return view
    }()
    
    open var titleText: String? {
        didSet {
            titleLabel.text = titleText
        }
    }
    
    open var count: Int = 0 {
        didSet {
            countLabel.text = "\(NumberFormatter.decimalString(value: count))"
        }
    }
    
    // MARK: - Views
    fileprivate let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(forStyle: .subheadline)
        return label
    }()
    
    fileprivate let countLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(rgbHex: 0x8C8C91)
        label.font = UIFont.systemFont(forStyle: .subheadline)
        return label
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
        
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(countLabel)
        
        imageView.anchor(
            top: contentView.topAnchor,
            leading: contentView.leadingAnchor,
            trailing: contentView.trailingAnchor
        )
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true

        titleLabel.anchor(
            leading: contentView.leadingAnchor,
            trailing: contentView.trailingAnchor,
            heightConstant: titleLabel.font.pointSize + 2
        )
        titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8).isActive = true

        countLabel.anchor(
            leading: contentView.leadingAnchor,
            trailing: contentView.trailingAnchor,
            heightConstant: countLabel.font.pointSize + 2
        )
        countLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2).isActive = true
    }
}
