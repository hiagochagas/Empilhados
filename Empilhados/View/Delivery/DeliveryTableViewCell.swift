//
//  DeliveryTableViewCell.swift
//  Empilhados
//
//  Created by Hiago Chagas on 22/10/20.
//

import UIKit

class DeliveryTableViewCell: UITableViewCell {
    
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
    
    let clientNameLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.text = "Client name:"
        return lbl
    }()
    
    let priceLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        lbl.text = "Price:"
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        addSubview(bgView)
        bgView.translatesAutoresizingMaskIntoConstraints = false
        bgView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        bgView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        bgView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        bgView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        addSubview(clientNameLabel)
        clientNameLabel.translatesAutoresizingMaskIntoConstraints = false
        clientNameLabel.leftAnchor.constraint(equalTo: bgView.leftAnchor, constant: 10).isActive = true
        clientNameLabel.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 10).isActive = true
        
        addSubview(priceLabel)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.leftAnchor.constraint(equalTo: clientNameLabel.leftAnchor).isActive = true
        priceLabel.topAnchor.constraint(equalTo: clientNameLabel.bottomAnchor, constant: 10).isActive = true
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
