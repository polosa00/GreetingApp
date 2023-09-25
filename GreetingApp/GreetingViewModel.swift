//
//  GreetingViewModel.swift
//  GreetingApp
//
//  Created by Александр Полочанин on 25.09.23.
//

protocol GreetingViewModelProtocol {
    var greeting: String? { get }
    var greetingDidChange: ((GreetingViewModelProtocol) -> Void)? { get set }
    init(person: Person)
    func showGreeting()
}

class GreetingViewModel: GreetingViewModelProtocol {
    var greeting: String? {
        didSet {
            greetingDidChange?(self)
        }
    }
    var greetingDidChange: ((GreetingViewModelProtocol) -> Void)?
    
    private let person: Person
    
    required init(person: Person) {
        self.person = person
    }
    
    func showGreeting() {
        greeting = "Hello, \(person.name) \(person.surname)!"
    }
}
