//
//  UserModel.swift
//  AboutMyApp
//
//  Created by Карина Короткая on 14.02.2024.
//

import Foundation

struct User {
    let login: String
    let password: String
    let person: Person
    
    static func getUser() -> User {
        let person = Person(
            name: "Артур",
            surname: "Короткий",
            patronymic: "Александрович",
            biography: """
 Доброго времени суток, Алексей. Я живу в г.Новочеркасск(20 мин от Ростова),
 мне 30 лет. женат, есть дочь Маргарита, в этом году пойдет в школу. В 2016 г.
 окончил строительный институт, после пошел в армию по призыву,
 где и остался по контракту до 22 года(хотя армия никогда не нравилась 😃)Завершив
 контракт решил развиваться в том что мне интересно.Все время увлекался рыбалкой ,
 а именно спиннинговой ловлей - это мое хобби, также всегда интересно было программирование
 с которым свела меня моя жена(познакомив со своим одноклассником - Никитой ,который проходил у вас курсы)
 Живем с женой в квартире и собакой(питбуль) по кличке Рамзес,которому уже 8 лет,
 параллельно сдаем пару квартир посуточно, чем и подзарабытываем. Вот так если просто и коротко о себе))
 """
        )
        
        return User(login: "user", password: "12345", person: person)
    }
}

struct Person {
    let name: String
    let surname: String
    let patronymic: String
    let biography: String
    
    var fullname: String {
        surname + " " + name + " " + patronymic + "😁"
    }
}
