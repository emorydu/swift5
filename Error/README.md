# Error
1. 错误类型
```swift
// 强制中断 Fatal Error 程序Crash
// 可处理 Error（Protocol）将错误传递给调用者，由调用者决定如何处理
func Login(username: String, password: String) throws -> User {

}
// 1. 如果function上标有throws关键字表示错误会被传递给调用者
// 2. 使用有throws的function一定要处理错误
// try? 
let user: User? = try? Login(username: "emorydu", password: "emorydu")
// 1. 表示发生任何错误就返回nil
// 2. 返回值会变成Optional
// 3. 优点：好写、适合单纯的错误
// 4. 缺点：不好debug
// try!
let user: User = try! Login(username: "emorydu", password: "emorydu")
// 1. 表示这里不应该发生错误
// 2. 假如发生错误会crash
// 3. 优点：好写，容易debug
// 4. 遇到没预期的问题就会直接crash
// do-try-catch
do {
    let user = try Login(username: "emorydu", password: "emorydu")
    print("Hi, \(user.name), wolcome")
} catch {
    print("login fatal, error is \(error)")
}
// 1. 将一段可能收到错误影响的code包起来，针对个别情况处理
// 2. 优点：针对情况做不同处理
// 3. 缺点：写起来比较长，try写太多会很难debug
// 4. 没有finally，用defer处理
```
2. 不可继续的严重错误
```swift
// 1. 可以在任何地方使用
// 2. fatalError返回值是Never，可以放在你知道没有问题、不会被执行到的地方，让编译器不要报错
fatalError("直接 crash")
assertionFailure("如果是在debug就crash")
```
3. 转发错误rethrows
```swift
// closure本身不会抛出任何错误
// 调用端放进来的参数有可能会抛出错误
```
## 重点整理
1. throws：宣告这个closure会抛出错误
2. rethrows：宣告转发错误，这个closure本身不会发生错误
3. throw：抛出一个错误
4. Error：错误的protocol
5. LocalizedError：提供错误相关资讯的protocol
6. CustomNSError：可以转换成NSError的protocol
7. Propagate：传播，与Error搭配用就是把错误往外传