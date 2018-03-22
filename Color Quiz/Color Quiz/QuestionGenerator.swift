//
//  Pregunta.swift
//  Color Quiz
//
//  Created by Tania on 21/2/18.
//  Copyright © 2018 TaniaCB. All rights reserved.
//

import Foundation

struct QuestionGenerator{
    static let questions = [
        "¿Has asistido alguna vez disfrazado a eventos de comics o videojuegos?",
        "¿Tienes apuntado en tu calendario cuando es el dia de Pi?",
        "¿Has discutido alguna vez por demostrar que 'Star Wars' es la mejor película de Ciencia Ficción de la historia?",
        "¿Has visto más de 2 veces la trilogía de 'El señor de los anillos' en su versión extendida?",
        "¿Crees que existen los unicornios, las hadas, los vampiros, los extraterrestres y demás seres?",
        "¿Tu perro se llama Thor, Zeus o Vader en honor a tus películas favoritas?"
    ]
    
    static func getQuestion(questionNumber:Int) -> String{
        return questions[questionNumber]
    }
    
    static func isLastQuestion(questionNumber: Int)->Bool{
        return questionNumber == questions.count - 1
    }
}
