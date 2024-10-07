//
//  ViewController.swift
//  PracticaCalificadaMasaCorporal
//
//  Created by Mac05 on 7/10/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtTitulo: UILabel!
    @IBOutlet weak var txtPeso: UITextField!
    @IBOutlet weak var txtAltura: UITextField!
    @IBOutlet weak var calcularButton: UIButton!
    
    var imcCalculado: Double?

    override func viewDidLoad() {
        super.viewDidLoad()

        txtTitulo.text = "Calculo de Indice de Masa Corporal"
        txtTitulo.font = UIFont.boldSystemFont(ofSize: 26)
        
        calcularButton.layer.cornerRadius = 10
        calcularButton.backgroundColor = UIColor.systemBlue
        calcularButton.setTitleColor(.white, for: .normal)
        
        // Color de fondo
        self.view.backgroundColor = UIColor.systemGray6
    }

    @IBAction func calcularICM(_ sender: Any) {
        guard let pesoText = txtPeso.text, let peso = Double(pesoText),
              let alturaText = txtAltura.text, let alturaEnCm = Double(alturaText) else {
            mostrarAlerta()
            return
        }

        let altura = alturaEnCm / 100.0

        imcCalculado = peso / (altura * altura)
        
        performSegue(withIdentifier: "mostrarResultado", sender: self)
    }
    
    // Método para pasar datos al segundo controlador antes de la transición
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mostrarResultado" {
            let destinoVC = segue.destination as! ViewController2
            destinoVC.imc = imcCalculado
        }
    }

    // Método para mostrar una alerta si hay error en los datos
    func mostrarAlerta() {
        let alerta = UIAlertController(title: "Error", message: "Por favor ingresa valores válidos.", preferredStyle: .alert)
        alerta.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alerta, animated: true, completion: nil)
    }
}

