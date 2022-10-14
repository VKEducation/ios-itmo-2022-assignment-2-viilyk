
import UIKit

class ViewController: UIViewController {
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Фильм"
        label.font = .boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var name: Container = Container(frame: CGRect(), text: "Название", placeholder: "Название фильма")
    
    private lazy var director: Container = Container(frame: CGRect(), text: "Режисёр", placeholder: "Режисёр фильма")
    
    private lazy var year: Container = Container(frame: CGRect(), text: "Год", placeholder: "Год выпуска")
    
    private lazy var assessment: Assessment = Assessment()
    
    private lazy var datePicker: UIDatePicker = UIDatePicker()
    
    private lazy var save: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Сохранить", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 93/255, green: 176/255, blue: 117/255, alpha: 1)
        button.layer.cornerRadius = 25.5
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isEnabled = false
        button.layer.opacity = 0.4
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(label)
        view.addSubview(name)
        view.addSubview(director)
        view.addSubview(year)
        view.addSubview(assessment)
        view.addSubview(save)
        //year.textField.inputView = datePicker
        //datePicker.datePickerMode = .date
        assessment.translatesAutoresizingMaskIntoConstraints = false
        
        name.addTarget(self, action: #selector(containerDidChange), for: .editingChanged)
        director.addTarget(self, action: #selector(containerDidChange), for: .editingChanged)
        year.addTarget(self, action: #selector(containerDidChange), for: .editingChanged)
        assessment.addTarget(self, action: #selector(containerDidChange), for: .editingChanged)

        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            label.heightAnchor.constraint(equalToConstant: 36),
            
            name.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 40),
            name.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            name.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            director.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 16),
            director.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            director.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            year.topAnchor.constraint(equalTo: director.bottomAnchor, constant: 16),
            year.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            year.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            assessment.topAnchor.constraint(equalTo: year.bottomAnchor, constant: 40),
            assessment.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            save.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            save.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            save.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            save.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            save.heightAnchor.constraint(equalToConstant: 51)
        ])
    }
    
    @objc
    private func containerDidChange() {
        if name.isSelected && director.isSelected && year.isSelected && assessment.isSelected {
            save.isEnabled = true
            save.layer.opacity = 1
        } else {
            save.isEnabled = false
            save.layer.opacity = 0.4
        }
    }
}
