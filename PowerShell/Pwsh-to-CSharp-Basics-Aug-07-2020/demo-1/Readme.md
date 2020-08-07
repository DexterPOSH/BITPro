# Introduction

Introductory sessions around picking up C# language for PowerShell scripters. This session will cover some of the C# programming elements.

We will cover these topics:

* Comments
* Case Sensitivity
* Using Directive and Statement

## Comments

Useful to document code, place TODOs etc. Both C# and PowerShell allow to place single, multi line comments but the syntax differs quite a bit.

### Single line comment

C# Example:

```csharp
// Single line comment in C#
System.Console.WriteLine("Hello, I am not commented");
```

PowerShell Example:

```powershell
# Single line comment in PowerShell
Write-Host "Hello, This is not a commented statement";
```

### Multi line comment

C# Example:

```csharp
/* Multi line comments in C#
Remember the C style comments :)
*/
System.Console.WriteLine("Hello, I am not commented");
```

PowerShell Example:

```powershell
<# Multi line comment in PowerShell
Remember PowerShell allows to embed comment based help
as well using the multi line comment
#>
Write-Host "Hello, This is not a commented statement";
```

## Case Sensitivity

C# is case-sensitive language 😮, PowerShell is not case-sensitive.
So be careful and not trip on it.

C# Example:

```csharp
string book = "boook1";
string Book = "book2";
string BOOK = "book3";
```

PowerShell is not case-sensitive which means all the below variables refer to the same.

PowerShell Example:

```powershell
$book = "Book1"
$BooK
$BOOK
```

## Using Directive & Statement

In C#, `using` keyword has 3 main purposes

### C# Add namespaces for type resolution

The `using` keyword can bring in the types defined in other namespaces to your program, so that you don't have to fully qualify the types.

Without the `using` statement

```csharp
System.Console.WriteLine("No using!");
```

With the `using` statement

```csharp
using System;
Console.WriteLine("Using");
```

### C# Create aliases for namespaces

```csharp
using ConsoleHost = System.Console;
ConsoleHost.WriteLine("Hello!");
```

### C# using Statement cleanup resoruces

Imagine opening a file in read-write mode and then when you're done with operation (or on an exception), one has to close the file handle etc. Similary with Database connections etc.

Using statement provides syntactic sugar around cleaning up resources if the type implement `IDisposable` interface. This interface asks to implement a method called `Dispose()` which the `using` statement will call automatically.

```csharp
string filePath = "test.txt";
using (StreamReader reader = new StreamReader(filePath))
{
    string line;
    while ((line =reader.ReadLine()) != null)
    {
        Console.WriteLine(line);
    }
}
```

In PowerShell `using` statement is primarly used in the classes.

> `using` statement must come before any other statements in a script.

### Pwsh add namespaces for typename resolution

Used to specify the .NET namespaces from which to resolve types.

```powershell
using namespace System.Net;

[IPAddress]$IPAddress = '10.10.10.10'
```

### Pwsh load classes from modules

If there is a PowerShell module, which bundles classes with it using `Import-Module` only imports the functions, aliases etc. but inorder to load the classes as well we need to use the `using` statement.

```powershell
using module <ModuleName>
```

### Pwsh load classes from an assembly

If you have an assembly which you want to load directly in PowerShell, use this. Remember old days we used `Add-Type` cmdlet to load the assembly file.

```powershell
using assembly <Path to the .dll file>
```
