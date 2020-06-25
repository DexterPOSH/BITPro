# Introduction to C#, C# Classes

## Prerequisites

* Install [.NET Core SDK](https://dotnet.microsoft.com/download)
* Visual Studio Code and the [C# extension](https://marketplace.visualstudio.com/items?itemName=ms-dotnettools.csharp) from the VS Code Marketplace.
* Visual Studio [Optional] that comes with additional benefits
    * C# Interactive (`csi.exe`) - The C# REPL Command-Line Interface
* Working with C# in VSCode - https://code.visualstudio.com/docs/languages/csharp

<hr>

## Overview of C# language

C# is a powerful, flexible and very popular modern programing language, which is simple and easy to learn and at the same time elegant as a programming language of few words. 

1. **Modern** - Automatic garbage collection, lambda expressions, advanced debugging, exception handling and most importantly security.

2. **Open source** and **Cross platform** - .NET Core and the C# compiler are both open source and developers can build .NET applications that can run on Windows, Linux, and MacOS.

3. **Object Oriented** - Concepts like `encapsulation`, `inheritance`, and `polymorphism` are all supported, which makes development and maintenance of code easier as the project grows compared to a Procedure-oriented programming language.

4. **Type safety** - C# enforces type safety by limiting ways of interaction of object by the object type. Only operations are permitted by type definition are applied to the object, that means type casting objects to incompatible data type is restricted.

5. **Modular** - C# supports modular software development, that means applications can be written in chunks or pieces of code as in functions, classes etc that are reusable, easy to modify and extensible.

6. **Secure** - Enable developers to secure their code with prebuilt cryptographic algorithms like Advanced Encryption Standard (`AES`) and Data protection API (`DAPI`).

7. **Robust, Versatile** and **Evolving** - Fastest evolving programming language, from Windows client applications to pretty much anything like cross platform client applications, Web services, distributed components, cloud applications, database applications, Internet of Things (`IoT`) and now `AI` and Machine learning ( [ML.NET](https://dotnet.microsoft.com/apps/machinelearning-ai/ml-dotnet) ).

<hr>

## Compilers, Runtime and .NET Framework

1. C# programs\source code is saved as: `FirstProgram.cs` file which is a High-level language.

2. A compiler which is a program that converts the source code into an intermediate language (`MSIL`) and saves that into a files `FirstProgram.exe` or `FirstProgram.dll`. 

3. The computer processor still doesn't understands the intermediate language and can only work on native\machine codes. So we need a another program called 'Common Language Runtime' (`CLR`) that uses a 'Just-In-Time' (`JIT`) compiler to transform this intermediate language into machine code in runtime.

    > *NOTE:* `.NET` is a blanket term to cover both the .NET Framework, which is an application framework library and the Common Language Runtime (`CLR`) which is the runtime in which .NET assemblies are run.

4. The machine code can be understand by the computers as a set of instructions to perform which low-level instructions.

![Figure 1-1. C# Code compilation and execution](img\fig1.png)


On a high-level these steps can also be categorized into two parts:

1. `Compile Time` - Transformation of source code to intermediate language.
2. `Run time` - Conversion of intermediate language to machine code and executing machine code instructions.

<hr>

## C# Hello world using `dotnet` CLI

1. Initialize the project, by navigating to the folder in which you like to create a project and run the following command:

	```PowerShell
	dotnet new console --output MyApp
	```

    This will scaffold a folder for a basic C# console application, which will have a `program.cs` file with a `Main()` method that is the entry point of the program, from where it starts executing.

2. Open the `program.cs` file and modify it.

    ```CSharp
    using System;

    namespace MyApp
    {
        public class Program
        {
            public static void Main()
            {
                Console.WriteLine("Hello World!");
            }
        }
    }
    ```

3. Navigate to project folder: `MyApp` and run the following commands to build and run the project for you.

	```PowerShell
	Set-Location .\MyApp\
    
    # build and run the project
    dotnet run -v m
    
    # load the assembly in PowerShell
    [Reflection.Assembly]::LoadFrom((Resolve-Path .\bin\Debug\netcoreapp3.1\MyApp.dll).path)

    # use the class and methods
    [MyApp.Program]::Main() 
	```

<hr>

## Interactive C# - Bridging the gap between scripting and development

1. C# Interactive Window in Visual Studio 

    C# interactive Window is a simple, REPL (`read-eval-print-loop`) interactive programming environment that takes one user input at a time in form of commands and expressions to let you play with APIs, learn new language features and experiment by enabling us to evaluate them directly with immediate feedback as results to the user. 

    You must have latest version of Visual Studio installed to access the Interactive Window. 

    `Visual Studio > Menu Bar > View > Other Windows > C# Interactive`

2. C# interactive from command line ( `CSI.exe` )

    This command-line script execution engine (CSI) is also available outside Visual Studio and can be access from Developer Command Prompt or PowerShell for Visual Studio 2019, just by running the command: `csi` , here `csi` stands for C Sharp Interactive.


3. `dotnet-script` extension for .Net Core CLI 

    A list of tool extensions for .NET Core Command Line, also known as '.NET Core global tools' can be downloaded using the dotnet CLI, but we are specifically looking for a tool called `dotnet-scripts`. This extension allows you to run C# scripts (`.csx` files) from the .NET CLI, define NuGet packages inline, edit and debug them in VS Code. More than that you get a interactive C# console to run your snippets directly from Visual Studio Code Terminal or any console like PowerShell or even Command prompt (CMD).

    To install the `dotnet script` extension run the following command, simply using nothing but the .NET CLI:

    ```CMD
    dotnet tool install -g dotnet-script
    ```

    Once the installation is complete you can also list the and verify all the tool extension using the .NET CLI again as demonstrated in the following example and enter in an interactive REPL console by running `dotnet script`:

    ```CMD
    dotnet tool list -g
    dotnet script
    ```

    Above image illustrates, that we can define variables interactively and access methods on them one line at a time. Moreover, you can combine such commands into a file and save it as `.csx` extension, which is a CSharp script file and execute the script using the syntax:

    ```CMD
    dotnet script <path to .csx script file>
    ```

<hr>

## C# Namespaces

* `namespace` keyword to define namespaces
* `using` directive to use the types\classes in your program
* C# namespaces are used to neatly organize classes
* Logical separation of your code and avoid any `class` naming conflicts.


```CSharp
using System;

namespace Demo
{
    class Class1
    {
        // body of Class1
    }

    class Class2
    {
        // body of Class2
    }
}
```

In the above example, `System` is a namespace defined in .Net Framework that contains the fundamental and base classes like `Console`, which has a method called `WriteLine()` that can write the specified data to the standard output stream. At the top of the program, in our example, we used `using` directive followed by the name of namespace , which allows the use of types in the namespace, without fully qualified name like `Console.WriteLine()` instead of `System.Console.WriteLine()`.

<hr>

## C# Classes

A class is a blueprint or prototype that is used to define an object.

### Declaring a Class

Classes are declared by using `class` keyword. 

```CSharp
public class MyClass
{
    // Properties, Methods, Events, etc.
}
```

Let's take an example, that we want to define a Car in C#, first thing we have do is create a class declaration for that using the following code snippet:

{format: csharp}
![Example 1-3. C# Classes](code\chp1\Example 1-3.cs)


```CSharp
using System;
public class Car
{
    public string color = "red"; // property
    public int maxSpeedMPH = 200; // property

    public void start() // method
    {
        Console.WriteLine("Car started");
    }

    public void stop() // method
    {
        Console.WriteLine("Car stopped");
    }
}
```

Here, first thing you notice is `public` which is an access modifier, followed by the keyword `class` and the name of the class. then the body of class is enclosed in open and close brackets `{ }`. 


### Members of class

Class is a programmatical representation of a real world object that has characteristics or properties such as color, height, width and can perform functionalities such as start, stop, move, jump etc. 

All the constants, properties and methods defined inside body of a `class` are known as members of that class, as shown in the Example 1-3 of the above sub-section. Generally speaking members can be:

1. Property - Properties are attributes or characteristics of the class, which by default are `private` but, if they are `public` they can be accessed using class objects to change the characteristics of the Object. Like for `Car` Class, `color`, `maxSpeed` are properties that can have some default value like `color = "red"`, but these can be accessed and changed on each instance of this class called object.

2. Method - Methods are functions defined in a class, which have access to all the members of a class. The purpose is to perform a functionality for the object of the class, for example `Car` Class has a methods like: `start()` and `stop()`.

C# language doesn't support any global variables or methods, that means all the entry point of the program, which the `Main()` method is also defined inside a class. More that that class is just a blueprint and we have to instantiate the class or in other words create objects of the class to access the members.

### Creating an Object of Class

```csharp
Car tesla = new Car();

// accessing the members
tesla.color
tesla.maxSpeed
tesla.start()
tesla.stop()
```

So, to create a `tesla` object from `Car` class, we will use the `new` keyword as demonstrated in the the above example, and then access the members of this object using the `(.)` Dot operator in C#.


<hr>

## C# in PowerShell

```PowerShell
$CSharpCode = @"
using System;
namespace HelloWorld
{
	public class Program
	{
		public static void Main(){
			Console.WriteLine("Hello world!");
		}
	}
}
"@

Add-Type -TypeDefinition $CSharpCode -Language CSharp

# creating objects of the class
[Program]::Main() # throws error

New-Object -TypeName HelloWorld.Program # alternatively

```


```PowerShell
$CalcCode = @"
public class Calc{
    public int Add(int x,int y){
        return x+y;
    }
    public int Sub(int x,int y){
        return x-y;
    }
    public int Mul(int x,int y){
        return x*y;
	}
	// this method can be accessed without creating the object
    public static float Div(int x,int y){
        return x/y;
    }
}
"@

Add-Type -TypeDefinition $CalcCode -Language CSharp

# calling static method in Powershell
[Calc]::Div(10,2)
[Calc]::Add(1,2) # throws an exception

# calling instance method
# instantiate the class to access the non-static methods
$c = New-Object Calc
$c.Add(1,2)
$c.Mul(3,3)
$c.Div(16,4) # throws error
```