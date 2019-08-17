// Patched WAK for LED Blink after wake from sleep fix

#ifndef NO_DEFINITIONBLOCK
DefinitionBlock ("", "SSDT", 2, "T440S", "_WAK", 0)
{
#endif
    External(WAKI, DeviceObj)
    External(SPS, FieldUnitObj)
    External(_SB.PCI0.LPC.EC.HCMU, FieldUnitObj)
    External(_SB.PCI0.LPC.EC.EVNT, MethodObj)
    External(_SB.PCI0.LPC.EC.HKEY.MHKE, MethodObj)
    External(_SB.PCI0.LPC.EC.FNST, MethodObj)
    External(UCMS, MethodObj)
    External(LIDB, FieldUnitObj)
    External(_SB.PCI0.IGPU.VRSI, MethodObj)
    External(_SB.PCI0.LPC.EC.HFNI, MethodObj)
    External(FNID, FieldUnitObj)
    External(NVSS, MethodObj)
    External(\_SI._SST, MethodObj)
    External(_SB.PCI0.LPC.EC.AC._PSR, MethodObj)
    External(PWRS, FieldUnitObj)
    External(OSC4, FieldUnitObj)
    External(PNTF, MethodObj)
    External(ACST, FieldUnitObj)
    External(_SB.PCI0.LPC.EC.ATMC, MethodObj)
    External(SCRM, FieldUnitObj)
    External(_SB.PCI0.LPC.EC.HFSP, FieldUnitObj)
    External(MTAU, FieldUnitObj)
    External(_SB.PCI0.LPC.EC.PIBS, FieldUnitObj)
    External(_SB.PCI0.LPC.EC.PLSL, FieldUnitObj)
    External(_SB.PCI0.LPC.EC.PLTU, FieldUnitObj)
    External(PL1L, FieldUnitObj)
    External(_SB.PCI0.LPC.EC.PLLS, FieldUnitObj)
    External(PL1M, FieldUnitObj)
    External(_SB.PCI0.LPC.EC.PLMS, FieldUnitObj)
    External(IOEN, FieldUnitObj)
    External(IOST, FieldUnitObj)
    External(ISWK, FieldUnitObj)
    External(_SB.PCI0.LPC.EC.HKEY.DHKC, MethodObj)
    External(_SB.PCI0.LPC.EC.HKEY.MHKQ, MethodObj)
    External(VIGD, FieldUnitObj)
    External(_SB.PCI0.IGPU.GLIS, MethodObj)
    External(_SB.LID._LID, MethodObj)
    External(WVIS, FieldUnitObj)
    External(VBTD, MethodObj)
    External(VCMS, MethodObj)
    External(AWON, MethodObj)
    External(CMPR, FieldUnitObj)
    External(_SB.SLPB, DeviceObj)
    External(USBR, FieldUnitObj)
    External(_SB.PCI0.XHCI.XRST, FieldUnitObj)
    External(XHCI, FieldUnitObj)
    External(_SB.PCI0.XHCI.PR3, FieldUnitObj)
    External(_SB.PCI0.XHCI.PR3M, FieldUnitObj)
    External(_SB.PCI0.XHCI.PR2, FieldUnitObj)
    External(_SB.PCI0.XHCI.PR2M, FieldUnitObj)
    External(ISCT, FieldUnitObj)
    External(_SB.PCI0.IGPU.TCHE, MethodObj)
    External(_SB.IAOE.GAOS, MethodObj)
    External(_SB.IAOE.GSWR, MethodObj)
    External(_SB.PCI0.IGPU.STAT, FieldUnitObj)
    External(_SB.PCI0.LPC.EC.SKEM, FieldUnitObj)
    External(_SB.PCI0.LPC.EC.HSPA, FieldUnitObj)
    External(NBCF, FieldUnitObj)
    External(_SB.PCI0.LPC.EC.BRNS, MethodObj)
    External(VBRC, MethodObj)
    External(BRLV, FieldUnitObj)
    External(_SB.PCI0.LPC.EC.BATW, MethodObj)
    External(_SB.PCI0.LPC.EC.HKEY.WGWK, MethodObj)
    External(_TZ.THM0, ThermalZoneObj)
    External(VSLD, MethodObj)
    External(RRBF, FieldUnitObj)
    External(_SB.PCI0.LPC.EC.HWAC, FieldUnitObj)
    External(CSUM, MethodObj)
    External(CHKC, FieldUnitObj)
    External(CHKE, FieldUnitObj)
    
    Method (\_WAK, 1, NotSerialized)  // _WAK: Wake
    {
        If (LOr (LEqual (Arg0, 0x00), LGreaterEqual (Arg0, 0x05)))
        {
            Return (WAKI)
        }

        Store (0x00, \SPS)
        Store (0x00, \_SB.PCI0.LPC.EC.HCMU)
        \_SB.PCI0.LPC.EC.EVNT (0x01)
        \_SB.PCI0.LPC.EC.HKEY.MHKE (0x01)
        \_SB.PCI0.LPC.EC.FNST ()
        \UCMS (0x0D)
        Store (0x00, \LIDB)
        \_SB.PCI0.IGPU.VRSI ()
        If (LEqual (Arg0, 0x01))
        {
            Store (\_SB.PCI0.LPC.EC.HFNI, \FNID)
        }

        If (LEqual (Arg0, 0x03))
        {
            \NVSS (0x00)
            \_SI._SST(1)
            Store (\_SB.PCI0.LPC.EC.AC._PSR (), \PWRS)
            If (\OSC4)
            {
                \PNTF (0x81)
            }

            If (LNotEqual (\ACST, \_SB.PCI0.LPC.EC.AC._PSR ()))
            {
                \_SB.PCI0.LPC.EC.ATMC ()
            }

            If (\SCRM)
            {
                Store (0x07, \_SB.PCI0.LPC.EC.HFSP)
                If (\MTAU)
                {
                    Store (0x03E8, Local2)
                    While (LAnd (\_SB.PCI0.LPC.EC.PIBS, Local2))
                    {
                        Sleep (0x01)
                        Decrement (Local2)
                    }

                    If (Local2)
                    {
                        Store (0x01, \_SB.PCI0.LPC.EC.PLSL)
                        Store (\MTAU, \_SB.PCI0.LPC.EC.PLTU)
                        Store (\PL1L, \_SB.PCI0.LPC.EC.PLLS)
                        Store (\PL1M, \_SB.PCI0.LPC.EC.PLMS)
                    }
                }
            }

            Store (0x00, \IOEN)
            Store (0x00, \IOST)
            If (LEqual (\ISWK, 0x01))
            {
                If (\_SB.PCI0.LPC.EC.HKEY.DHKC)
                {
                    \_SB.PCI0.LPC.EC.HKEY.MHKQ (0x6070)
                }
            }

            If (\VIGD)
            {
                \_SB.PCI0.IGPU.GLIS (\_SB.LID._LID ())
                If (\WVIS)
                {
                    \VBTD ()
                }
            }
            ElseIf (\WVIS)
            {
                \_SB.PCI0.IGPU.GLIS (\_SB.LID._LID ())
                \VBTD ()
            }

            \VCMS (0x01, \_SB.LID._LID ())
            \AWON (0x00)
            If (\CMPR)
            {
                Notify (\_SB.SLPB, 0x02)
                Store (0x00, \CMPR)
            }

            If (LOr (\USBR, \_SB.PCI0.XHCI.XRST))
            {
                If (LOr (LEqual (\XHCI, 0x02), LEqual (\XHCI, 0x03)))
                {
                    Store (0x00, Local0)
                    And (\_SB.PCI0.XHCI.PR3, 0xFFFFFFC0, Local0)
                    Or (Local0, \_SB.PCI0.XHCI.PR3M, \_SB.PCI0.XHCI.PR3)
                    Store (0x00, Local0)
                    And (\_SB.PCI0.XHCI.PR2, 0xFFFF8000, Local0)
                    Or (Local0, \_SB.PCI0.XHCI.PR2M, \_SB.PCI0.XHCI.PR2)
                }
            }

            If (LNotEqual (\ISCT, 0x00))
            {
                If (\VIGD)
                {
                    If (And (\_SB.PCI0.IGPU.TCHE, 0x0100))
                    {
                        If (And (\_SB.IAOE.GAOS, 0x01))
                        {
                            If (And (\_SB.IAOE.GSWR, 0x02))
                            {
                                Store (Or (And (\_SB.PCI0.IGPU.STAT, Not (0x03)), 0x01), \_SB.PCI0.IGPU.STAT)
                                Store (0x01, \_SB.PCI0.LPC.EC.SKEM)
                            }
                        }
                    }
                }
            }
        }

        If (LEqual (Arg0, 0x04))
        {
            \NVSS (0x00)
            Store (0x00, \_SB.PCI0.LPC.EC.HSPA)
            Store (\_SB.PCI0.LPC.EC.AC._PSR (), \PWRS)
            If (\OSC4)
            {
                \PNTF (0x81)
            }

            \_SB.PCI0.LPC.EC.ATMC ()
            If (\SCRM)
            {
                Store (0x07, \_SB.PCI0.LPC.EC.HFSP)
                If (\MTAU)
                {
                    Store (0x03E8, Local2)
                    While (LAnd (\_SB.PCI0.LPC.EC.PIBS, Local2))
                    {
                        Sleep (0x01)
                        Decrement (Local2)
                    }

                    If (Local2)
                    {
                        Store (0x01, \_SB.PCI0.LPC.EC.PLSL)
                        Store (\MTAU, \_SB.PCI0.LPC.EC.PLTU)
                        Store (\PL1L, \_SB.PCI0.LPC.EC.PLLS)
                        Store (\PL1M, \_SB.PCI0.LPC.EC.PLMS)
                    }
                }
            }

            If (LNot (\NBCF))
            {
                If (\VIGD)
                {
                    \_SB.PCI0.LPC.EC.BRNS ()
                }
                Else
                {
                    \VBRC (\BRLV)
                }
            }

            Store (0x00, \IOEN)
            Store (0x00, \IOST)
            If (LEqual (\ISWK, 0x02))
            {
                If (\_SB.PCI0.LPC.EC.HKEY.DHKC)
                {
                    \_SB.PCI0.LPC.EC.HKEY.MHKQ (0x6080)
                }
            }

            If (\_SB.PCI0.XHCI.XRST)
            {
                If (LOr (LEqual (\XHCI, 0x02), LEqual (\XHCI, 0x03)))
                {
                    Store (0x00, Local0)
                    And (\_SB.PCI0.XHCI.PR3, 0xFFFFFFC0, Local0)
                    Or (Local0, \_SB.PCI0.XHCI.PR3M, \_SB.PCI0.XHCI.PR3)
                    Store (0x00, Local0)
                    And (\_SB.PCI0.XHCI.PR2, 0xFFFF8000, Local0)
                    Or (Local0, \_SB.PCI0.XHCI.PR2M, \_SB.PCI0.XHCI.PR2)
                }
            }
        }

        \_SB.PCI0.LPC.EC.BATW (Arg0)
        \_SB.PCI0.LPC.EC.HKEY.WGWK (Arg0)
        Notify (\_TZ.THM0, 0x80)
        \VSLD (\_SB.LID._LID ())
        If (\VIGD)
        {
            \_SB.PCI0.IGPU.GLIS (\_SB.LID._LID ())
        }
        ElseIf (\WVIS)
        {
            \_SB.PCI0.IGPU.GLIS (\_SB.LID._LID ())
        }

        If (LLess (Arg0, 0x04))
        {
            If (LOr (And (\RRBF, 0x02), And (\_SB.PCI0.LPC.EC.HWAC, 0x02)))
            {
                ShiftLeft (Arg0, 0x08, Local0)
                Store (Or (0x2013, Local0), Local0)
                \_SB.PCI0.LPC.EC.HKEY.MHKQ (Local0)
            }
        }

        If (LEqual (Arg0, 0x04))
        {
            Store (0x00, Local0)
            Store (\CSUM (0x00), Local1)
            If (LNotEqual (Local1, \CHKC))
            {
                Store (0x01, Local0)
                Store (Local1, \CHKC)
            }

            Store (\CSUM (0x01), Local1)
            If (LNotEqual (Local1, \CHKE))
            {
                Store (0x01, Local0)
                Store (Local1, \CHKE)
            }

            If (Local0)
            {
                Notify (\_SB, 0x00)
            }
        }

        Store (Zero, \RRBF)
        Return (WAKI)
    }
#ifndef NO_DEFINITIONBLOCK
}
#endif
