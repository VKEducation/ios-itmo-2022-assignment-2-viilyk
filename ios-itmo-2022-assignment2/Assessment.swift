
import Foundation
import UIKit

class Assessment: UIControl {
    
    lazy var stars: [UIButton] = {
        var stars: [UIButton] = []
        for i in 0..<5 {
            stars.append(UIButton())
            stars[i].setImage(UIImage(named: "Star.png"), for: .normal)
            stars[i].setImage(UIImage(named: "Union.png"), for: .highlighted)
            stars[i].addTarget(self, action: #selector(didTapButton), for: .touchDown)
            stars[i].translatesAutoresizingMaskIntoConstraints = false
        }
        return stars
    }()

    private lazy var label:UILabel = {
        let label = UILabel()
        label.text = "Ваша оценка"
        label.font = .systemFont(ofSize: 16)
        label.textColor = UIColor(red: 189/255, green: 189/255, blue: 189/255, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var mark = [0: "Ужасно", 1: "Плохо", 2: "Нормально", 3: "Хорошо", 4: "AMAZING!"]
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        for i in 0..<5 {
            addSubview(stars[i])
        }
        addSubview(label)
        
        NSLayoutConstraint.activate([
            
            stars[0].topAnchor.constraint(equalTo: topAnchor),
            stars[0].leadingAnchor.constraint(equalTo: leadingAnchor),
            
            stars[1].topAnchor.constraint(equalTo: topAnchor),
            stars[1].leadingAnchor.constraint(equalTo: stars[0].trailingAnchor, constant: 11),
            
            stars[2].topAnchor.constraint(equalTo: topAnchor),
            stars[2].leadingAnchor.constraint(equalTo: stars[1].trailingAnchor, constant: 11),
            
            stars[3].topAnchor.constraint(equalTo: topAnchor),
            stars[3].leadingAnchor.constraint(equalTo: stars[2].trailingAnchor, constant: 11),
            
            stars[4].topAnchor.constraint(equalTo: topAnchor),
            stars[4].leadingAnchor.constraint(equalTo: stars[3].trailingAnchor, constant: 11),
            stars[4].trailingAnchor.constraint(equalTo: trailingAnchor),
            
            label.topAnchor.constraint(equalTo: stars[4].bottomAnchor, constant: 20),
            label.heightAnchor.constraint(equalToConstant: 19),
            label.bottomAnchor.constraint(equalTo: bottomAnchor),
            label.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    
    @objc private func didTapButton(_ button: UIButton) {
        var number = 0
        while button != stars[number] {
            number+=1
        }
        for i in 0...number {
            stars[i].setImage(UIImage(named: "Union.png"), for: .normal)
        }
        for i in (number + 1)..<5 {
            stars[i].setImage(UIImage(named: "Star.png"), for: .normal)
        }
        label.text = mark[number]
        isSelected = true
        sendActions(for: .editingChanged)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
}

