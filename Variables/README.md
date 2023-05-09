# Variables
1. 变量代替了资料位置，使我们用容易记忆、具有一定场景意义的代号与电脑沟通
2. 是代表在某一块内存地址中所存放的资料
3. 变量的工作是帮助管理资料，只需要在建立时提供指定的值，会自动做好空间管理、资料存储和调用
## 建立变量
```swift
// let/var variables-name: Type = value
let username = "emorydu"

let username: String = "emorydu"    

var username: String = "emorydu"
username = "Lin"
```

## 变量命名规范
1. 不能使用数字开头、不能有数学符号、箭头
2. 避免使用关键字，如果非要使用关键字，请使用``扩起来
3. 见名知意
4. 所有的变量名称、方法名称都惯用小驼峰命名法则，所有的Protocol、Type、Struct、Enumeration都是用大驼峰

