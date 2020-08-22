using System;

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