//
//  ViewController.swift
//  Sprint_3_Home_Work
//
//  Created by Аветис Парсаданян on 11/14/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var buttonZero: UIButton!
    @IBOutlet weak var buttonDecrase: UIButton!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var buttonIncrease: UIButton!
    @IBOutlet weak var textLabelScroll: UITextView!
    
    
    var counter: Int = 0
    let currentDate = Date()
    let dateFormatter = DateFormatter()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.startApp()

        
        
    }
    
    private func startApp(){
        dateFormatter.dateStyle = DateFormatter.Style.medium
        dateFormatter.timeStyle = DateFormatter.Style.medium
        dateFormatter.locale = Locale.current
        self.textLabel.text = String(self.counter)
        self.textLabel.center.x = view.center.x
        self.buttonIncrease.backgroundColor = .red
        self.buttonDecrase.backgroundColor = .blue
        self.buttonIncrease.tintColor = .white
        self.buttonDecrase.tintColor = .white
        self.buttonZero.backgroundColor = .systemGray
        self.buttonZero.tintColor = .white
        self.textLabelScroll.backgroundColor = .gray
        self.textLabelScroll.isSelectable = false
        self.textLabelScroll.isScrollEnabled = true
        
        
    }

    @IBAction func buttonPressIncrease(_ sender: UIButton) {
        self.counter += 1
        self.textLabel.text = "Значение счетчика \(counter)"
        self.textLabelScroll.text.append("["+dateFormatter.string(from: self.currentDate)+"]:" + " Значение счетчика \(counter)\n")
    }
    
    
    @IBAction func buttonPressDecrease(_ sender: UIButton) {
        
        if counter > 0{
            self.counter -= 1
            self.textLabel.text = "Значение счетчика \(counter)"
            self.textLabelScroll.text.append("["+dateFormatter.string(from: self.currentDate) + "]:" + " Значение счетчика \(counter)\n")
        }else if counter == 0 {
            self.textLabelScroll.text.append("["+dateFormatter.string(from: self.currentDate) + "]:" + " попытка уменьшить значение счётчика ниже 0 \n")
        }
        
    }
    @IBAction func buttonPressZero(_ sender: UIButton) {
        self.counter = 0
        self.textLabel.text = "Значение счетчика \(counter)"
        self.textLabelScroll.text.append("["+dateFormatter.string(from: self.currentDate) + "]:" + " Значение сброшено \n")
    }
    
}

