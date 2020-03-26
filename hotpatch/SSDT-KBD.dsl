// Lenovo ThinkPad T440S Keyboard Map.
// Lenovo ThinkPad T440S TouchPad Configuration.

DefinitionBlock("", "SSDT", 2, "T440S", "_KBD", 0)
{
    External (_SB.PCI0.LPC.EC, DeviceObj)
    External (_SB.PCI0.LPC.KBD, DeviceObj)
    External (_SB.PCI0.LPC.EC.XQ14, MethodObj)
    External (_SB.PCI0.LPC.EC.XQ15, MethodObj)
    External (_SB.PCI0.LPC.EC.XQ6A, MethodObj)
    External (_SB.PCI0.LPC.EC.XQ16, MethodObj)
    External (_SB.PCI0.LPC.EC.XQ64, MethodObj)
    External (_SB.PCI0.LPC.EC.XQ66, MethodObj)
    External (_SB.PCI0.LPC.EC.XQ67, MethodObj)
    External (_SB.PCI0.LPC.EC.XQ68, MethodObj)
    External (_SB.PCI0.LPC.EC.XQ69, MethodObj)
    
    Scope (_SB.PCI0.LPC.EC)
    {
        Method (_Q14, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                Notify (KBD, 0x0406)
            }
            Else
            {
                \_SB.PCI0.LPC.EC.XQ14 ()
            }
        }

        Method (_Q15, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                Notify (KBD, 0x0405)
            }
            Else
            {
                \_SB.PCI0.LPC.EC.XQ15 ()
            }
        }

        Method (_Q6A, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                Notify (KBD, 0x033E)
            }
            Else
            {
                \_SB.PCI0.LPC.EC.XQ6A ()
            }
        }

        Method (_Q16, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                Notify (KBD, 0x046E)
            }
            Else
            {
                \_SB.PCI0.LPC.EC.XQ16 ()
            }
        }

        Method (_Q64, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                Notify (KBD, 0x0342)
            }
            Else
            {
                \_SB.PCI0.LPC.EC.XQ64 ()
            }
        }

        Method (_Q66, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                Notify (KBD, 0x0367)
            }
            Else
            {
                \_SB.PCI0.LPC.EC.XQ66 ()
            }
        }

        Method (_Q67, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                Notify (KBD, 0x0368)
            }
            Else
            {
                \_SB.PCI0.LPC.EC.XQ67 ()
            }
        }

        Method (_Q68, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                Notify (KBD, 0x0369)
            }
            Else
            {
                \_SB.PCI0.LPC.EC.XQ68 ()
            }
        }

        Method (_Q69, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                Notify (KBD, 0x036A)
            }
            Else
            {
                \_SB.PCI0.LPC.EC.XQ69 ()
            }
        }
    }
    
    Scope (_SB.PCI0.LPC.KBD)
    {
        // Select specific configuration in VoodooPS2Trackpad.kext
        Method(_DSM, 4)
        {
            If (!Arg2) { Return (Buffer() { 0x03 } ) }
            Return (Package()
            {
                "RM,oem-id", "LENOVO",
                "RM,oem-table-id", "Thinkpad_Clickpad",
            })
        }
        // Overrides (the example data here is default in the Info.plist)
        Name(RMCF, Package()
        {
            "Synaptics TouchPad", Package()
            {
                "BogusDeltaThreshX", 100,
                "BogusDeltaThreshY", 100,
                "Clicking", ">y",
                "DragLockTempMask", 0x40004,
                "DynamicEWMode", ">n",
                "FakeMiddleButton", ">n",
                "HWResetOnStart", ">y",
                //"ForcePassThrough", ">y",
                //"SkipPassThrough", ">y",
                "PalmNoAction When Typing", ">y",
                "ScrollResolution", 800,
                "SmoothInput", ">y",
                "UnsmoothInput", ">y",
                "Thinkpad", ">y",
                "EdgeBottom", 0,
                "FingerZ", 30,
                "MaxTapTime", 100000000,
                "MouseMultiplierX", 2,
                "MouseMultiplierY", 2,
                "MouseScrollMultiplierX", 2,
                "MouseScrollMultiplierY", 2,
                //"TrackpointScrollYMultiplier", 1, //Change this value to 0xFFFF in order to inverse the vertical scroll direction of the Trackpoint when holding the middle mouse button.
                //"TrackpointScrollXMultiplier", 1, //Change this value to 0xFFFF in order to inverse the horizontal scroll direction of the Trackpoint when holding the middle mouse button.
            },
            "Keyboard", Package()
            {
                "Custom PS2 Map", Package()
                {
                    Package() { },
                    "e037=64", // PrtSc=F13
                },
            },
        })
    }
}
