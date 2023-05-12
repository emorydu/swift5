

import Foundation

struct Cat {
    var name: String
}

let cats = [Cat(name: "tomcat"), Cat(name: "tom")]
print(cats.map(\.name))