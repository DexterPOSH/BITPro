## Whoami

    * Prateek Singh
    * Infrastructure Dev
    * Blog: Ridicurious.com
    * Follow me on Twitter: https://twitter.com/singhprateik
    * Linkedin : https://www.linkedin.com/in/prateeksingh1590
    * Books: 
        * https://www.apress.com/gp/book/9781484260371
        * https://leanpub.com/u/prateeksingh

## Agenda

    * Standard Input/Output
        * Printing on the console
        * Printing on the console without new-line
        * Reading from console
        * Reading from console securely
    * Command-line arguments
        * $args
        * args

## Prerequisites

Go to have basic understanding of creating and running .Net Core applications and using C#, read this blog post to write your first Hello world program in C# with line-by-line explanation: https://ridicurious.com/2020/07/07/powershell-to-csharp-and-back-hello-world-explained/


# Standard Input and Output

The standard input-output also known as "Standard I/O" is a system input-output mechanism created since the UNIX operating systems was developed many years ago. Special peripheral devices for input and output are used, through which data can be input and output.

Every program and applications can have one or more of the 3 streams:

* **Standard Input** - Used to provide user input to a process or a program from a device like Keyboard.

* **Standard output** - Used to report regular data. For example, let’s say that you have an application that prints your tasks. The standard output is a perfect place where your application can print the tasks.

* **Error output** – Used for providing details about unexpected situations, like application crash.

![Standard I/O](images\standardio.png)

In C# and other .NET languages, the standard streams are referred to by `System.Console.In` (for `stdin`), `System.Console.Out` (for `stdout`) and `System.Console.Error` (for `stderr`). 

Basic read and write capabilities for the stdin and stdout streams are also accessible directly through the class System.Console (e.g. `System.Console.WriteLine()` can be used instead of `System.Console.Out.WriteLine()`).

## Printing on the console 

To print information on the console `Write-Host` and `Write-Output` cmdlets in PowerShell are used. In fact in PowerShell, it's much simpler and we can directly output strings to the console.

```PowerShell
Write-host "Hello World!"

Write-Output "Hello World!"

# alternatively
"Hello World!"
```

In PowerShell `Write-Host` cmdlet writes the specified data, followed by the current line terminator, to the standard output stream.

```PowerShell
Write-Host ("{0:C2}" -f 123.456)
Write-Host ("{0:D6}" -f -1234)
Write-Host ("{0:E2}" -f 123)
Write-Host ("{0:F2}" -f -123.456)
Write-Host ("{0:N2}" -f 1234567.8)
Write-Host ("{0:P}" -f 0.456)
Write-Host ("{0:X}" -f 254)
```

In C# we use `System.Console.WriteLine()` method

```CSharp
Console.WriteLine("{0:C2}", 123.456);
Console.WriteLine("{0:D6}", -1234);
Console.WriteLine("{0:E2}", 123);
Console.WriteLine("{0:F2}", -123.456);
Console.WriteLine("{0:N2}", 1234567.8);
Console.WriteLine("{0:P}", 0.456);
Console.WriteLine("{0:X}", 254);
```

![Printing to the console](images\printtoconsole.png)

You can use this .NET method in PowerShell as well

```PowerShell
[System.Console]::WriteLine("hello")
```

## Printing without a New-Line

Printing without a new line or in other words without adding a line feed character at the end of the output string is fairly simple.

In PowerShell when you don't want to add a line-feed you use `Write-Host` cmdlet with a `-NoNewLine` switch parameter, which will continue printing the next item just after the previous one, as demonstrated in the following example:

```PowerShell
Write-host "Hello World!" -NoNewLine
Write-Host " My name is Prateek"
```

In C# we use the `Write()` method instead of `WriteLine()` to print the output in the same line.

```CSharp
Console.Write("Hello World!");Console.Write(" My name is Prateek");
```

## Reading from Console

Prompting input from users in the PowerShell console is as easy as using the cmdlet `Read-Host`, which can read a line of input from the console. You must specify a meaningful prompt string to the user for the input, and then capture user input to a variable.

PowerShell:
```PowerShell
$name = Read-Host 'Enter your name'
"Hello $name!"
```

C#:
```csharp
Console.WriteLine("Enter your name");
var name = Console.ReadLine();
```

## Reading from Console Securely

`Read-Host` cmdlet has a `AsSecureString` switch parameter, that masks all user input as asterisks (*) in place of the characters and returns a `SecureString` object

PowerShell:

```PowerShell
$password = Read-Host 'Enter Password: ' -AsSecureString
```
Whereas, reading securely in C# is little more work

C#:
```CSharp
using System;
using System.Management.Automation;

namespace app {
    class Program {
        static void Main(string[] args) {
            // PowerShell ps = PowerShell.Create();
            // ps.AddCommand("Read-Host").AddParameter("AsSecureString").Invoke();
            Console.Write ("Enter your password: ");
            var password = string.Empty;
            ConsoleKey key;
            do {
                var keyInfo = Console.ReadKey(intercept: true);
                key = keyInfo.Key;
                // if backspace is pressed and password string has chars
                if (key == ConsoleKey.Backspace && password.Length > 0) {
                    Console.Write("\b \b");
                    password = password.Substring(0,(password.Length-1));
                }
                // if input char is not a control char like CR, LF
                else if (!char.IsControl(keyInfo.KeyChar)) {
                    Console.Write("*");
                    password += keyInfo.KeyChar;
                }
            // exit infinite loop when 'ENTER' is pressed
            } while (key != ConsoleKey.Enter); 
            Console.WriteLine("\nYour Password is: "+password);
        }
    }
}
```

**NOTES:**

* The `ReadKey()` method by default echoes keys pressed by the user on the console and to suppress this behavior, call the ReadKey method with an `intercept` argument of `true`, like `ReadKey(intercept: true)`

* The purpose `Console.Write("\b \b")` is to take the cursor position to n-1 char using first `\b` and then print white space `' '` to overwrite the asterisk printed before, then again take the cursor back to the `n-1` char. To understand this better replace the space between the backspace escape chars with a '+', like `Console.Write("\b+\b");` and run the program again.

# Command-Line Arguments

PowerShell has an Automatic variable `$args` that contains an array of values for undeclared parameters that are passed to a function, script, or script block.

```PowerShell
if ($args.Length -gt 0)
{
    for ($i = 0; $i -lt $args.Length; $i++)
    {
        Write-Host ("args[{0}] = {1}" -f $i, $args[$i])
    }
}
else{
    Write-Host "No command line argument was supplied"
}
```

On other hand, a C# program has a `main()` method as entry point of the program, which has a string array called `"args"` and this is automatically populated with command-line arguments passed to the program.

```CSharp
using System;

class Program
{
    static void Main(string[] args)
    {
        if (args.Length > 0)
        {
            for (int i = 0; i < args.Length; i++)
            {
                Console.WriteLine("args[{0}] = {1}",i,args[i]);
            }
        }
        else{
            Console.WriteLine("No command line argument was supplied");
        }
    }
}
```
