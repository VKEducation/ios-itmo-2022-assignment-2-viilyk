import Foundation
import UIKit

class Container: UIControl {
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = UIColor(red: 102/255, green: 102/255, blue: 102/255, alpha: 1)
        label.font = .systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var textField: MyTextField = {
        let textfield = MyTextField()
        textfield.backgroundColor = UIColor(red: 246/255, green: 246/255, blue: 246/255, alpha: 1)
        textfield.layer.cornerRadius = 8
        textfield.font = .systemFont(ofSize: 16)
        textfield.layer.borderColor = UIColor(red: 232/255, green: 232/255, blue: 232/255, alpha: 1).cgColor
        textfield.layer.borderWidth = 1
        textfield.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    init(frame: CGRect, text: String, placeholder: String) {
        super.init(frame: frame)
        self.label.text = text
        self.textField.placeholder = placeholder
        self.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(label)
        addSubview(textField)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
            label.heightAnchor.constraint(equalToConstant: 15),
            
            textField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 8),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor),
            textField.heightAnchor.constraint(equalToConstant: 50),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    private func textFieldDidChange() {
        if textField.text != "" {
            self.isSelected = true
        } else {
            self.isSelected = false
        }
        sendActions(for: .editingChanged)
    }
}
