class Computer {
    # Property: Holds name
    [String] $Name

    # Constructor: Creates a new MyClass object, with the specified name
    Computer([String] $hostname) {
        # Set name for MyClass
        $this.Name = $hostname
    }

    # Method: Method that changes $Name to the default name
    [void] Run() {
        Write-host "running..."
    }
}