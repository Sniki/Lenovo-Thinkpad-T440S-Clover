// Custom Configuration for Realtek ALC3232 Codec with ComboJack on Lenovo ThinkPads like:
// L440, L450, T440, T440S, T440P, T540P, T450, X240
// Must use AlcPlugFix to have all working Inputs & Outputs with Wake and Sleep support.
// Credits: Sniki

#ifndef NO_DEFINITIONBLOCK
DefinitionBlock ("", "SSDT", 1, "Sniki", "_ALC3232", 0)
{
    #endif
    External(_SB.PCI0.HDEF, DeviceObj)
    Name(_SB.PCI0.HDEF.RMCF, Package()
    {
        "CodecCommander", Package()
        {
            "Custom Commands", Package()
            {
                Package(){}, // signifies Array instead of Dictionary
                Package()
                {
                    // 0x15 SET_UNSOLICITED_ENABLE 0x83
                    "Command", Buffer() { 0x01, 0x57, 0x08, 0x83 },
                    "On Init", ">y",
                    "On Sleep", ">n",
                    "On Wake", ">y",
                },
                Package()
                {
                    // 0x1a SET_PIN_WIDGET_CONTROL 0x24
                    // Node 0x1a - Pin Control (In Enable / VRefEn)
                    "Command", Buffer() { 0x01, 0xa7, 0x07, 0x24 },
                    "On Init", ">y",
                    "On Sleep", ">n",
                    "On Wake", ">y",
                },
            },
            "Perform Reset", ">n",
            "Send Delay", 10,
            "Sleep Nodes", ">n",
        },
    })
    #ifndef NO_DEFINITIONBLOCK
}
#endif
