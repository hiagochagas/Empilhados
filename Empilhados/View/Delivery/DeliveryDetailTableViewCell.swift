//
//  DeliveryDetailTableViewCell.swift
//  Empilhados
//
//  Created by Hiago Chagas on 22/10/20.
//

import UIKit

class DeliveryDetailTableViewCell: UITableViewCell {
    
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
    var productName: UILabel = {
        let lbl = UILabel()
            lbl.textColor = .white
            lbl.text = "Produto:"
        return lbl
    }()
    
    var productQuantity: UILabel = {
        let lbl = UILabel()
            lbl.textColor = .white
            lbl.text = "Quantidade:"
        return lbl
    }()
    var productNameLabel: UILabel = {
        let lbl = UILabel()
            lbl.textColor = .white
        return lbl
    }()
    
    var productQuantityLabel: UILabel = {
        let lbl = UILabel()
            lbl.textColor = .white
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        addSubview(bgView)
        bgView.translatesAutoresizingMaskIntoConstraints = false
        bgView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        bgView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        bgView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        bgView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        
        addSubview(productName)
        productName.translatesAutoresizingMaskIntoConstraints = false
        productName.leftAnchor.constraint(equalTo: bgView.leftAnchor, constant: 10).isActive = true
        productName.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 10).isActive = true
        
        addSubview(productQuantity)
        productQuantity.translatesAutoresizingMaskIntoConstraints = false
        productQuantity.rightAnchor.constraint(equalTo: bgView.rightAnchor, constant: -10).isActive = true
        productQuantity.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 10).isActive = true
        
        addSubview(productNameLabel)
        productNameLabel.translatesAutoresizingMaskIntoConstraints = false
        productNameLabel.leftAnchor.constraint(equalTo: productName.leftAnchor).isActive = true
        productNameLabel.topAnchor.constraint(equalTo: productName.bottomAnchor, constant: 5).isActive = true
        
        addSubview(productQuantityLabel)
        productQuantityLabel.translatesAutoresizingMaskIntoConstraints = false
        productQuantityLabel.rightAnchor.constraint(equalTo: productQuantity.rightAnchor).isActive = true
        productQuantityLabel.topAnchor.constraint(equalTo: productQuantity.bottomAnchor, constant: 5).isActive = true
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
