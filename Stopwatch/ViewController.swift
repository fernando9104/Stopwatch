//
//  ViewController.swift
//  Stopwatch
//
//  Created by Developer02 on 18/10/18.
//  Copyright © 2018 Developer02. All rights reserved.
//
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var contLabel1: UILabel!
    @IBOutlet weak var statusLabel2: UILabel!
    @IBOutlet weak var progLabel3: UILabel!
    var time:Int?
    var timer:Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Inicializa variables globales
        time  = 0
        timer = Timer()
    }

    // Funcion que escucha los eventos de los botones de la vista
    @IBAction func interactButtons(_ sender: UIButton) {
        
        // Identifica el id del boton
        switch sender.tag {
            case 1: // Start
                timer = Timer.scheduledTimer( timeInterval: 1, target: self, selector: #selector(increaseStopwatch), userInfo: nil, repeats: true )
                statusLabel2.text = "In Progress"
                break;
            case 2: // Pause
                timer?.invalidate()
                statusLabel2.text = "In Pause"
                break;
            case 3: // Reset
                time = 0;
                timer?.invalidate()
                contLabel1.text   = "0"
                progLabel3.text   = ""
                statusLabel2.text = ""
                break;
            default:
                break;
        }// Fin del switch
        
    }// Fin de la funcion
    
    // Funcion que incrementa la etiqueta del cronometro
    @objc private func increaseStopwatch(){
        time? += 1
        contLabel1.text = String(time!)
        if( progLabel3.text?.count == 10 ){
            progLabel3.text! = "."
        }else{
            progLabel3.text! += "."
        }
    }
    
}

