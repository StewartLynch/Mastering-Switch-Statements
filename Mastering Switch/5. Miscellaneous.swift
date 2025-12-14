//
//----------------------------------------------
// Original project: Mastering Switch
//
// Follow me on Mastodon: https://iosdev.space/@StewartLynch
// Follow me on Threads: https://www.threads.net/@stewartlynch
// Follow me on Bluesky: https://bsky.app/profile/stewartlynch.bsky.social
// Follow me on X: https://x.com/StewartLynch
// Follow me on LinkedIn: https://linkedin.com/in/StewartLynch
// Email: slynch@createchsol.com
// Subscribe on YouTube: https://youTube.com/@StewartLynch
// Buy me a ko-fi:  https://ko-fi.com/StewartLynch
//----------------------------------------------
// Copyright © 2026 CreaTECH Solutions (Stewart Lynch). All rights reserved.

import Playgrounds


#Playground("Fallthrough and Break") {
    let number = 6
    var result = 0
    
    switch number {
    case 1:
        result += 1
    case 2:
        result += 2
    case 3:
        result += 3
        fallthrough
    case 4:
        result += 4
    case 5:
        result += 5
        return
    default:
        result += 0
        
    }
    print("The result is \(result)")
}

#Playground("Control Transfers") {
    let numbers = [1, 2, 3, 4, 5, 6]
    for number in numbers {
        switch number {
        case 1:
            break
        case 2:
            continue
        case 5:
            print("found 5")
        default:
            print("Number: \(number)")
        }
        print("evaluted \(number)")
    }
}

#Playground("Optional Matching") {
    let age: Int? = 24
    switch age {
    case nil:
        print("I am not telling")
    case let value?:
        print("I am \(age)")
    }
    
    switch age {
    case .none:
        print("No age given")
    case .some(let value):
        print("Age given is \(value)")
    }
}

#Playground("Switching on Types") {
    let items: [Any] = [42, "Hello", 3.14, true]
    for item in items {
        switch item {
        case let int as Int:
            print("Integer: \(int)")
        case let string as String:
            print("String: \(string)")
        case let double as Double:
            print("Double: \(double)")
        case let bool as Bool:
            print("Boolean: \(bool)")
        default:
            print("Unknown type")
        }
    }
}
