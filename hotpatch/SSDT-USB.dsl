// Lenovo ThinkPad T440S USB Port Injector
// Override incorrect MacBookAir6,2 and MacBookPro11,1 USB Power Properties with Macbook Pro14,3
// FingerPrint Reader Disabled (Not supported on macOS)
// Disable ESEL

#ifndef NO_DEFINITIONBLOCK
DefinitionBlock ("", "SSDT", 2, "T440S", "_USB", 0)
{
#endif
    Device(UIAC)
    {
        Name(_HID, "UIA00000")
        Name(RMCF, Package()
        {
            // USB Power Properties for Sierra and above (using USBInjectAll injection)
            "AppleBusPowerController", Package()
            {
                // these values happen to be MacBookPro14,3 values...
                "kUSBSleepPortCurrentLimit", 3000,
                "kUSBWakePortCurrentLimit", 3000,
            },
            "HUB1", Package()
            {
                "port-count", Buffer() { 8, 0, 0, 0 },
                "ports", Package()
                {
                    "HP15", Package() // TouchScreen
                    {
                        "portType", 2,
                        "port", Buffer() { 5, 0, 0, 0 },
                    },
                },
            },
            "EH01", Package()
            {
                "port-count", Buffer() { 8, 0, 0, 0 },
                "ports", Package()
                {
                    "PR11", Package()
                    {
                        "UsbConnector", 255,
                        "port", Buffer() { 1, 0, 0, 0 },
                    },
                },
            },
            "8086_9c31", Package()
            {
                "port-count", Buffer() { 13, 0, 0, 0 },
                "ports", Package()
                {
                    "HS01", Package() // USB3 Port (USB2 Device)
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 1, 0, 0, 0 },
                    },
                    "HS02", Package() // USB3 Port (USB2 Device)
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 2, 0, 0, 0 },
                    },
                    "HS03", Package() // USB3 Port (USB2 Device)
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 3, 0, 0, 0 },
                    },
                    //"HS06", Package() // FingerPrint Reader
                    //{
                        //"UsbConnector", 255,
                        //"port", Buffer() { 6, 0, 0, 0 },
                    //},
                    "HS07", Package() // Bluetooth
                    {
                        "UsbConnector", 255,
                        "port", Buffer() { 7, 0, 0, 0 },
                    },
                    "HS08", Package() // Integrated Camera
                    {
                        "UsbConnector", 255,
                        "port", Buffer() { 8, 0, 0, 0 },
                    },
                    "SS01", Package() // USB3 Port
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 10, 0, 0, 0 },
                    },
                    "SS02", Package() // USB3 Port
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 11, 0, 0, 0 },
                    },
                    "SS03", Package() // USB3 Port
                    {
                        "UsbConnector", 3,
                        "port", Buffer() { 12, 0, 0, 0 },
                    },
                },
            },
        })
    }
    External(_SB.PCI0.XHC, DeviceObj)
    Method(_SB.PCI0.XHC.ESEL)
    {
        // do nothing
    }
#ifndef NO_DEFINITIONBLOCK
}
#endif
