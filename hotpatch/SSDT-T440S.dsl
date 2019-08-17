// for testing including all SSDTs with NO_DEFINITIONBLOCK
DefinitionBlock("", "SSDT", 2, "Sniki", "_T440S", 0)
{
    #define NO_DEFINITIONBLOCK
    #include "SSDT-XOSI.dsl"
    #include "SSDT-BAT.dsl"
    #include "SSDT-KBD.dsl"
    #include "SSDT-WAK.dsl"
    #include "SSDT-USB.dsl"
    #include "SSDT-ESEL.dsl"
    #include "SSDT-ALC3232.dsl"
}
