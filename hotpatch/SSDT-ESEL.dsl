// Disable ESEL

#ifndef NO_DEFINITIONBLOCK
DefinitionBlock("", "SSDT", 2, "T440S", "_ESEL", 0)
{
    #endif
    External(_SB.PCI0.XHC, DeviceObj)
    Method(_SB.PCI0.XHC.ESEL)
    {
        // do nothing
    }
    #ifndef NO_DEFINITIONBLOCK
}
#endif
