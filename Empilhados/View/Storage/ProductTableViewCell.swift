//
//  ProductTableViewCell.swift
//  Empilhados
//
//  Created by Hiago Chagas on 20/10/20.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    var bgView: UIView = {
            let view = UIView()
                view.heightAnchor.constraint(equalToConstant: 100).isActive = true
                view.backgroundColor = .systemBlue
                view.layer.shadowColor = UIColor.black.cgColor
                view.layer.shadowOpacity = 0.5
                view.layer.shadowOffset = CGSize(width: 0, height: 1)
                view.layer.shadowRadius = 2
                view.layer.cornerRadius = 10
                
            return view
    }()
    
    var productImage: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "standardProduct")
        img.widthAnchor.constraint(equalTo: img.heightAnchor).isActive = true
        img.layer.cornerRadius = 10
        img.layer.masksToBounds = true
        return img
    }()
    
    var productName: UILabel = {
        let lbl = UILabel()
            lbl.textColor = .white
            lbl.text = "Product Name"
        return lbl
    }()
    
    var productQuantity: UILabel = {
        let lbl = UILabel()
            lbl.text = "X produtos disponíveis"
            lbl.textColor = .white
        return lbl
        
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        addSubview(bgView)
        bgView.translatesAutoresizingMaskIntoConstraints = false
        bgView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        bgView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
        bgView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        bgView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        addSubview(productImage)
        productImage.translatesAutoresizingMaskIntoConstraints = false
        productImage.leftAnchor.constraint(equalTo: bgView.leftAnchor, constant: 10).isActive = true
        productImage.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 10).isActive = true
        productImage.bottomAnchor.constraint(equalTo: bgView.bottomAnchor, constant: -10).isActive = true
        
        addSubview(productName)
        productName.translatesAutoresizingMaskIntoConstraints = false
        productName.leftAnchor.constraint(equalTo: productImage.rightAnchor, constant: 10).isActive = true
        productName.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 10).isActive = true
        productName.rightAnchor.constraint(equalTo: bgView.rightAnchor, constant: -10).isActive = true
        
        addSubview(productQuantity)
        productQuantity.translatesAutoresizingMaskIntoConstraints = false
        productQuantity.leftAnchor.constraint(equalTo: productImage.rightAnchor, constant: 10).isActive = true
        productQuantity.rightAnchor.constraint(equalTo: bgView.rightAnchor, constant: -10).isActive = true
        productQuantity.topAnchor.constraint(equalTo: productName.bottomAnchor, constant: 10).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
