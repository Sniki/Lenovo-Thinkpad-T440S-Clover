// Lenovo ThinkPad(s) LED Blink fix after wake from sleep

DefinitionBlock("", "SSDT", 2, "Sniki", "_LED", 0)
{
    External (ZWAK, MethodObj)
    External (_SI._SST, MethodObj)
    // In DSDT, native _WAK is renamed ZWAK
    // As a result, calls to this method land here.
    Method(_WAK, 1)
    {
        If (_OSI ("Darwin"))
        {
            If (Arg0 = 3)
            {
                \_SI._SST(One)
            }
        }
        // call into original _WAK method
        Return(ZWAK(Arg0))
    }
}