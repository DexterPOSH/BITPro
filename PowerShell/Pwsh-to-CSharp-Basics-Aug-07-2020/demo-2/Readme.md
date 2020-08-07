# C# Types

All C# data types or simply 'types' can be classified into two broad categories:

1. Value types
2. Reference types

Following table will help you understand basic differences between value and reference types:

||Value type|Reference type|
|--|--|--|
|Stores|Actual value|Memory location|
|Allocation|Stack, member|Heap|
|Nullable|Always has value|Maybe null|
|Default|0|null|
|Assignment|Copying actual data|Copying reference|

<hr>

## 1. Values Types

Value type data types **hold a data value within its own designated memory space** and they can not contain `null` values. Following is a list of  value data types you can use in your C# programs.

|.Net Type|Type Alias|Represents|Range|Default Value|
|--|--|--|--|--|
|System.Byte|byte|8-bit unsigned integer|0 to 255|0|
|System.Boolean|bool|Boolean value|True or False|False|
|System.Char|char|16-bit Unicode character|U+0000 to U+ffff|'\0'|
|System.Decimal|decimal|128-bit precise decimal values with 28-29 significant digits|(+/-)1.0 x 10^-28 to (+/-)7.9 x 10^28|0.0M|
|System.Double|double|64-bit double-precision floating point type|(+/-)5.0 x 10^-324 to (+/-)1.7 x 10^308|0.0D|
|System.Single|float|32-bit single-precision floating point type|(+/-)1.5 x 10^-45 to (+/-)3.4 x 1038|0.0F|
|System.Int32|int|32-bit signed integer type|-2,147,483,648 to 2,147,483,647|0|
|System.Int64|long|64-bit signed integer type|-9,223,372,036,854,775,808 to 9,223,372,036,854,775,807|0L|
|System.SByte|sbyte|8-bit signed integer type|-128 to 127|0|
|System.Int16|short|16-bit signed integer type|-32,768 to 32,767|0|
|System.UInt32|uint|32-bit unsigned integer type|0 to 4,294,967,295|0|
|System.UInt64|ulong|64-bit unsigned integer type|0 to 18,446,744,073,709,551,615|0|
|System.UInt16|ushort|16-bit unsigned integer type|0 to 65,535|0|

<hr>

## 2. Reference Types

Reference types contain references to other objects and **don't store any actual data in a variable**. In simpler words **they store reference to a memory location**. Reference types bring in the possibility of one or more variables to reference a single object, and similarly any action performed by any one variable changes the referenced object.

C# provides some built-in reference types such as: `dynamic`, `object`, `string`. In order to declare your own reference types in C#, you can take advantage of the keywords: `class`, `interface` and `delegate`.

## Type Conversions

PowerShell Example:

```PowerShell
# float to int
[int] 3.14159
# string to char array
[char[]] 'prateek'
# int to char
[char] 97
[char] 98
# bool to int
[int] $true
[int] $false
# int to bool
[bool] 1
[bool] 0
# char to int
[int] [char]'Z'
# int to hex
"{0:x}" -f 397312
```

C# Examples:

```CSharp
PowerShell Example
```

# C# Variables

A variable is the **name of the storage location to store values** of data types supported by the programming language. In C# depending upon the data type of the variable, a memory location with a specific size and layout is assigned to the variable.

To define and initialize a variable we follow the below mentioned syntax:

```csharp
// variable definition
<data-type> <variable-name>;

// multiple variable definition
<data-type> <variable-name1>, <variable-name2>, <variable-name3>; 

// variable definition and initialization
<data-type> <variable-name> = value;
```

Here, `<data-type>` can be one of data types that we discussed in the previous subsection such as value types: `char`,`int`,`float` and reference types or in other words a user defined data types: `Employee`, `Car` etc. Following are some examples to demonstrate this:

{format: csharp}
![Example 1-10. Declaring and initializing C# variables](code\chp1\Example 1-10.cs)

When declaring a variable in your C# program, you must explicitly specify the data type, otherwise you can also use the '`var`' keyword to let the compiler implicitly decide the type of variable at compilation time.


# C# Operators, Operands and Expressions

**Expressions are combinations or sequence of operands and operators** and once an expression is evaluated, it returns a value.

The operators of an expression represent operations to apply on the operands. For example: `(x + y) * z` is an expression in which `x`, `y`, `z` are operands and `+`, `*` are operators.

## Operators

The operators in the C# Language can be categorized into, following 3 broad categories:

### 1. Unary operator

Unary operators **take one operand to perform the operation and either prefixed or postfixed to the operand**. Some common use cases can be increment (`++`), decrement (`--`) and negative boolean (`!`) operators, below are some examples that will help you understand.

PowerShell Example:

```PowerShell
# increment and decrement operators
$x = 5;
(++$x) # pre increment operator
($x++) # post increment operator
(--$x) # pre decrement operator
($x--) # post decrement operator

# negative boolean operator
[bool] $flag = $true;
!$flag # alternatively, -not $flag
!$false
!$true
```

C# Example:

```csharp
// increment and decrement operators
int x = 5;
++x // pre increment operator
x++ // post increment operator
--x // pre decrement operator
x-- // post decrement operator

// negative boolean operator
bool flag = true;
!flag
!false
!true
```


<hr>

### 2. Binary operator

Binary operators **take two operands to perform the operation** and **operator is in between the two operands**, 

* Arithmetic Operators: (`+`, `-`, `*`, `/`, `%`)  
* Logical Operators: OR (`||`) and logical AND (`&&`) operators.
* Relation Operators: (`>`, `>=`, `<`, `<=`, `==`, `!=`)
* Assignment Operators: (`=`)

PowerShell Example:

```PowerShell
# arithmetic operators
1 + 2
13 - 12
5 * 5
15 / 3
29 % 4

# logical operators
$x = $true;
$y = $false;
$x -or $y
$x -and $y
```

C# Example:

```csharp
// arithmetic operators
1 + 2
13 - 12
5 * 5
15 / 3
29 % 4

// logical operators
var x = true;
var y = false;
x || y
x && y
```

![Arithmetic and Logical operators](images\arithmatic-and-logical-operators.png)


PowerShell Example:

```PowerShell
# relational operators
1 -gt 0
"ONE" -eq "one"
5 -le 5
2 -ne 5

# assignment operators
[int] $x, $y
$x = 5
$y = $x + 3
```

C# Example:

```CSharp
// relational operators
1 > 0
"ONE" == "one"
5 <= 5
2 != 5

// assignment operators
int x, y;
x = 5
y = x + 3
```

![Relational and Assignment operators](images\relational-and-assignment-operator.png)


<hr>

### 3. Ternary operator

A special operator that is **used in decision making or to check conditions**, this operator **takes three operands**.

Syntax:

> `<condition> ? <if true> : <if false>`

PowerShell Example:

```PowerShell
[int] $x = 5;
[int] $y = 7;

$x -gt $y ? "x greater-than y" : "x smaller-than y"
```

C# Example:

```csharp
int x = 5;
int y = 7;

x > y ? "x greater-than y" : "x smaller-than y"
```

![Figure 1-10. C# Ternary operator](images\ternary-operator.png)

