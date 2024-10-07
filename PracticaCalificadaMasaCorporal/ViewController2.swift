//
//  ViewController2.swift
//  PracticaCalificadaMasaCorporal
//
//  Created by Mac05 on 7/10/24.
//

import UIKit

class ViewController2: UIViewController {
    
    @IBOutlet weak var txtTitulo: UILabel!
    @IBOutlet weak var resultadoLabel: UILabel!
    @IBOutlet weak var interpretacionLabel: UILabel!
    
    var imc: Double?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtTitulo.text = "Resultado del IMC"
        txtTitulo.font = UIFont.boldSystemFont(ofSize: 26)

        self.view.backgroundColor = UIColor.systemGray6
        
        // Mostramos el resultado del IMC
        if let imcValor = imc {
            resultadoLabel.text = String(format: "Tu IMC es %.2f", imcValor)
            
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
            
            interpretacionLabel.text = interpretacion
            interpretacionLabel.textColor = colorInterpretacion
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
