#!/usr/bin/env dotnet-script
using System.IO;

string filePath = "test.txt";
using (StreamReader reader = new StreamReader(filePath))
{
    string line;
    while ((line =reader.ReadLine()) != null)
    {
        Console.WriteLine(line);
    }
}