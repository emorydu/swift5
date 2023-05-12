# Opaque
1. Swift可以推断类型（Type Inference）
2. Swift会在编译（Compile）的时候帮助检查型别，减少实际执行（Runtime）时的错误
3. Protocol可以为类型设计一些规范，在没有associatedtype的时候、protocol本身可以作为类型使用
4. 用Generic来表示一个被调用时才会知道的类型

5. Protocol前面加上some就建立了Opaque的类型
6. 主要是用在返回值类型上
7. 把Protocol当做类型使用，并且确保只有一种类型，所以不用担心Self或associatedtype的问题
## 什么是Opaque
```swift
func doSomething() -> some Comparable { 
    // code 
}
```
1. 在protocol前面加上some，就建立了一个Opaque的类型
2. Opaque的类型一定是某 一个 类型
3. 调用端拿到这个返回值，也只知道他是某一个固定的Comparable类型

## 为什么需要Opaque
1. 隐藏太复杂且对调用段没有意义的类型
```swift
struct SwiftUIView: View {
    var body: some View {
        Text("hello, world")
    }
}

struct SwiftUIView: View {
    var body: some View {
        VStack {
            Text("hello, world")
            Image("hi")
        }
    }
}
```
2. Opaque的回传帮助调用端专注在可以做的事情而不是类型
3. 回传的类型更换时不会影响外部的code，因为无论是什么，对外部来说都只能操作protocol定义出来的部分
## 只知道功能的类型
1. protocol：在没有Self和associatedtype定义的时候能直接被当做类型使用
2. Generic：调用端决定一种类型
3. Opaque：定义时决定一种类型