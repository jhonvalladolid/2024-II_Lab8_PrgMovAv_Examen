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
    @IBOutlet weak var btnCalcularEnMismaVista: UIButton!
    @IBOutlet weak var txtResultado: UILabel!
    @IBOutlet weak var txtInterpretacion: UILabel!
    
    var imcCalculado: Double?

    override func viewDidLoad() {
        super.viewDidLoad()

        txtTitulo.text = "Calculo de Indice de Masa Corporal"
        txtTitulo.font = UIFont.boldSystemFont(ofSize: 26)
        
        calcularButton.layer.cornerRadius = 10
        calcularButton.backgroundColor = UIColor.systemBlue
        calcularButton.setTitleColor(.white, for: .normal)
        
        btnCalcularEnMismaVista.layer.cornerRadius = 10
        btnCalcularEnMismaVista.backgroundColor = UIColor.systemGreen
        btnCalcularEnMismaVista.setTitleColor(.white, for: .normal)
        
        // Ocultar los resultados inicialmente
        txtResultado.isHidden = true
        txtInterpretacion.isHidden = true

        // Color de fondo
        self.view.backgroundColor = UIColor.systemGray6
    }
    
    @IBAction func calcularEnMismaVista(_ sender: Any) {
        // Cálculo del IMC y mostrar en la misma vista
        guard let pesoText = txtPeso.text, let peso = Double(pesoText),
              let alturaText = txtAltura.text, let alturaEnCm = Double(alturaText) else {
            mostrarAlerta()
            return
        }

        let altura = alturaEnCm / 100.0
        imcCalculado = peso / (altura * altura)

        // Mostramos el resultado en la misma vista
        if let imcValor = imcCalculado {
            txtResultado.text = String(format: "Tu IMC es %.2f", imcValor)
            txtResultado.isHidden = false

            // Clasificación del IMC
            var interpretacion = ""
            var colorInterpretacion = UIColor.black

            if imcValor < 18.5 {
                interpretacion = "Bajo peso. Es recomendable consultar con un médico o nutricionista para mejorar tu salud."
                colorInterpretacion = UIColor.blue
            } else if imcValor < 24.9 {
                interpretacion = "Peso normal. ¡Sigue manteniendo un estilo de vida saludable!"
                colorInterpretacion = UIColor.green
            } else if imcValor < 29.9 {
                interpretacion = "Sobrepeso. Considera realizar actividad física y llevar una dieta equilibrada."
                colorInterpretacion = UIColor.orange
            } else {
                interpretacion = "Obesidad. Te sugerimos hablar con un especialista en salud para reducir riesgos a largo plazo."
                colorInterpretacion = UIColor.red
            }

            txtInterpretacion.text = interpretacion
            txtInterpretacion.textColor = colorInterpretacion
            txtInterpretacion.isHidden = false
        }
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

