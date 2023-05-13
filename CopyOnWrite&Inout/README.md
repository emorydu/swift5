# CopyOnWrite&Inout
1. Copy on Write
2. inout
## Copy On Write
1. Value Type在传递时是用复制的
2. 当 复制 一份成本太高的时候，采用 copy-on-write
3. Array、Set、Dictionary、String都采用了copy-on-write
4. 将一个Value Type当做Reference Type来对待，直到你对它做改动为止
## inout
1. copy-in copy-out，复制进来，复制出去

