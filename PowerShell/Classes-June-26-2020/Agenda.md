# Scripting to Development

* Introduction to PowerShell classes & NoteBooks
* Introduction to C# & NoteBooks`

## PowerShell Notebooks locally

Jupyter recently got support for an official PowerShell kernel. Follow below steps to get started with using PowerShell notebooks in Jupyter.

* Install Python3 & [Jupyter](https://jupyter.readthedocs.io/en/latest/install.html)

```bash
pip3 install --upgrade pip
pip3 install jupyter
```

* Download [.NET Core 3.1 SDK](https://dotnet.microsoft.com/download) and install it.

* Install Microsoft .NET Interactive global tool using the `dotnet` CLI as shown in the following example:

```bash
dotnet tool install -g --verbosity normal --add-source "https://pkgs.dev.azure.com/dnceng/public/_packaging/dotnet-tools/nuget/v3/index.json" Microsoft.dotnet-interactive
```

* Install the .NET Kernel

```bash
dotnet interactive jupyter install
```

* Verify the Kernels are installed

```bash
jupyter kernelspec list
```

* Run Jupyter Lab, it will provide a weblink to access the notebooks.

```bash
jupyter lab # run jupyter lab
```

* Use the NoteBook in the web portal

## Using binder

Head over to this link to try C#, F# & PowerShell notebooks.

https://mybinder.org/v2/gh/dotnet/interactive/master?urlpath=lab
