 
 let string = "pudim de leite"
 print(string)
 
 var stringCollection: [String] = []
 
 string.forEach { char in
    if char == " " {
        stringCollection.append("%20")
    } else {
        stringCollection.append(String(char))
    }
 }

 let newString = stringCollection.joined(separator: "")

 print(newString)

