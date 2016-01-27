//
//  EfectoViewController.swift
//  GuauGuau
//
//  Created by guitarrkurt on 07/01/16.
//  Copyright © 2016 guitarrkurt. All rights reserved.
//

import UIKit
import AVFoundation

class EfectoViewController: UIViewController {


    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var boton: UIButton!
    var imagenAnimal = "perro.png"
    var sonidoAnimal = "perro"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imagen.image = UIImage(named: imagenAnimal)
        
        let swipeButtonLeft = UISwipeGestureRecognizer(target: self, action: "SwipeButtonLeft:")
        swipeButtonLeft.direction = UISwipeGestureRecognizerDirection.Right
        boton.addGestureRecognizer(swipeButtonLeft)
    }

    func SwipeButtonLeft(gestureRecognizer: UIGestureRecognizer){
        print("Izquierda")
        navigationController?.popViewControllerAnimated(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func botonClicked(sender: UIButton) {
        print("clicked")
        print(sonidoAnimal)
        
        //SELECCIONAMOS EL SONIDO DE NUESTRO PROYECTO LOCAL
        let filePath = NSBundle.mainBundle().pathForResource(sonidoAnimal, ofType: "mp3")
        
        //ALMACENAMOS EL SONIDO EN UNA VARIABLE DE TIPO NSURL
        let fileURL = NSURL(fileURLWithPath: filePath!)
        
        //CREAMOS UNA VARIABLE QUE INDIQUE EL TIPO DE SONIDO
        var soundID:SystemSoundID = 0
        
        //REPRODUCIMOS EL SONIDO
        AudioServicesCreateSystemSoundID(fileURL, &soundID)
        AudioServicesPlaySystemSound(soundID)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
