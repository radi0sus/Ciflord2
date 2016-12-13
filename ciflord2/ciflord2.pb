EnableExplicit

;=============================Structures=====================================

Structure Summenformel
  Alles.s
  Elemente.s
  Anzahl.s
EndStructure

Structure Moietyformel
  Alles.s
  Element_u_Anzahl.s
  Elemente.s
  Anzahl.s
  Ladung.s
  Trennung.s
  Aufklammer.s
  Zuklammer.s
EndStructure

Structure DistCIFStructure
 Alles.s 
 Atom1.s   
 Atom2.s  
 Element1.s
 Element2.s
 Abstand.s
 AbstandNum.d
 EsdNum.i
 Symmetrie1.s
 Symmetrie2.s   
 SymmetrieSymbol1.s
 SymmetrieSymbol2.s
EndStructure

Structure AngCIFStructure
 Alles.s 
 Atom1.s   
 Atom2.s  
 Atom3.s
 Element1.s
 Element2.s
 Element3.s
 Winkel.s
 WinkelNum.d
 EsdNum.i
 Symmetrie1.s
 Symmetrie2.s  
 Symmetrie3.s  
 SymmetrieSymbol1.s
 SymmetrieSymbol2.s
 SymmetrieSymbol3.s
EndStructure

Structure RawTableStructure
  Number_of_Tableitems.i
  Tableitems.s[20]
EndStructure

Structure xyz
  x.s
  y.s
  z.s
  sign_x.s
  sign_y.s
  sign_z.s
  fac_x.s
  fac_y.s
  fac_z.s
  xnew.s
  ynew.s
  znew.s
EndStructure

Structure opxyz
  opx.s
  opy.s
  opz.s
EndStructure

;=============================Global Lists==================================

Global.s NewList CifFile.s()
Global.s NewList ProfileFile.s()
Global.s NewList Elements.s()
Global NewList Sum_Formula.Summenformel()
Global NewList Moiety_Formula.Moietyformel()
Global NewList Bond_Lenghts_from_CIF.DistCIFStructure()
Global NewList Angles_from_CIF.AngCIFStructure()
Global NewList Selected_Bond_Lenghts_from_CIF.DistCIFStructure()
Global NewList Selected_Angles_from_CIF.AngCIFStructure()
Global NewList Sorted_Selected_Bond_Lenghts_from_CIF.DistCIFStructure()
Global NewList Sorted_Selected_Angles_from_CIF.AngCIFStructure()
Global NewList Sym_Ops_from_CIF.s()
Global NewList RawTable.RawTableStructure()
Global NewList Rtffile.s()
Global NewList LaTeXFile.s()
Global NewList AsciiFile.s()
Global NewList Markdown_AsciiFile.s()
Global NewList RTF_Bondlengths_2_Column_Table.s()
Global NewList LaTeX_Bondlengths_2_Column_Table.s()
Global NewList Ascii_Bondlengths_2_Column_Table.s()
Global NewList Markdown_Ascii_Bondlengths_2_Column_Table.s()
Global NewList RTF_Bondlengths_4_Column_Table.s()
Global NewList LaTeX_Bondlengths_4_Column_Table.s()
Global NewList Ascii_Bondlengths_4_Column_Table.s()
Global NewList Markdown_Ascii_Bondlengths_4_Column_Table.s()
Global NewList RTF_Angles_2_Column_Table.s()
Global NewList LaTeX_Angles_2_Column_Table.s()
Global NewList Ascii_Angles_2_Column_Table.s()
Global NewList Markdown_Ascii_Angles_2_Column_Table.s()
Global NewList RTF_Angles_4_Column_Table.s()
Global NewList LaTeX_Angles_4_Column_Table.s()
Global NewList Ascii_Angles_4_Column_Table.s()
Global NewList Markdown_Ascii_Angles_4_Column_Table.s()
Global NewList List_of_SymOps.s()

;=============================Global Maps==================================

Global NewMap CifItem.s()
Global NewMap SPG_Dict_RTF.s()
Global NewMap SPG_Dict_Latex.s()
Global NewMap SPG_Dict_Markdown_Ascii.s()
Global NewMap Greek_Dict_Latex.s()
Global NewMap Symcode_to_SymSymbol.s()

;=============================Global Variables=============================

Global.s CIF_Filename.s
Global.s Name_of_Structure.s

;=============================Functions====================================

Declare Open_and_Read_CIF(Filename.s)                                                                   ;Oeffnet CIF und liest Daten
Declare Open_and_Read_Profile(Profile_Name.s)                                                           ;Oeffnet CIF und liest Daten
Declare Get_Name_of_Structure(List Name_of_CifFile.s())                                                 ;Extrahiert data_xxx item
Declare Get_Elements(List Name_of_CifFile.s())                                                          ;Ermittelt alle chem. Elemente in der Struktur
Declare Get_Sum_Formula(List Name_of_CifFile.s())                                                       ;Summenformel ermitteln
Declare Get_Moiety_Formula(List Name_of_CifFile.s())                                                    ;Moiety ermitteln
Declare Get_HKL_Range(List Name_of_CifFile.s())                                                         ;HKL-Grenzen ermitteln
Declare Get_Space_Group(List Name_of_CifFile.s())                                                       ;Raumgruppe ermitteln aus CIF
Declare Get_SymOps_from_CIF(List Name_of_CifFile.s())                                                   ;SymOps aus CIF
Declare Get_Bond_Lengths_from_CIF(List Name_of_CifFile.s())                                             ;Bindungslaengen aus CIF
Declare Get_Angles_from_CIF(List Name_of_CifFile.s())                                                   ;Winkel aus CIF
Declare Select_Bond_Lengths_from_CIF(List Bond_Lenghts_from_CIF.DistCIFStructure(),Element.s)           ;Ausgewaehlte Bindungslaengen aus CIF 
Declare Select_Angles_from_CIF(List Angles_from_CIF.AngCIFStructure(),Element.s)                        ;Ausgewaehlte Winkel aus CIF
Declare Sort_Select_Bond_Lengths_from_CIF(List Selected_Bond_Lenghts_from_CIF.DistCIFStructure())       ;Ausgewaehlte Bindungslaengen aus CIF (sortiert: klein nach gross)
Declare Sort_Select_Angles_from_CIF(List Selected_Angles_from_CIF.AngCIFStructure())                    ;Ausgewaehlte Winkel aus CIF (sortiert: klein nach gross)
Declare Process_Profile_CIF(List ProfileFile.s())                                                       ;Anweisungen aus Profil verarbeiten, CIF-Teil
Declare Process_Profile_Table(List ProfileFile.s(), List Name_of_CifFile.s())                           ;Anweisungen aus Profil verarbeiten, Tabellen-Teil
Declare.s Symcode_to_String(symop.s,symcode.s)                                                          ;Nimmt symmetry(-x,-y,-z) + code(666) macht 1-x,1-y,1-z
Declare Create_New_CIF(List Name_of_CifFile.s())                                                        ;Erstellt einen neuen CIF aus altem CIF + Anweisungen aus Profil
Declare Create_RTF(List RawTable.RawTableStructure())                                                   ;Erstellt eine RTF-Format Liste aus Tabellenstruktur
Declare Create_LaTeX(List RawTable.RawTableStructure())                                                 ;Erstellt eine LaTeX-Format Liste aus Tabellenstruktur
Declare Create_Ascii(List RawTable.RawTableStructure())                                                 ;Erstellt eine Ascii-Format Liste aus Tabellenstruktur
Declare Create_Markdown_Ascii(List RawTable.RawTableStructure())                                        ;Erstellt eine Markdown Ascii-Format Liste aus Tabellenstruktur
Declare Create_Bondlengths_2_Column_Table_RTF(List Selected_Bond_Lenghts_from_CIF.DistCIFStructure())              ;Erstellt zweispaltige Tabelle ausgewaehlter Bindungslaengen im RTF-Format
Declare Create_Bondlengths_2_Column_Table_LaTeX(List Selected_Bond_Lenghts_from_CIF.DistCIFStructure())            ;Erstellt zweispaltige Tabelle ausgewaehlter Bindungslaengen im LaTeX-Format
Declare Create_Bondlengths_2_Column_Table_Ascii(List Selected_Bond_Lenghts_from_CIF.DistCIFStructure(), Caption.s) ;Erstellt zweispaltige Tabelle ausgewaehlter Bindungslaengen im Ascii-Format
Declare Create_Bondlengths_2_Column_Table_Markdown_Ascii(List Selected_Bond_Lenghts_from_CIF.DistCIFStructure(), Caption.s) ;Erstellt zweispaltige Tabelle ausgewaehlter Bindungslaengen im Markdown Ascii-Format
Declare Create_Angles_2_Column_Table_RTF(List Selected_Angles_from_CIF.AngCIFStructure())                         ;Erstellt zweispaltige Tabelle ausgewaehlter Bindungswinkel im RTF-Format
Declare Create_Angles_2_Column_Table_LaTeX(List Selected_Angles_from_CIF.AngCIFStructure())                       ;Erstellt zweispaltige Tabelle ausgewaehlter Bindungswinkel im LaTeX-Format
Declare Create_Angles_2_Column_Table_Ascii(List Selected_Angles_from_CIF.AngCIFStructure(), Caption.s)            ;Erstellt zweispaltige Tabelle ausgewaehlter Bindungswinkel im Ascii-Format
Declare Create_Angles_2_Column_Table_Markdown_Ascii(List Selected_Angles_from_CIF.AngCIFStructure(), Caption.s)   ;Erstellt zweispaltige Tabelle ausgewaehlter Bindungswinkel im Markdown Ascii-Format
Declare Create_Bondlengths_4_Column_Table_RTF(List Selected_Bond_Lenghts_from_CIF.DistCIFStructure())                       ;Erstellt vierspaltige Tabelle ausgewaehlter Bindungswinkel im RTF-Format
Declare Create_Bondlengths_4_Column_Table_LaTeX(List Selected_Bond_Lenghts_from_CIF.DistCIFStructure())                     ;Erstellt vierspaltige Tabelle ausgewaehlter Bindungswinkel im LaTex-Format
Declare Create_Bondlengths_4_Column_Table_Ascii(List Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Caption.s)           ;Erstellt vierspaltige Tabelle ausgewaehlter Bindungswinkel im Ascii-Format
Declare Create_Bondlengths_4_Column_Table_Markdown_Ascii(List Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Caption.s)  ;Erstellt vierspaltige Tabelle ausgewaehlter Bindungswinkel im Markdown Ascii-Format
Declare Create_Angles_4_Column_Table_RTF(List Selected_Angles_from_CIF.AngCIFStructure())                                   ;Erstellt vierspaltige Tabelle ausgewaehlter Bindungswinkel im RTF-Format
Declare Create_Angles_4_Column_Table_LaTeX(List Selected_Angles_from_CIF.AngCIFStructure())                                 ;Erstellt vierspaltige Tabelle ausgewaehlter Bindungswinkel im LaTeX-Format
Declare Create_Angles_4_Column_Table_Ascii(List Selected_Angles_from_CIF.AngCIFStructure(),Caption.s)                       ;Erstellt vierspaltige Tabelle ausgewaehlter Bindungswinkel im Ascii-Format
Declare Create_Angles_4_Column_Table_Markdown_Ascii(List Selected_Angles_from_CIF.AngCIFStructure(),Caption.s)              ;Erstellt vierspaltige Tabelle ausgewaehlter Bindungswinkel im Markdown Ascii-Format
Declare.s Create_Figure_Caption_RTF(List Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),List Selected_Angles_from_CIF.AngCIFStructure())               ;Erstellt Figure Caption im RTF-Format
Declare.s Create_Figure_Caption_LaTeX(List Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),List Selected_Angles_from_CIF.AngCIFStructure())             ;Erstellt Figure Caption im LaTeX-Format
Declare.s Create_Figure_Caption_Ascii(List Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),List Selected_Angles_from_CIF.AngCIFStructure())             ;Erstellt Figure Caption im Ascii-Format
Declare.s Create_Figure_Caption_Markdown_Ascii(List Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),List Selected_Angles_from_CIF.AngCIFStructure())    ;Erstellt Figure Caption im Markdown Ascii-Format
Declare.s Fill_SPG_Dict_RTF()                                                                           ;Dict fuer RG formatiert im RTF-Format
Declare.s HKL_entry_RTF()                                                                               ;HKL formatiert im RTF-Format
Declare.s HKL_entry_LaTeX()                                                                             ;HKL formatiert im LaTeX-Format
Declare.s HKL_entry_Ascii()                                                                             ;HKL formatiert im Ascii-Format
Declare.s Fill_SPG_Dict_Latex()                                                                         ;Dict fuer RG formatiert im Latex-Format
Declare.s Fill_SPG_Dict_Markdown_Ascii()                                                                ;Dict fuer RG formatiert im Markdown Ascii-Format
Declare.s Fill_Greek_Dict_Latex()                                                                       ;Dict fuer gr. Buchstaben im Latex-Format
Declare Create_Symcode_to_SymSymbol_and_List_of_Symops(List Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),List Selected_Angles_from_CIF.AngCIFStructure()) ;Liste von Symmetrieoperationen in Bindungen und Winkeln: 1_555, 2_567 etc.  und Map von Symmetriesymbolen: ','',''' etc. wird erstellt
Declare.s Create_SymSatz_LaTeX(List Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),List Selected_Angles_from_CIF.AngCIFStructure())                         ;Satz: Symmetry Transformations used.... LaTeX-Format
Declare.s Create_SymSatz_RTF(List Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),List Selected_Angles_from_CIF.AngCIFStructure())                           ;Satz: Symmetry Transformations used.... RTF-Format
Declare.s Create_SymSatz_Ascii(List Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),List Selected_Angles_from_CIF.AngCIFStructure())                         ;Satz: Symmetry Transformations used.... Ascii-Format
Declare.s Create_SymSatz_Markdown_Ascii(List Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),List Selected_Angles_from_CIF.AngCIFStructure())                ;Satz: Symmetry Transformations used.... Markdown Ascii-Format

Declare Save_RTF(Name_of_Structure.s)                   ;RTF speichern
Declare Save_LaTeX(Name_of_Structure.s)                 ;LaTeX speichern
Declare Save_Markdown(Name_of_Structure.s)              ;Markdown Ascii speichern
Declare Save_Ascii(Name_of_Structure.s)                 ;Ascii speichern
Declare Save_CIF(Name_of_Structure.s)                   ;CIF speichern
Declare Save_Profile(Name_of_Profile.s, Profile.s)      ;Profil erzeugen und speichern
Declare Save_Help(Name_of_Helpfile.s, Help.s)           ;Hilfe erzeugen und speichern
Declare Save_License(Name_of_Licensefile.s, License.s)  ;Lizenz erzeugen und speichern

;=============================Includes====================================

XIncludeFile "mathe.pb" ; Value-Interface
                        ; (c) Nicolas Goeddel
                        ; http://www.forums.purebasic.com/german/viewtopic.php?f=8&t=15675
                        ; With kind permission of the author. 

;=============================Program starts here=========================

;Open_and_Read_Profile()
Fill_SPG_Dict_RTF()
Fill_SPG_Dict_Latex()
Fill_SPG_Dict_Markdown_Ascii()
Fill_Greek_Dict_Latex()

;=============================main========================================

Define i.i
Define Filename.s
Define Profile_Name.s
Define Create_RTF.b=#False
Define Create_LaTeX.b=#False
Define Create_Plain_Text.b=#False
Define Create_Markdown.b=#False
Define Create_CIF.b=#True
Define Profile_to_Save.s

OpenConsole()

PrintN(" ")
PrintN("################################################################")
PrintN("#                                                              #")
PrintN("#                ciflord2 by Sebastian Dechert                 #")
PrintN("#                      Version: 1.0 (beta)                     #")
PrintN("#                                                              #")
PrintN("# usage: ciflord2 file [-p=PROFILE_NAME] [-f=OUTPUT_FORMAT]    #")
PrintN("#                                                              #")
PrintN("# If no profile is specified 'default.clprofile' will be used. #")
PrintN("# If no output format is specified all outputs will be saved.  #")
PrintN("#                                                              #")
PrintN("# Profile must be in the program directory or environment      #")
PrintN("# variable CIFLORD2_PROFILES_DIR must be set.                  #")
PrintN("#                                                              #")
PrintN("# output format otions: rtf, latex, text, md (Markdown)        #")
PrintN("#                                                              #")
PrintN("# output: filename-final.cif & filename-report.rtf|tex|txt|md  #")
PrintN("#                                                              #")
PrintN("#          Check everything and (or) use ciftab!               #")
PrintN("#                                                              #")
PrintN("#  If you run the program for the first time do:               #")
PrintN("#                                                              #")
PrintN("#    ciflord2 -cp=default   (generate a default.clprofile)     #")
PrintN("#    ciflord2 -ch           (generate a help file (Markdown))  #")
PrintN("#                                                              #")
PrintN("#  Read 'help.txt' for further information.                    #")
PrintN("#                                                              #")
PrintN("################################################################")
PrintN(" ")

If CountProgramParameters() > 0
  For i=0 To CountProgramParameters()
    If FindString(ProgramParameter(i),".cif", #PB_String_NoCase)
      Filename.s=ProgramParameter(i)
    ElseIf FindString(ProgramParameter(i),"-p=", #PB_String_NoCase) 
      Profile_Name.s=RemoveString(ProgramParameter(i),"-p=") + ".clprofile"
    ElseIf FindString(ProgramParameter(i),"--profile=", #PB_String_NoCase) 
      Profile_Name.s=RemoveString(ProgramParameter(i),"--profile=") + ".clprofile"
    ElseIf FindString(ProgramParameter(i),"-nc", #PB_String_NoCase) Or FindString(ProgramParameter(i),"--no_cif")
      Create_CIF.b=#False
    ElseIf FindString(ProgramParameter(i),"-h", #PB_String_NoCase) Or FindString(ProgramParameter(i),"--help", #PB_String_NoCase) 
      PrintN("usage: ciflord2 myfile.cif [-p=PROFILE_NAME] [-f=OUTPUT_FORMAT]")
      PrintN(" ")
      PrintN("options:")
      PrintN(" ")
      PrintN("-f=rtf|tex|txt|md or --format=rtf|tex|txt|md :  rtf|latex|text|md (Markdown) output")
      PrintN("-p=profile_name   or --profile=profile_name  :  loads a specific profile")
      PrintN("-nc or --no_cif                              :  no new CIF will be generated")
      PrintN("-h  or --help                                :  shows this help")
      PrintN("-cp=default or --create_profile=default      :  generates a new 'default.clprofile'")
      PrintN("-cp=ltable  or --create_profile=ltable       :  generates a new 'ltable.clprofile'")
      PrintN("-ch or --create_help                         :  generates a new 'help.txt'")
      PrintN("-cl or --create_license                      :  generates a new 'license.txt'")
      CloseConsole()
      End
    ElseIf FindString(ProgramParameter(i),"-f=", #PB_String_NoCase) Or FindString(ProgramParameter(i),"--format=")
      If FindString(ProgramParameter(i),"rtf", #PB_String_NoCase) 
        Create_RTF.b=#True
      EndIf
      If FindString(ProgramParameter(i),"latex", #PB_String_NoCase)
        Create_LaTeX.b=#True
      EndIf
      If FindString(ProgramParameter(i),"text", #PB_String_NoCase)
        Create_Plain_Text.b=#True
      EndIf
      If FindString(ProgramParameter(i),"md", #PB_String_NoCase)
        Create_Markdown.b=#True
      EndIf 
      If FindString(ProgramParameter(i),"rtf", #PB_String_NoCase) 
        Create_RTF.b=#True
      EndIf
      If FindString(ProgramParameter(i),"latex", #PB_String_NoCase)
        Create_LaTeX.b=#True
      EndIf
      If FindString(ProgramParameter(i),"text", #PB_String_NoCase)
        Create_Plain_Text.b=#True
      EndIf
      If FindString(ProgramParameter(i),"md", #PB_String_NoCase)
        Create_Markdown.b=#True
      EndIf 
    ElseIf FindString(ProgramParameter(i),"-cp=", #PB_String_NoCase) Or FindString(ProgramParameter(i),"--create_profile=", #PB_String_NoCase);Profil erstellen oder ueberschreiben
      If FindString(ProgramParameter(i),"default")
        PrintN("Create 'default.clprofile'.")
        Profile_to_Save.s=(PeekS(?Default_Profile,-1, #PB_UTF8))
        Save_Profile("default.clprofile",Profile_to_Save.s)
      ElseIf FindString(ProgramParameter(i),"ltable")
        PrintN("Create 'ltable.clprofile'.")
        Profile_to_Save.s=(PeekS(?Ltable_Profile,-1, #PB_UTF8))
        Save_Profile("ltable.clprofile",Profile_to_Save.s)
      Else
        ConsoleColor(12,0)
        PrintN("Warning! No profile defined or unknown profile.")
        ConsoleColor(7,0)
      EndIf
      CloseConsole()
      End
    ElseIf FindString(ProgramParameter(i),"-ch", #PB_String_NoCase) Or FindString(ProgramParameter(i),"--create_help", #PB_String_NoCase) ;Hilfe erstellen oder ueberschreiben
      PrintN("Create 'help.txt'.")
      Help_File.s=(PeekS(?Help_Text,-1, #PB_UTF8))
      Save_Help("help.txt",Help_File.s)
      CloseConsole()
      End
    ElseIf FindString(ProgramParameter(i),"-cl", #PB_String_NoCase) Or FindString(ProgramParameter(i),"--create_license", #PB_String_NoCase) ;Lizenz erstellen oder ueberschreiben
      PrintN("Create 'license.txt'.")
      License_File.s=(PeekS(?License_Text,-1, #PB_UTF8))
      Save_License("license.txt",License_File.s)
      CloseConsole()
      End
    EndIf
  Next
Else
  PrintN("usage: ciflord2 myfile.cif [-p=PROFILE_NAME] [-f=OUTPUT_FORMAT]")
  PrintN(" ")
  PrintN("options:")
  PrintN(" ")
  PrintN("-f=rtf|tex|txt|md or --format=rtf|tex|txt|md :  rtf|latex|text|md (Markdown) output")
  PrintN("-p=profile_name   or --profile=profile_name  :  loads a specific profile")
  PrintN("-nc or --no_cif                              :  no new CIF will be generated")
  PrintN("-h  or --help                                :  shows this help")
  PrintN("-cp=default or --create_profile=default      :  generates a new 'default.clprofile'")
  PrintN("-cp=ltable  or --create_profile=ltable       :  generates a new 'ltable.clprofile'")
  PrintN("-ch or --create_help                         :  generates a new 'help.txt'")
  PrintN("-cl or --create_license                      :  generates a new 'license.txt'")
  CloseConsole()
  End
EndIf
  
  If Profile_Name.s=""
    Profile_Name.s="default.clprofile"
  EndIf
  
  If Create_RTF.b=#False And Create_LaTeX.b=#False And Create_Plain_Text.b=#False And Create_Markdown.b=#False ; wenn keine Ausgabe spezifiziert, dann alle nehmen
    Define Create_RTF.b=#True
    Define Create_LaTeX.b=#True
    Define Create_Plain_Text.b=#True
    Define Create_Markdown.b=#True
  EndIf
      
;   PrintN("Create_RTF.b " +  Create_RTF.b)
;   PrintN("Create_LaTeX.b " +  Create_LaTeX.b)
;   PrintN("Create_Plain_Text.b " +  Create_Plain_Text.b)
;   PrintN("Create_Markdown.b " +  Create_Markdown.b)


If FileSize(Filename.s)=-1  
  ConsoleColor(12,0)
  PrintN("Warning! Could not open the CIF or unkown instruction.") 
  ConsoleColor(7,0)
  CloseConsole()  
  End
Else 
  Open_and_Read_CIF(Filename.s)
  If Open_and_Read_Profile(Profile_Name.s)=#False
    ConsoleColor(12,0)
    PrintN("Warning! Could not open the profile.") 
    ConsoleColor(7,0)
    CloseConsole()
    End
  Else
    Get_Name_of_Structure(CifFile())
    Get_Elements(CifFile())
    Get_SymOps_from_CIF(CifFile())
    Get_Bond_Lengths_from_CIF(CifFile())
    Get_Angles_from_CIF(CifFile())
    Process_Profile_CIF(ProfileFile.s())
    Create_New_CIF(CifFile())
    Get_Sum_Formula(CifFile())
    Get_Moiety_Formula(CifFile())
    Get_HKL_Range(CifFile())
    Get_Space_Group(CifFile())
    Process_Profile_Table(ProfileFile.s(),CifFile.s())
    If Create_RTF.b=#True
      Create_RTF(RawTable.RawTableStructure())
      Save_RTF(Name_of_Structure.s)
    EndIf
    If Create_LaTeX.b=#True
      Create_LaTeX(RawTable.RawTableStructure())
      Save_LaTeX(Name_of_Structure.s)
    EndIf
    If Create_Plain_Text.b=#True
      Create_Ascii(RawTable.RawTableStructure())
      Save_Ascii(Name_of_Structure.s) 
    EndIf
    If Create_Markdown.b=#True
      Create_Markdown_Ascii(RawTable.RawTableStructure())
      Save_Markdown(Name_of_Structure.s)
    EndIf
    If Create_CIF.b=#True
      Save_CIF(Name_of_Structure.s) 
    EndIf
  EndIf
EndIf

CloseConsole()
End

;=============================end main====================================

Procedure Open_and_Read_CIF(Filename.s)
  CIF_Filename.s=Filename.s
  If CIF_Filename.s
    If ReadFile(0, CIF_Filename.s)  
      ClearList(CifFile())
      While Eof(0) = 0         ;CIF wirs zeilwenweise in Liste eingelesen  
        AddElement(CifFile())
        CifFile()=ReadString(0)      
      Wend
      CloseFile(0) 
    Else
      PrintN("Warning! Could not open the CIF.")
      ProcedureReturn #False
    EndIf
    ProcedureReturn #True
  EndIf
EndProcedure

Procedure Save_RTF(Name_of_Structure.s)
  If ListSize(RtfFile())
    Filename.s = Name_of_Structure.s + "-report.rtf"
    If Filename.s
      If CreateFile(0, Filename.s) 
        ForEach Rtffile.s()
          WriteStringN(0,Rtffile.s(),#PB_Ascii)
        Next
        CloseFile(0)
        PrintN(Filename.s + " saved.")
      Else
        PrintN("Warning! File not found.")
      EndIf 
    EndIf
  Else
    PrintN("Warning! Nothing to save.")
  EndIf
EndProcedure

Procedure Save_LaTeX(Name_of_Structure.s)
  If ListSize(LaTeXFile.s())
    Filename.s = Name_of_Structure.s + "-report.tex"
    If Filename.s
      If CreateFile(0, Filename.s) 
        ForEach LaTeXFile.s()
          WriteString(0,LaTeXFile.s(),#PB_Ascii)
        Next
        CloseFile(0)
        PrintN(Filename.s + " saved.")
      Else
        PrintN("Warning! File not found.")
      EndIf 
    EndIf
  Else
    PrintN("Warning! Nothing to save.")
  EndIf
EndProcedure

Procedure Save_Markdown(Name_of_Structure.s)
  If ListSize(Markdown_AsciiFile.s())
    Filename.s = Name_of_Structure.s + "-report.md"
    If Filename.s
      If CreateFile(0, Filename.s) 
        ForEach Markdown_AsciiFile.s()
          WriteString(0,Markdown_AsciiFile.s())
        Next
        CloseFile(0)
        PrintN(Filename.s + " saved.")
      Else
        PrintN("Warning! File not found.")
      EndIf 
    EndIf
  Else
    PrintN("Warning! Nothing to save.")
  EndIf
EndProcedure

Procedure Save_Ascii(Name_of_Structure.s)
  If ListSize(AsciiFile.s())
    Filename.s = Name_of_Structure.s + "-report.txt"
    If Filename.s
      If CreateFile(0, Filename.s) 
        ForEach AsciiFile.s()
          WriteString(0,AsciiFile.s())
        Next
        CloseFile(0)
        PrintN(Filename.s + " saved.")
      Else
        PrintN("Warning! File not found.")
      EndIf 
    EndIf
  Else
    PrintN("Warning! Nothing to save.")
  EndIf
EndProcedure

Procedure Save_CIF(Name_of_Structure.s)
  If ListSize(CifFile.s())
    Filename.s=Name_of_Structure.s + "-final.cif"
    If Filename.s
      If CreateFile(0, Filename.s) 
        ForEach CifFile.s()
          WriteStringN(0,CifFile.s(),#PB_Ascii)
        Next
        CloseFile(0)
        PrintN(Filename.s + " saved.")
      Else
        PrintN("Warning! File Not found.")
      EndIf 
    EndIf
  Else
    PrintN("Warning! Nothing to save.")
  EndIf
EndProcedure

Procedure Save_Profile(Name_of_Profile.s,Profile.s)
  
  Protected Is_Profile.b=#False
  Protected YesNo.s
  
  If ReadFile(0, Name_of_Profile.s)   
    ConsoleColor(12,0)
    Print("Warning! " + Name_of_Profile.s + " found. Overwrite file? Y / N [N]: ")
    ConsoleColor(7,0)
    YesNo.s=Input()
  Else
    
    If Name_of_Profile.s 
      Filename.s=Name_of_Profile.s
      If Filename.s
        If CreateFile(0, Filename.s) 
          WriteString(0,Profile.s)
          CloseFile(0)
          PrintN(Filename.s + " saved.")
        Else
          PrintN("Warning! File not found.")
        EndIf 
      EndIf
    Else
      PrintN("Warning! Nothing to save.")
    EndIf
    
  EndIf
  
  If YesNo.s="Y" Or YesNo.s="YES" Or YesNo.s="y"  Or YesNo.s="yes" Or  YesNo.s="Yes"
    
    If Name_of_Profile.s 
      Filename.s=Name_of_Profile.s
      If Filename.s
        If CreateFile(0, Filename.s) 
          WriteString(0,Profile.s)
          CloseFile(0)
          PrintN(Filename.s + " saved.")
        Else
          PrintN("Warning! File not found.")
        EndIf 
      EndIf
    Else
      PrintN("Warning! Nothing to save.")
    EndIf
    
  EndIf
  
EndProcedure

Procedure Save_Help(Name_of_Helpfile.s, Help.s)
  
  If Name_of_Helpfile.s 
    Filename.s=Name_of_Helpfile.s
    If Filename.s
      If CreateFile(0, Filename.s) 
        WriteString(0, Help.s)
        CloseFile(0)
        PrintN(Filename.s + " saved.")
      Else
        PrintN("Warning! File not found.")
      EndIf 
    EndIf
  Else
    PrintN("Warning! Nothing to save.")
  EndIf
  
EndProcedure

Procedure Save_License(Name_of_Licensefile.s, License.s)
  
  If Name_of_Licensefile.s 
    Filename.s=Name_of_Licensefile.s
    If Filename.s
      If CreateFile(0, Filename.s) 
        WriteString(0, License.s)
        CloseFile(0)
        PrintN(Filename.s + " saved.")
      Else
        PrintN("Warning! File not found.")
      EndIf 
    EndIf
  Else
    PrintN("Warning! Nothing to save.")
  EndIf
  
EndProcedure

Procedure Open_and_Read_Profile(Profile_Name.s)
  
  Protected Profile_Name_from_ENV.s
  
  If ExamineEnvironmentVariables()
    While NextEnvironmentVariable()
      If EnvironmentVariableName()="CIFLORD2_PROFILES_DIR"
        Profile_Name_from_ENV.s=EnvironmentVariableValue()+Profile_Name.s ;Profil Verzeichnis durch Environment Variable
      EndIf
    Wend
  EndIf

  If ReadFile(0,Profile_Name.s)  ;Profil im CIF Verzeichnis
    ClearList(ProfileFile())
    While Eof(0) = 0         ;Profile wirs zeilwenweise in Liste eingelesen  
      AddElement(ProfileFile())
      ProfileFile()=ReadString(0)      
    Wend
    ProcedureReturn #True
    CloseFile(0) 
  ElseIf ReadFile(0,GetPathPart(ProgramFilename())+Profile_Name.s)  ;Profil im ciflord2 Verzeichnis
    ClearList(ProfileFile())
    While Eof(0) = 0         ;Profile wirs zeilwenweise in Liste eingelesen  
      AddElement(ProfileFile())
      ProfileFile()=ReadString(0)      
    Wend
    CloseFile(0) 
    ProcedureReturn #True
  ElseIf ReadFile(0,Profile_Name_from_ENV.s)  ;Profil im Profil-Verzeichnis durch Environment Variable bestimmt
    ClearList(ProfileFile())
    While Eof(0) = 0         ;Profile wirs zeilwenweise in Liste eingelesen  
      AddElement(ProfileFile())
      ProfileFile()=ReadString(0)      
    Wend
    CloseFile(0) 
    ProcedureReturn #True
  Else
    ProcedureReturn #False
  EndIf
  ;   ForEach ProfileFile()
  ;     Debug ProfileFile()
  ;   Next
EndProcedure

Procedure Get_Name_of_Structure(List Name_of_CifFile.s())
  ForEach Name_of_CifFile.s()
    If FindString(Name_of_CifFile.s(),"loop_") ; Items nur bis hierher einlesen
      Break
    ElseIf FindString(Name_of_CifFile.s(),"data_")
      Name_of_Structure.s=RemoveString(Name_of_CifFile.s(),"data_")
    EndIf
  Next
  If Name_of_Structure.s = "" 
    PrintN("Information! Could not find 'data_' item! File can not be processed!")
  EndIf
EndProcedure

Procedure Get_Elements(List Name_of_CifFile.s())
  
  ClearList(Elements.s())
  Protected Element.s
  
  ForEach Name_of_CifFile.s()
    Restore AllElements
    Repeat 
      Read.s Element.s
      If FindString(Name_of_CifFile.s(),"'"+Element.s+"'",#PB_String_CaseSensitive)
        AddElement(Elements.s())
        Elements.s()=Element.s
      EndIf
    Until Element.s="END"
    If FindString(Name_of_CifFile.s(),"_cell_length_a") ; Items nur bis hierher einlesen
      Break
    EndIf
  Next
  
;   ForEach Elements.s()
;     Debug Elements.s()
;   Next

EndProcedure

Procedure Get_Sum_Formula(List Name_of_CifFile.s())
  
  Protected Summenformel_Zeile.s
  Protected Index_Start.i
  Protected Index_End.i
  Protected i.i
  
  ForEach Name_of_CifFile.s()                                   ;Begrenzung 
    If FindString(Name_of_CifFile.s(),"_chemical_formula_sum") 
      Index_Start = ListIndex(Name_of_CifFile.s())
    EndIf
    If FindString(Name_of_CifFile.s(),"chemical_formula_weight") 
      Index_End = ListIndex(Name_of_CifFile.s())
      Break
    EndIf
  Next
  
  For i = Index_Start To Index_End-1
    
    SelectElement(Name_of_CifFile.s(),i)
    Summenformel_Zeile.s=Name_of_CifFile.s()
    Summenformel_Zeile.s=RemoveString(Name_of_CifFile.s(),"_chemical_formula_sum")
    
    If CreateRegularExpression(0,"[A-Z][a-z]?[0-9.]{0,}")
      If ExamineRegularExpression(0,Summenformel_Zeile.s)
        While NextRegularExpressionMatch(0)
          AddElement(Sum_Formula())
          Sum_Formula()\Alles=RegularExpressionMatchString(0)
        Wend
      EndIf
    Else
      PrintN("Error! " + RegularExpressionError())
    EndIf
    FreeRegularExpression(0)
    
    ForEach Sum_Formula()
      If CreateRegularExpression(0,"[A-Z][a-z]?")
        If ExamineRegularExpression(0,Sum_Formula()\Alles)
          While NextRegularExpressionMatch(0)
            Sum_Formula()\Elemente=RegularExpressionMatchString(0)
          Wend
        EndIf
      Else
        PrintN("Error! " + RegularExpressionError())
      EndIf
      FreeRegularExpression(0)
    Next
    
    ForEach Sum_Formula()
      If CreateRegularExpression(0,"[0-9.]{0,}")
        If ExamineRegularExpression(0,Sum_Formula()\Alles)
          While NextRegularExpressionMatch(0)
            Sum_Formula()\Anzahl=RegularExpressionMatchString(0)
          Wend
        EndIf
      Else
        PrintN("Error! " + RegularExpressionError())
      EndIf
      FreeRegularExpression(0)
    Next
    
  Next
  
  ;    ForEach Sum_Formula()
  ;      Debug  Sum_Formula()\Alles
  ;      Debug  Sum_Formula()\Elemente
  ;      Debug  Sum_Formula()\Anzahl
  ;    Next
  
EndProcedure

Procedure Get_Moiety_Formula(List Name_of_CifFile.s())
  
  Protected Moietyformel_Zeile.s
  Protected Index_Start.i
  Protected Index_End.i
  Protected i.i
  
  ForEach Name_of_CifFile.s()                                   ;Begrenzung 
    If FindString(Name_of_CifFile.s(),"chemical_formula_moiety") 
      Index_Start = ListIndex(Name_of_CifFile.s())
    EndIf
    If FindString(Name_of_CifFile.s(),"chemical_formula_sum") 
      Index_End = ListIndex(Name_of_CifFile.s())
      Break
    EndIf
  Next
  
  For i = Index_Start To Index_End-1
    
    SelectElement(Name_of_CifFile.s(),i)
    Moietyformel_Zeile.s=Name_of_CifFile.s()
    Moietyformel_Zeile.s=RemoveString(Name_of_CifFile.s(),"_chemical_formula_moiety")
    
    ;If CreateRegularExpression(0,"[A-Z][a-z]?[0-9.]{0,}[\s]{0,}[-+]?[,]?[0-9]{0,}[-+]?[,]?")
    If CreateRegularExpression(0,"[0-9.]{0,}\s*\(?[A-Z][a-z]?[0-9.]{0,}[\s]{0,}[-+]?[,]?[0-9]{0,}[-+]?[,]?[\)]?[,]?")
      If ExamineRegularExpression(0,Moietyformel_Zeile.s)
        While NextRegularExpressionMatch(0)
          AddElement(Moiety_Formula())
          Moiety_Formula()\Alles=RegularExpressionMatchString(0)
        Wend
      EndIf
    Else
      PrintN("Error! " + RegularExpressionError())
    EndIf
    FreeRegularExpression(0)
    
    ForEach Moiety_Formula()
      If CreateRegularExpression(0,"[A-Z][a-z]?")
        If ExamineRegularExpression(0,Moiety_Formula()\Alles)
          While NextRegularExpressionMatch(0)
            Moiety_Formula()\Elemente=RegularExpressionMatchString(0)
          Wend
        EndIf
      Else
        PrintN("Error! " + RegularExpressionError())
      EndIf
      FreeRegularExpression(0)
    Next
    
    ForEach Moiety_Formula()
      If CreateRegularExpression(0,"[A-Z][a-z]?[0-9]{0,}[.]?[0-9]{1,}")
        If ExamineRegularExpression(0,Moiety_Formula()\Alles)
          While NextRegularExpressionMatch(0)
            Moiety_Formula()\Element_u_Anzahl=RegularExpressionMatchString(0)
          Wend
        EndIf
      Else
        PrintN("Error! " + RegularExpressionError())
      EndIf
      FreeRegularExpression(0)
    Next
    
    ForEach Moiety_Formula()
      If CreateRegularExpression(0,"[0-9.]{0,}")
        If ExamineRegularExpression(0,Moiety_Formula()\Element_u_Anzahl)
          While NextRegularExpressionMatch(0)
            Moiety_Formula()\Anzahl=RegularExpressionMatchString(0)
          Wend
        EndIf
      Else
        PrintN("Error! " + RegularExpressionError())
      EndIf
      FreeRegularExpression(0)
    Next
    
    ForEach Moiety_Formula()
      If CreateRegularExpression(0,"[,]")
        If ExamineRegularExpression(0,Moiety_Formula()\Alles)
          While NextRegularExpressionMatch(0)
            Moiety_Formula()\Trennung=RegularExpressionMatchString(0) + Space(1)
          Wend
        EndIf
      Else
        PrintN("Error! " + RegularExpressionError())
      EndIf
      FreeRegularExpression(0)
    Next
    
    ForEach Moiety_Formula()
      If CreateRegularExpression(0,"[0-9]*[+-]")
        If ExamineRegularExpression(0,Moiety_Formula()\Alles)
          While NextRegularExpressionMatch(0)
            Moiety_Formula()\Ladung=RegularExpressionMatchString(0)
          Wend
        EndIf
      Else
        PrintN("Error! " + RegularExpressionError())
      EndIf
      FreeRegularExpression(0)
    Next 
    
    ForEach Moiety_Formula()
      If CreateRegularExpression(0,"[0-9.]{0,}?\s*\(")
        If ExamineRegularExpression(0,Moiety_Formula()\Alles)
          While NextRegularExpressionMatch(0)
            Moiety_Formula()\Aufklammer=LTrim(RegularExpressionMatchString(0))
          Wend
        EndIf
      Else
        MessageRequester("Error",RegularExpressionError())
      EndIf
      FreeRegularExpression(0)
    Next 
    
    ForEach Moiety_Formula()
      If CreateRegularExpression(0,"\)")
        If ExamineRegularExpression(0,Moiety_Formula()\Alles)
          While NextRegularExpressionMatch(0)
            Moiety_Formula()\Zuklammer=RegularExpressionMatchString(0)
          Wend
        EndIf
      Else
        MessageRequester("Error",RegularExpressionError())
      EndIf
      FreeRegularExpression(0)
    Next 
    
  Next
  
;   ForEach Moiety_Formula()
;     Debug  Moiety_Formula()\Elemente
;     Debug  Moiety_Formula()\Anzahl
;     Debug  Moiety_Formula()\Ladung
;     Debug  Moiety_Formula()\Trennung 
;   Next
  
EndProcedure

Procedure Get_HKL_Range(List Name_of_CifFile.s())
  
  Protected Number_of_Spaces.i
  
  ForEach Name_of_CifFile.s()
    Select Trim(StringField(Name_of_CifFile.s(),1," "))
      Case "_diffrn_reflns_limit_h_min"
        Number_of_Spaces.i=CountString(Trim(Name_of_CifFile.s())," ")
        CifItem("_diffrn_reflns_limit_h_min")=Trim(StringField(Name_of_CifFile.s(),2,Space(Number_of_Spaces)))
      Case "_diffrn_reflns_limit_h_max"
        Number_of_Spaces.i=CountString(Trim(Name_of_CifFile.s())," ")
        CifItem("_diffrn_reflns_limit_h_max")=Trim(StringField(Name_of_CifFile.s(),2,Space(Number_of_Spaces)))
      Case "_diffrn_reflns_limit_k_min"
        Number_of_Spaces.i=CountString(Trim(Name_of_CifFile.s())," ")
        CifItem("_diffrn_reflns_limit_k_min")=Trim(StringField(Name_of_CifFile.s(),2,Space(Number_of_Spaces)))
      Case "_diffrn_reflns_limit_k_max"
        Number_of_Spaces.i=CountString(Trim(Name_of_CifFile.s())," ")
        CifItem("_diffrn_reflns_limit_k_max")=Trim(StringField(Name_of_CifFile.s(),2,Space(Number_of_Spaces)))
      Case "_diffrn_reflns_limit_l_min"
        Number_of_Spaces.i=CountString(Trim(Name_of_CifFile.s())," ")
        CifItem("_diffrn_reflns_limit_l_min")=Trim(StringField(Name_of_CifFile.s(),2,Space(Number_of_Spaces)))
      Case "_diffrn_reflns_limit_l_max"
        Number_of_Spaces.i=CountString(Trim(Name_of_CifFile.s())," ")
        CifItem("_diffrn_reflns_limit_l_max")=Trim(StringField(Name_of_CifFile.s(),2,Space(Number_of_Spaces)))
    EndSelect
    If FindString(Name_of_CifFile.s(),"_refine_diff_density_rms")
      Break
    EndIf
  Next
  
EndProcedure

Procedure Get_Space_Group(List Name_of_CifFile.s())
  
  ForEach Name_of_CifFile.s()
    Select Trim(StringField(Name_of_CifFile.s(),1," "))
      Case "_space_group_name_H-M_alt"
        CifItem("_space_group_name_H-M_alt")=RemoveString(Name_of_CifFile.s(),"_space_group_name_H-M_alt")
      Case "_symmetry_space_group_name_H-M"
        CifItem("_space_group_name_H-M_alt")=RemoveString(Name_of_CifFile.s(),"_symmetry_space_group_name_H-M")
    EndSelect
    If FindString(Name_of_CifFile.s(),"_refine_diff_density_rms")
      Break
    EndIf
  Next
  
  CifItem("_space_group_name_H-M_alt")=RemoveString(CifItem("_space_group_name_H-M_alt")," ")
  CifItem("_space_group_name_H-M_alt")=RemoveString(CifItem("_space_group_name_H-M_alt"),"'")
  
EndProcedure

Procedure Get_SymOps_from_CIF(List Name_of_CifFile.s())
  
  ;Protected Alles_Ohne_Leerzeichen_und_Extra.s
  
  ForEach Name_of_CifFile.s()                                   
    If FindString(Name_of_CifFile.s(),"_space_group_symop_operation_xyz") Or FindString(Name_of_CifFile.s(),"_symmetry_equiv_pos_as_xyz")
      Break
    EndIf
  Next
  
  Repeat 
    
    If FindString(Name_of_CifFile.s(),"_space_group_symop_operation_xyz") = 0 And FindString(Name_of_CifFile.s(),"_symmetry_equiv_pos_as_xyz") = 0 
      AddElement(Sym_Ops_from_CIF.s())  
      Sym_Ops_from_CIF.s()=Trim(Name_of_CifFile.s())
      If Sym_Ops_from_CIF.s()="" ; leere Zeile loeschen
        DeleteElement(Sym_Ops_from_CIF.s())
      EndIf
    EndIf
    NextElement(Name_of_CifFile.s())
  Until FindString(Name_of_CifFile.s(),"_cell_length_a")
  
;   ForEach Sym_Ops_from_CIF.s()
;     Debug "Alles " + Sym_Ops_from_CIF.s()
;   Next
  
EndProcedure

Procedure Get_Bond_Lengths_from_CIF(List Name_of_CifFile.s())
  
  ForEach Name_of_CifFile.s()                                   
    If FindString(Name_of_CifFile.s(),"_geom_bond_publ_flag") 
      Break
    EndIf
  Next
  
  Repeat 
    
    If FindString(Name_of_CifFile.s(),"_geom_bond_publ_flag") = 0
      AddElement(Bond_Lenghts_from_CIF.DistCIFStructure())
      Bond_Lenghts_from_CIF.DistCIFStructure()\Alles=Trim(Name_of_CifFile.s())
      Bond_Lenghts_from_CIF.DistCIFStructure()\Atom1=StringField(Bond_Lenghts_from_CIF.DistCIFStructure()\Alles,1," ")
      Bond_Lenghts_from_CIF.DistCIFStructure()\Atom2=StringField(Bond_Lenghts_from_CIF.DistCIFStructure()\Alles,2," ")
      Bond_Lenghts_from_CIF.DistCIFStructure()\Abstand=StringField(Bond_Lenghts_from_CIF.DistCIFStructure()\Alles,3," ")
      Bond_Lenghts_from_CIF.DistCIFStructure()\Symmetrie1=StringField(Bond_Lenghts_from_CIF.DistCIFStructure()\Alles,4," ")
      Bond_Lenghts_from_CIF.DistCIFStructure()\Symmetrie2=StringField(Bond_Lenghts_from_CIF.DistCIFStructure()\Alles,5," ")
      Bond_Lenghts_from_CIF.DistCIFStructure()\AbstandNum=ValD(StringField(Bond_Lenghts_from_CIF.DistCIFStructure()\Abstand,1,"("))
      Bond_Lenghts_from_CIF.DistCIFStructure()\EsdNum=Val(StringField(Bond_Lenghts_from_CIF.DistCIFStructure()\Abstand,2,"("))
      
      If CreateRegularExpression(0,"[^0-9_.]") ;Falls kein Symmetrie1 vorhanden (ist Normalfall) ist Symmetrie1 = . und Symmetrie2 = Symmetrie1
        If MatchRegularExpression(0,Bond_Lenghts_from_CIF.DistCIFStructure()\Symmetrie2)
          Bond_Lenghts_from_CIF.DistCIFStructure()\Symmetrie2=Bond_Lenghts_from_CIF.DistCIFStructure()\Symmetrie1
          Bond_Lenghts_from_CIF.DistCIFStructure()\Symmetrie1="."
        EndIf
      Else
        PrintN("Error! " + RegularExpressionError())
      EndIf
      FreeRegularExpression(0)
      
      If Bond_Lenghts_from_CIF.DistCIFStructure()\Alles="" ; leere Zeile loeschen
        DeleteElement(Bond_Lenghts_from_CIF.DistCIFStructure())
      EndIf
      
      ForEach Elements.s()
        If FindString( Bond_Lenghts_from_CIF.DistCIFStructure()\Atom1,Elements.s(),#PB_String_NoCase)
          Bond_Lenghts_from_CIF.DistCIFStructure()\Element1=Elements.s()
        EndIf
        If FindString( Bond_Lenghts_from_CIF.DistCIFStructure()\Atom2,Elements.s(),#PB_String_NoCase)
          Bond_Lenghts_from_CIF.DistCIFStructure()\Element2=Elements.s()
        EndIf
      Next
    EndIf
    NextElement(Name_of_CifFile.s())
    
  Until FindString(Name_of_CifFile.s(),"loop_")
  
  
;   ForEach Bond_Lenghts_from_CIF.DistCIFStructure()
;     Debug "Alles " + Bond_Lenghts_from_CIF.DistCIFStructure()\Alles
;     Debug "Atom1 " + Bond_Lenghts_from_CIF.DistCIFStructure()\Atom1
;     Debug "Atom2 " + Bond_Lenghts_from_CIF.DistCIFStructure()\Atom2
;     Debug "Element1 " + Bond_Lenghts_from_CIF.DistCIFStructure()\Element1
;     Debug "Element2 " + Bond_Lenghts_from_CIF.DistCIFStructure()\Element2
;     Debug "Abstand " + Bond_Lenghts_from_CIF.DistCIFStructure()\Abstand
;     Debug "AbstandNum " + Bond_Lenghts_from_CIF.DistCIFStructure()\AbstandNum
;     Debug "EsdNum " + Bond_Lenghts_from_CIF.DistCIFStructure()\EsdNum
;     Debug "Sym1 " + Bond_Lenghts_from_CIF.DistCIFStructure()\Symmetrie1
;     Debug "Sym2 " + Bond_Lenghts_from_CIF.DistCIFStructure()\Symmetrie2
;   Next
  
EndProcedure

Procedure Get_Angles_from_CIF(List Name_of_CifFile.s())
  
  ForEach Name_of_CifFile.s()                                   
    If FindString(Name_of_CifFile.s(),"_geom_angle_publ_flag") 
      Break
    EndIf
  Next
  
  Repeat 
    
    If FindString(Name_of_CifFile.s(),"_geom_angle_publ_flag") = 0
      AddElement(Angles_from_CIF.AngCIFStructure())
      Angles_from_CIF.AngCIFStructure()\Alles=Trim(Name_of_CifFile.s())
      Angles_from_CIF.AngCIFStructure()\Atom1=StringField(Angles_from_CIF.AngCIFStructure()\Alles,1," ")
      Angles_from_CIF.AngCIFStructure()\Atom2=StringField(Angles_from_CIF.AngCIFStructure()\Alles,2," ")
      Angles_from_CIF.AngCIFStructure()\Atom3=StringField(Angles_from_CIF.AngCIFStructure()\Alles,3," ")
      Angles_from_CIF.AngCIFStructure()\Winkel=StringField(Angles_from_CIF.AngCIFStructure()\Alles,4," ")
      Angles_from_CIF.AngCIFStructure()\Symmetrie1=StringField(Angles_from_CIF.AngCIFStructure()\Alles,5," ")
      Angles_from_CIF.AngCIFStructure()\Symmetrie2=StringField(Angles_from_CIF.AngCIFStructure()\Alles,6," ")
      Angles_from_CIF.AngCIFStructure()\Symmetrie3=StringField(Angles_from_CIF.AngCIFStructure()\Alles,7," ")
      Angles_from_CIF.AngCIFStructure()\WinkelNum=ValD(StringField(Angles_from_CIF.AngCIFStructure()\Winkel,1,"("))
      Angles_from_CIF.AngCIFStructure()\EsdNum=Val(StringField(Angles_from_CIF.AngCIFStructure()\Winkel,2,"("))
      
      If CreateRegularExpression(0,"[^0-9_.]") ;Falls kein Symmetrie2 (_geom_angle_site_symmetry_2) vorhanden (ist Normalfall) ist Symmetrie2 = . und Symmetrie3 = Symmetrie2
        If MatchRegularExpression(0,Angles_from_CIF.AngCIFStructure()\Symmetrie3)
          Angles_from_CIF.AngCIFStructure()\Symmetrie3=Angles_from_CIF.AngCIFStructure()\Symmetrie2
          Angles_from_CIF.AngCIFStructure()\Symmetrie2="."
        EndIf
      Else
        PrintN("Error! " + RegularExpressionError())
      EndIf
      FreeRegularExpression(0)
      
      If Angles_from_CIF.AngCIFStructure()\Alles="" ; leere Zeile loeschen
        DeleteElement(Angles_from_CIF.AngCIFStructure())
      EndIf
      
      ForEach Elements.s()
        If FindString(Angles_from_CIF.AngCIFStructure()\Atom1,Elements.s(),#PB_String_NoCase)
          Angles_from_CIF.AngCIFStructure()\Element1=Elements.s()
        EndIf
        If FindString(Angles_from_CIF.AngCIFStructure()\Atom2,Elements.s(),#PB_String_NoCase)
          Angles_from_CIF.AngCIFStructure()\Element2=Elements.s()
        EndIf
        If FindString(Angles_from_CIF.AngCIFStructure()\Atom3,Elements.s(),#PB_String_NoCase)
          Angles_from_CIF.AngCIFStructure()\Element3=Elements.s()
        EndIf
      Next
    EndIf
    NextElement(Name_of_CifFile.s())
    
  Until FindString(Name_of_CifFile.s(),"_diffrn_measured_fraction_theta_max") Or FindString(Name_of_CifFile.s(),"_refine_diff_density_max") Or FindString(Name_of_CifFile.s(),"loop_")
  
  
;   ForEach Angles_from_CIF.AngCIFStructure()
;     Debug "Alles " + Angles_from_CIF.AngCIFStructure()\Alles
;     Debug "Atom1 " + Angles_from_CIF.AngCIFStructure()\Atom1
;     Debug "Atom2 " + Angles_from_CIF.AngCIFStructure()\Atom2
;     Debug "Atom3 " + Angles_from_CIF.AngCIFStructure()\Atom3
;     Debug "Element1 " + Angles_from_CIF.AngCIFStructure()\Element1
;     Debug "Element2 " + Angles_from_CIF.AngCIFStructure()\Element2
;     Debug "Element3 " + Angles_from_CIF.AngCIFStructure()\Element3
;     Debug "Abstand " + Angles_from_CIF.AngCIFStructure()\Winkel
;     Debug "AbstandNum " + Angles_from_CIF.AngCIFStructure()\WinkelNum
;     Debug "EsdNum " + Angles_from_CIF.AngCIFStructure()\EsdNum
;     Debug "Sym1 " + Angles_from_CIF.AngCIFStructure()\Symmetrie1
;     Debug "Sym2 " + Angles_from_CIF.AngCIFStructure()\Symmetrie2
;     Debug "Sym3 " + Angles_from_CIF.AngCIFStructure()\Symmetrie3
;   Next
  
EndProcedure

Procedure.s Symcode_to_String(SymOp.s,SymCode.s)

  Protected symop_xyz.xyz
  Protected symcode_xyz.opxyz
 
  symop.s=LCase(symop.s)
  
  If Len(symcode.s) < 2 
    symcode.s="555"
  EndIf
  
  symop_xyz.xyz
  symop_xyz\x=Trim(StringField(ReplaceString(symop.s,"'",""),1,","))
  symop_xyz\y=Trim(StringField(ReplaceString(symop.s,"'",""),2,","))
  symop_xyz\z=Trim(StringField(ReplaceString(symop.s,"'",""),3,","))
;   Debug symop_xyz\x
;   Debug symop_xyz\y
;   Debug symop_xyz\z
  

  symcode_xyz\opx=Mid(symcode.s,1,1)
  symcode_xyz\opy=Mid(symcode.s,2,1)
  symcode_xyz\opz=Mid(symcode.s,3,1)
  
  If Len(symop_xyz\x) > 1 And Left(symop_xyz\x,1) = "-" 
    symop_xyz\sign_x=""
  Else
    symop_xyz\sign_x="+"
  EndIf
  
  If Len(symop_xyz\y) > 1 And Left(symop_xyz\y,1) = "-" 
    symop_xyz\sign_y=""
  Else
    symop_xyz\sign_y="+"
  EndIf
  
  If Len(symop_xyz\z) > 1 And Left(symop_xyz\z,1) = "-" 
    symop_xyz\sign_z=""
  Else
    symop_xyz\sign_z="+"
  EndIf
  
  symop_xyz\fac_x=ReplaceString(symop_xyz\x,"-x","")
  symop_xyz\fac_x=ReplaceString(symop_xyz\fac_x,"-y","")
  symop_xyz\fac_x=ReplaceString(symop_xyz\fac_x,"-z","")
  symop_xyz\fac_x=ReplaceString(symop_xyz\fac_x,"+x","")
  symop_xyz\fac_x=ReplaceString(symop_xyz\fac_x,"+y","")
  symop_xyz\fac_x=ReplaceString(symop_xyz\fac_x,"+z","")
  symop_xyz\fac_x=ReplaceString(symop_xyz\fac_x,"x","")
  symop_xyz\fac_x=ReplaceString(symop_xyz\fac_x,"y","")
  symop_xyz\fac_x=ReplaceString(symop_xyz\fac_x,"z","")
  
  symop_xyz\fac_y=ReplaceString(symop_xyz\y,"-x","")
  symop_xyz\fac_y=ReplaceString(symop_xyz\fac_y,"-y","")
  symop_xyz\fac_y=ReplaceString(symop_xyz\fac_y,"-z","")
  symop_xyz\fac_y=ReplaceString(symop_xyz\fac_y,"+x","")
  symop_xyz\fac_y=ReplaceString(symop_xyz\fac_y,"+y","")
  symop_xyz\fac_y=ReplaceString(symop_xyz\fac_y,"+z","")
  symop_xyz\fac_y=ReplaceString(symop_xyz\fac_y,"x","")
  symop_xyz\fac_y=ReplaceString(symop_xyz\fac_y,"y","")
  symop_xyz\fac_y=ReplaceString(symop_xyz\fac_y,"z","")
  
  symop_xyz\fac_z=ReplaceString(symop_xyz\z,"-x","")
  symop_xyz\fac_z=ReplaceString(symop_xyz\fac_z,"-y","")
  symop_xyz\fac_z=ReplaceString(symop_xyz\fac_z,"-z","")
  symop_xyz\fac_z=ReplaceString(symop_xyz\fac_z,"+x","")
  symop_xyz\fac_z=ReplaceString(symop_xyz\fac_z,"+y","")
  symop_xyz\fac_z=ReplaceString(symop_xyz\fac_z,"+z","")
  symop_xyz\fac_z=ReplaceString(symop_xyz\fac_z,"x","")
  symop_xyz\fac_z=ReplaceString(symop_xyz\fac_z,"y","")
  symop_xyz\fac_z=ReplaceString(symop_xyz\fac_z,"z","")
  
;   Debug symop_xyz\sign_x + ">" + symop_xyz\x + ">" + symop_xyz\fac_x
;   Debug symop_xyz\sign_y + ">" + symop_xyz\y + ">" + symop_xyz\fac_y
;   Debug symop_xyz\sign_z + ">" + symop_xyz\z + ">" + symop_xyz\fac_z
;   
;   symcode_xyz.opxyz
;   symcode_xyz\opx=Mid(symcode.s,1,1)
;   symcode_xyz\opy=Mid(symcode.s,2,1)
;   symcode_xyz\opz=Mid(symcode.s,3,1)
;   
;   Debug symcode_xyz\opx
  
  ;Define *v1.Value, *v2.Value, *v3.Value
  Protected *v1.Value, *v2.Value, *v3.Value
  
  *v1 = Value_New(#Value_Rational)
  *v1\Val(symop_xyz\fac_x)
  
  *v2 = Value_New(#Value_Rational)
  *v2\Val(symcode_xyz\opx)
  
  *v3 = Value_New(#Value_Rational)
  *v3\Val("-5")
  
  *v2\Add(*v3)
  *v1\Add(*v2)
  
  xfactor.s=*v1\Str()
  If xfactor.s = "0" : xfactor.s="" : EndIf
  
  symop_xyz\xnew=xfactor.s + symop_xyz\sign_x + ReplaceString(symop_xyz\x,symop_xyz\fac_x,"")
  
  *v1 = Value_New(#Value_Rational)
  *v1\Val(symop_xyz\fac_y)
  
  *v2 = Value_New(#Value_Rational)
  *v2\Val(symcode_xyz\opy)
  
  *v3 = Value_New(#Value_Rational)
  *v3\Val("-5")
  
  *v2\Add(*v3)
  *v1\Add(*v2)
  
  yfactor.s=*v1\Str()
  If yfactor.s = "0" : yfactor.s="" : EndIf
  
  symop_xyz\ynew=yfactor.s + symop_xyz\sign_y +  ReplaceString(symop_xyz\y,symop_xyz\fac_y,"")
  
  *v1 = Value_New(#Value_Rational)
  *v1\Val(symop_xyz\fac_z)
  
  *v2 = Value_New(#Value_Rational)
  *v2\Val(symcode_xyz\opz)
  
  *v3 = Value_New(#Value_Rational)
  *v3\Val("-5")
  
  *v2\Add(*v3)
  *v1\Add(*v2)
  
  zfactor.s=*v1\Str()
  If zfactor.s = "0" : zfactor.s="" : EndIf
  
  symop_xyz\znew=zfactor.s + symop_xyz\sign_z +  ReplaceString(symop_xyz\z,symop_xyz\fac_z,"")
  
  ProcedureReturn ReplaceString(LTrim(symop_xyz\xnew,"+") + ", " + LTrim(symop_xyz\ynew,"+") + ", " + LTrim(symop_xyz\znew,"+"), "++","+")
  
EndProcedure

Procedure Process_Profile_CIF(List ProfileFile.s())
  
  Protected ExternalFile_Filename.s
  Protected Input_Message.s
  Protected String_from_Input.s
  Protected Yes_I_found_item.b = #False
  Protected Yes_I_found_item_2.b = #False
  Protected Yes_I_found_it.b = #False
  Protected Yes_I_am_in_Item_list=#False
  Protected i.i
  Protected NewList ExternalFile.s()
  
  If ListSize(ProfileFile.s()) ; Leeres Profil?
    
    ForEach ProfileFile.s()
      If FindString(ProfileFile.s(),"**end section CIF") ;hier raus
        Break
      EndIf
      
      If Trim(Left(ProfileFile.s(),2))="//" ;Kommentare ignorieren
        ;Debug "Kommentar" + ProfileFile.s()
      ElseIf Trim(Left(ProfileFile.s(),2))="**" ; Section ignorieren
        ;Debug "Section" + ProfileFile.s() 
      Else
        Select Trim(StringField(ProfileFile.s(),2,"%"))
          Case "INSERT_FROM_CIF"
            ForEach CifFile.s()
              If FindString(CifFile.s(),Trim(StringField(ProfileFile.s(),3,"%")))
                CifItem(Trim(StringField(ProfileFile.s(),1," ")))=StringField(CifFile.s(),2,Trim(StringField(ProfileFile.s(),3,"%"))+Space(CountString(CifFile.s()," ")))
                Yes_I_found_item.b=#True
              EndIf 
              If FindString(CifFile.s(),"refine_diff_density_rms")
                If Yes_I_found_item.b=#False
                  PrintN("Information! Instruction INSERT_FROM_CIF: One or more item(s) not found in CIF! Check the profile.")
                EndIf
                Break
              EndIf
            Next
            
          Case "ASK"
            String_from_Input.s=""
            Input_Message.s=Trim(StringField(ProfileFile.s(),1," "))
            ;String_from_Input.s=InputRequester("Input", Input_Message.s, Trim(StringField(ProfileFile.s(),3,"%")))
            Print("Input " +  Input_Message.s + " [" + Trim(StringField(ProfileFile.s(),3,"%")) + "] : ")
            String_from_Input.s=Input()
            If String_from_Input.s=""
              String_from_Input.s=Trim(StringField(ProfileFile.s(),3,"%"))
            EndIf
            If FindString(String_from_Input.s," ") : String_from_Input.s="'"+String_from_Input.s+"'":EndIf
            If String_from_Input.s="" : String_from_Input.s="?" : EndIf
            CifItem(Trim(StringField(ProfileFile.s(),1," "))) = String_from_Input.s
          Case "CONST"
            CifItem(Trim(StringField(ProfileFile.s(),1," ")))=Trim(StringField(ProfileFile.s(),3,"%"))
          Case "READ" ; liest nur CIF item ein. Gut z.B. fuer %IF
              ForEach CifFile.s()
                If FindString(CifFile.s(),Trim(StringField(ProfileFile.s(),1," ")))
                  CifItem(Trim(StringField(ProfileFile.s(),1," ")))=Trim(StringField(CifFile.s(),CountString(CifFile.s()," ")+1," "))
                  Yes_I_found_item_2.b=#True
                EndIf 
                If FindString(CifFile.s(),"refine_diff_density_rms")
                  If Yes_I_found_item_2.b=#False
                    PrintN("Information! Instruction Read: One or more item(s) not found in CIF! Check the profile.")
                  EndIf
                  Break
                EndIf
              Next
              
          Case "INSERT_FROM_FILE"
            If Left(Trim(StringField(ProfileFile.s(),3,"%")),1)="."; File hat selben Namen wie CIF aber andere Dateiendung
              ;Debug GetExtensionPart(CIF_Filename.s)
              ExternalFile_Filename.s=ReplaceString(CIF_filename.s,"."+GetExtensionPart(CIF_Filename.s),Trim(StringField(ProfileFile.s(),3,"%")),#PB_String_CaseSensitive)
            Else
              ExternalFile_Filename.s=GetPathPart(CIF_Filename.s)+Trim(StringField(ProfileFile.s(),3,"%")) ; File hat anderen Namen
            EndIf
            ;Debug ExternalFile_Filename
            If ReadFile(0,(ExternalFile_Filename.s))  
              ClearList(ExternalFile.s())
              While Eof(0) = 0         ;File wird zeilwenweise in Liste eingelesen  
                AddElement(ExternalFile.s())
                ExternalFile.s()=ReadString(0)      
              Wend
              CloseFile(0) 
              If ListSize(ExternalFile.s()) >= Val(Trim(StringField(ProfileFile.s(),4,"%")))
                SelectElement(ExternalFile.s(),Val(Trim(StringField(ProfileFile.s(),4,"%"))))
                CifItem(Trim(StringField(ProfileFile.s(),1," ")))=Mid(ExternalFile.s(),Val(Trim(StringField(ProfileFile.s(),5,"%"))),Val(Trim(StringField(ProfileFile.s(),6,"%"))))
              Else
                PrintN("Information! Instruction INSERT_FROM_FILE: Parameter exceeds file size!")
              EndIf
            Else
              PrintN("Information! Instruction INSERT_FROM_FILE: Could not open " + ExternalFile_Filename.s + "!")
              String_from_Input.s=""
              Input_Message.s=Trim(StringField(ProfileFile.s(),1," "))
              ;String_from_Input.s=InputRequester("Input", Input_Message.s,"?")
              Print("Input " +  Input_Message.s + " [" + "?" + "] : ")
              String_from_Input.s=Input()
              If FindString(String_from_Input.s," ") : String_from_Input.s="'"+String_from_Input.s+"'":EndIf
              If String_from_Input.s="" : String_from_Input.s="?" : EndIf
              CifItem(Trim(StringField(ProfileFile.s(),1," "))) = String_from_Input.s
            EndIf
            
          Case "SEARCH_IN_FILE"
            If Left(Trim(StringField(ProfileFile.s(),3,"%")),1)="."; File hat selben Namen wie CIF aber andere Dateiendung
              ;Debug GetExtensionPart(CIF_Filename.s)
              ExternalFile_Filename.s=ReplaceString(CIF_filename.s,"."+GetExtensionPart(CIF_Filename.s),Trim(StringField(ProfileFile.s(),3,"%")),#PB_String_CaseSensitive)
            Else
              ExternalFile_Filename.s=GetPathPart(CIF_Filename.s)+Trim(StringField(ProfileFile.s(),3,"%")) ; File hat anderen Namen
            EndIf
            ;Debug ExternalFile_Filename
            If ReadFile(0,(ExternalFile_Filename.s))  
              ClearList(ExternalFile.s())
              While Eof(0) = 0         ;File wird zeilwenweise in Liste eingelesen  
                AddElement(ExternalFile.s())
                ExternalFile.s()=ReadString(0)      
              Wend
              CloseFile(0)  
              ForEach ExternalFile.s()
                If FindString(ExternalFile.s(),Trim(StringField(ProfileFile.s(),4,"%")))
                  Yes_I_found_it.b=#True
                  Break
                EndIf
              Next
              If Yes_I_found_it.b=#True
                If ListSize(ExternalFile.s()) >= Val(Trim(StringField(ProfileFile.s(),5,"%"))) + ListIndex(ExternalFile.s())
                  SelectElement(ExternalFile.s(),Val(Trim(StringField(ProfileFile.s(),5,"%")))+ListIndex(ExternalFile.s()))
                  CifItem(Trim(StringField(ProfileFile.s(),1," ")))=Mid(ExternalFile.s(),Val(Trim(StringField(ProfileFile.s(),6,"%"))),Val(Trim(StringField(ProfileFile.s(),7,"%"))))
                Else
                  PrintN("Information! Instruction SEARCH_IN_FILE: Parameter exceeds file size!")
                EndIf
              Else
                PrintN("Information! Instruction SEARCH_IN_FILE: Could not find '" + Trim(StringField(ProfileFile.s(),4,"%")) + "' in file!")
              EndIf
            Else
              PrintN("Information! Instruction SEARCH_IN_FILE: Could not open " + ExternalFile_Filename.s + "!")
              String_from_Input.s=""
              Input_Message.s=Trim(StringField(ProfileFile.s(),1," "))
              ;String_from_Input.s=InputRequester("Input", Input_Message.s,"?")
              Print("Input " +  Input_Message.s + " [" + "?" + "] : ")
              String_from_Input.s=Input()
              If FindString(String_from_Input.s," ") : String_from_Input.s="'"+String_from_Input.s+"'":EndIf
              If String_from_Input.s="" : String_from_Input.s="?" : EndIf
              CifItem(Trim(StringField(ProfileFile.s(),1," "))) = String_from_Input.s
            EndIf
            
          Case "IF"
            Yes_I_am_in_Item_list=#False
            ForEach CifItem()
              If MapKey(CifItem())=Trim(StringField(ProfileFile.s(),3,"%"))
                Yes_I_am_in_Item_list=#True
                If CifItem(Trim(StringField(ProfileFile.s(),3,"%")))="" Or CifItem(Trim(StringField(ProfileFile.s(),3,"%")))="?" 
                  CifItem(Trim(StringField(ProfileFile.s(),1," ")))=Trim(StringField(ProfileFile.s(),5,"%")) 
                  ;Debug Trim(StringField(ProfileFile.s(),5,"%"))
                  Break
                ElseIf CifItem(Trim(StringField(ProfileFile.s(),3,"%")))=Trim(StringField(ProfileFile.s(),4,"%"))
                  CifItem(Trim(StringField(ProfileFile.s(),1," ")))=Trim(StringField(ProfileFile.s(),5,"%")) 
                  Break
                Else
                  CifItem(Trim(StringField(ProfileFile.s(),1," ")))=Trim(StringField(ProfileFile.s(),6,"%")) 
                  Break
                EndIf
              EndIf
            Next
            If Yes_I_am_in_Item_list=#False
              PrintN("Information! Instruction If: Could not find CIF item '" + Trim(StringField(ProfileFile.s(),3,"%")) + "' in item Map!")
            EndIf
          Case "CASE"
            Yes_I_am_in_Item_list=#False
            ForEach CifItem()
              If MapKey(CifItem())=Trim(StringField(ProfileFile.s(),3,"%"))
                Yes_I_am_in_Item_list=#True
                If CifItem(Trim(StringField(ProfileFile.s(),3,"%")))=Trim(StringField(ProfileFile.s(),4,"%"))
                  CifItem(Trim(StringField(ProfileFile.s(),1," ")))=Trim(StringField(ProfileFile.s(),5,"%")) 
                  Break
                EndIf
              EndIf
            Next
            If Yes_I_am_in_Item_list=#False
              PrintN("Information! Instruction Case: Could not find CIF item '" + Trim(StringField(ProfileFile.s(),3,"%")) + "' in item Map!")
            EndIf
          Default
            PrintN("Information! Unknown instruction(s) in profile!" + Trim(StringField(ProfileFile.s(),2,"%"))) ; Profil hat unbekannte Anweisungen
        EndSelect
      EndIf
    Next
  Else
    PrintN("Information! Profile is empty!")
  EndIf
  
EndProcedure

Procedure Create_New_CIF(List Name_of_CifFile.s())
  
  Protected Number_of_Spaces.i
  
;   ForEach Name_of_CifFile.s()
;     If CifItem(Trim(StringField(Name_of_CifFile.s(),1," "))) <> ""
;       Number_of_Spaces.i=CountString(Trim(Name_of_CifFile.s())," ")
;       Name_of_CifFile.s()=StringField(Name_of_CifFile.s(),1," ")+Space(Number_of_Spaces)+CifItem(Trim(StringField(Name_of_CifFile.s(),1," ")))
;     ElseIf FindString(Name_of_CifFile.s(),"_refine_diff_density_rms")
;       DeleteMapElement(CifItem())
;       Break
;     Else
;       DeleteMapElement(CifItem())
;     EndIf   
;   Next
  
  ForEach Name_of_CifFile.s()
    If CifItem(Trim(StringField(Name_of_CifFile.s(),1," "))) <> ""
      If CreateRegularExpression(0, "[^\s]*([\s]*)[^\s]*")
        If ExamineRegularExpression(0,Trim(Name_of_CifFile.s()))
          ;While NextRegularExpressionMatch(0)
          ;Number_of_Spaces.i=Len(RegularExpressionGroup(0, 1))
            NextRegularExpressionMatch(0)
            Number_of_Spaces.i=Len(RegularExpressionGroup(0, 1))
          ;Wend
        EndIf
      Else
        PrintN("Error! " + RegularExpressionError())
      EndIf
      FreeRegularExpression(0)
      Name_of_CifFile.s()=StringField(Name_of_CifFile.s(),1," ")+Space(Number_of_Spaces)+CifItem(Trim(StringField(Name_of_CifFile.s(),1," ")))
    ElseIf FindString(Name_of_CifFile.s(),"_refine_diff_density_rms")
      DeleteMapElement(CifItem())
      Break
    Else
      DeleteMapElement(CifItem())
    EndIf   
  Next
      
        

;   ForEach Name_of_CifFile.s()
;     Debug Name_of_CifFile.s()
;     If FindString(Name_of_CifFile.s(),"_refine_diff_density_rms")
;       Break
;     EndIf
;   Next
  
EndProcedure

Procedure Process_Profile_Table(List ProfileFile.s(), List Name_of_CifFile.s())
  
  Protected Number_of_Delimiters.i
  Protected i.i
  Protected Elemente.s
  Protected DefaultElement.s
  Protected Selected_Element_for_Tables.s
  Protected Yes_Element_is_in_List.b=#False
  
  
  If ListSize(ProfileFile.s()) ; Leeres Profil?
    
    ForEach ProfileFile.s()
      If FindString(ProfileFile.s(),"**begin section TABLE") ;hier raus
        Break
      EndIf
    Next
    
    Repeat
      NextElement(ProfileFile.s())
      
      If Trim(Left(ProfileFile.s(),2))="//" ;Kommentare ignorieren
                                            ;Debug "Kommentar" + ProfileFile.s()
      ElseIf Trim(Left(ProfileFile.s(),2))="**" ; Section ignorieren
                                                ;Debug "Section" + ProfileFile.s() 
      Else
        Number_of_Delimiters.i=CountString(ProfileFile.s(),"%")
        AddElement(RawTable())
        RawTable.RawTableStructure()\Number_of_Tableitems=Number_of_Delimiters.i
        For i=1 To Number_of_Delimiters.i
          RawTable.RawTableStructure()\Tableitems[i]=Trim(StringField(ProfileFile.s(),i,"%"))
          If FindString(RawTable.RawTableStructure()\Tableitems[i],"_") And Not FindString(RawTable.RawTableStructure()\Tableitems[i],"_{"); fuege zu CifItem hinzu
            ForEach Name_of_CifFile.s()
              If Trim(StringField(Name_of_CifFile.s(),1," "))=RawTable.RawTableStructure()\Tableitems[i]
                CifItem(Trim(StringField(Name_of_CifFile.s(),1," ")))=Trim(StringField(CifFile.s(),2,RawTable.RawTableStructure()\Tableitems[i]))
                RawTable.RawTableStructure()\Tableitems[i]=CifItem(Trim(StringField(Name_of_CifFile.s(),1," ")))
              EndIf
              If FindString(Name_of_CifFile.s(),"_refine_diff_density_rms")
                Break
              EndIf
            Next
          EndIf
        Next
      EndIf
      
    Until FindString(ProfileFile.s(),"**end section TABLE")
    
    ForEach Elements.s()
      If Elements.s() <>"H"
        Elemente.s = Elements.s() + ", " + Elemente.s
      EndIf
    Next
    LastElement(Elements.s())
    DefaultElement.s=Elements.s()
    ;Selected_Element_for_Tables.s=InputRequester("Select bond parameters for specific element.","Available Elements: " + Trim(Trim(Elemente.s," "),",") + ".", DefaultElement.s)
    Print("Select bond parameters for specific element. " +  "Available Elements: " + Trim(Trim(Elemente.s," "),",") + "." + " [" + DefaultElement.s + "] : ")
    Selected_Element_for_Tables.s=Input()
    Selected_Element_for_Tables.s=Trim(Selected_Element_for_Tables.s)
    If Selected_Element_for_Tables.s=""
      Selected_Element_for_Tables.s=DefaultElement.s
    EndIf
    ;Element fuer Tabellen auswaehlen
    
    ForEach Elements.s()
      If Selected_Element_for_Tables.s = Elements.s() 
        Yes_Element_is_in_List.b = #True
        Select_Bond_Lengths_from_CIF(Bond_Lenghts_from_CIF.DistCIFStructure(),Selected_Element_for_Tables.s)
        Select_Angles_from_CIF(Angles_from_CIF.AngCIFStructure(),Selected_Element_for_Tables.s)
        Sort_Select_Bond_Lengths_from_CIF(Selected_Bond_Lenghts_from_CIF.DistCIFStructure())
        Sort_Select_Angles_from_CIF(Selected_Angles_from_CIF.AngCIFStructure())
;       ElseIf Selected_Element_for_Tables.s = "H"
;         Yes_Element_is_in_List.b = #False
      EndIf
    Next
    If Yes_Element_is_in_List.b = #False
      PrintN("Information! Element is Not in Structure!" + " '" + DefaultElement.s + "' will be choosen instead.")
      Selected_Element_for_Tables.s=DefaultElement.s
      Select_Bond_Lengths_from_CIF(Bond_Lenghts_from_CIF.DistCIFStructure(),Selected_Element_for_Tables.s)
      Select_Angles_from_CIF(Angles_from_CIF.AngCIFStructure(),Selected_Element_for_Tables.s)
      Sort_Select_Bond_Lengths_from_CIF(Selected_Bond_Lenghts_from_CIF.DistCIFStructure())
      Sort_Select_Angles_from_CIF(Selected_Angles_from_CIF.AngCIFStructure())
    EndIf
    
  Else
    PrintN("Information! Profile is empty!")
  EndIf
  
;   ForEach CifItem()
;     Debug MapKey(CifItem()) + ":  " + CifItem()
;   Next
;   
;   ForEach RawTable.RawTableStructure()
;     For i = 1 To RawTable.RawTableStructure()\Number_of_Tableitems
;       Debug RawTable.RawTableStructure()\Tableitems[i]
;     Next
;   Next

EndProcedure

Procedure Select_Bond_Lengths_from_CIF(List Bond_Lenghts_from_CIF.DistCIFStructure(),Element.s)
  ForEach Bond_Lenghts_from_CIF.DistCIFStructure()
    If Bond_Lenghts_from_CIF.DistCIFStructure()\Element1=Element.s Or Bond_Lenghts_from_CIF.DistCIFStructure()\Element2=Element.s
      AddElement(Selected_Bond_Lenghts_from_CIF.DistCIFStructure())
      Selected_Bond_Lenghts_from_CIF.DistCIFStructure()=Bond_Lenghts_from_CIF.DistCIFStructure()
    EndIf
  Next
  ;   ForEach Selected_Bond_Lenghts_from_CIF.DistCIFStructure()
  ;     Debug "xx" + Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\Alles
  ;   Next
EndProcedure

Procedure Select_Angles_from_CIF(List Angles_from_CIF.AngCIFStructure(),Element.s) 
  ForEach Angles_from_CIF.AngCIFStructure()
    If Angles_from_CIF.AngCIFStructure()\Element1=Element.s Or Angles_from_CIF.AngCIFStructure()\Element2=Element.s Or Angles_from_CIF.AngCIFStructure()\Element3=Element.s
      AddElement(Selected_Angles_from_CIF.AngCIFStructure())
      Selected_Angles_from_CIF.AngCIFStructure()=Angles_from_CIF.AngCIFStructure()
    EndIf
  Next
  ;     ForEach Selected_Angles_from_CIF.AngCIFStructure()
  ;       Debug "xx" + Selected_Angles_from_CIF.AngCIFStructure()\Alles
  ;     Next
EndProcedure

Procedure Sort_Select_Bond_Lengths_from_CIF(List Selected_Bond_Lenghts_from_CIF.DistCIFStructure())
  CopyList(Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Sorted_Selected_Bond_Lenghts_from_CIF.DistCIFStructure())
  SortStructuredList(Sorted_Selected_Bond_Lenghts_from_CIF(), #PB_Sort_Ascending, OffsetOf(DistCIFStructure\AbstandNum), TypeOf(DistCIFStructure\AbstandNum))
  
;   ForEach Sorted_Selected_Bond_Lenghts_from_CIF.DistCIFStructure()
;     Debug "xx" + Sorted_Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\Alles
;   Next
   
EndProcedure

Procedure Sort_Select_Angles_from_CIF(List Selected_Angles_from_CIF.AngCIFStructure())
  CopyList(Selected_Angles_from_CIF.AngCIFStructure(),Sorted_Selected_Angles_from_CIF.AngCIFStructure())
  SortStructuredList(Sorted_Selected_Angles_from_CIF(), #PB_Sort_Ascending, OffsetOf(AngCIFStructure\WinkelNum), TypeOf(AngCIFStructure\WinkelNum))
  
;   ForEach Sorted_Selected_Angles_from_CIF.AngCIFStructure()
;     Debug "xx" + Sorted_Selected_Angles_from_CIF.AngCIFStructure()\Alles
;   Next
  
EndProcedure

Procedure Create_RTF(List RawTable.RawTableStructure())
  
  Protected i.i
  Protected Number_of_Tabs.i
  Protected NewList RtfTable.RawTableStructure()
  Protected rtf.s
  Protected Is_IGNORE_LATEX.b=#True
  
  CopyList(RawTable.RawTableStructure(),RtfTable.RawTableStructure())
  
  #LeerzeileRTF="{\pard\plain \f0\fs24 \par}"
  #TR1="{\trowd\trgaph108\trql\cellx3600\cellx7200\pard\intbl \f0\fs24 "
  ;#TR1="{\trowd\trgaph108\trql\cellx3600\cellx7600\pard\intbl \f0\fs24 "
  #TR2="\cell\pard\intbl \f0\fs24 " 
  #TR3="\cell\row}"
  #TR14="{\trowd\trgaph108\trql\cellx2500\cellx4200\cellx6700\cellx8400\pard\intbl \f0\fs24 "
  
  AddElement(RtfFile()) : RtfFile() ="{\rtf1\ansi\deff0{\fonttbl{\f0 Times New Roman;}{\f1\froman\fprq2\fcharset2{\*\panose 05050102010706020507} Symbol;}}"
  AddElement(RtfFile()) : RtfFile() ="{\colortbl;\red255\green0\blue0;\red0\green0\blue255;}"
  AddElement(RtfFile()) : RtfFile() ="\paperw11909\paperh16834\margl1138\margt562\margr562\margb562" ;A4 + Raender
                                                                                                     ;AddElement(RtfFile()) : RtfFile() ="{\pard \f0\fs24 " + CIFItem("data") + "\par}"
                                                                                                     ;AddElement(RtfFile()) : RtfFile() = #LeerzeileRTF
  
  ForEach RtfTable.RawTableStructure()                                                               ;TEX- und ASCII-Zeugs herausfiltern
    For i = 1 To RtfTable.RawTableStructure()\Number_of_Tableitems
      If FindString(RtfTable.RawTableStructure()\Tableitems[i],"TEX\")  Or FindString(RtfTable.RawTableStructure()\Tableitems[i],"ASCII")
        Is_IGNORE_LATEX.b=#True
      EndIf
    Next
    If Is_IGNORE_LATEX.b=#True
      DeleteElement(RtfTable.RawTableStructure())
      Is_IGNORE_LATEX.b=#False
    EndIf
  Next
  
  
  ForEach RtfTable.RawTableStructure()
    Number_of_Tabs.i=0
    For i = 1 To RtfTable.RawTableStructure()\Number_of_Tableitems

;       If FindString(RtfTable.RawTableStructure()\Tableitems[i],"ASCII\") ;ASCII-Zeugs herausfiltern
;         If CreateRegularExpression(0, "ASCII.*")
;           If ExamineRegularExpression(0,RtfTable.RawTableStructure()\Tableitems[i])
;             While NextRegularExpressionMatch(0)
;               RtfTable.RawTableStructure()\Tableitems[i]=ReplaceString(RtfTable.RawTableStructure()\Tableitems[i],RtfTable.RawTableStructure()\Tableitems[i],"")
;             Wend
;           EndIf
;         Else
;           PrintN("Error! " + RegularExpressionError())
;         EndIf
;         FreeRegularExpression(0)
;       EndIf
            
      RtfTable.RawTableStructure()\Tableitems[i]=ReplaceString(RtfTable.RawTableStructure()\Tableitems[i],"TEX_IGNORE","")
      RtfTable.RawTableStructure()\Tableitems[i]=ReplaceString(RtfTable.RawTableStructure()\Tableitems[i],"B{","{\b ")
      RtfTable.RawTableStructure()\Tableitems[i]=ReplaceString(RtfTable.RawTableStructure()\Tableitems[i],"I{","{\i ")
      RtfTable.RawTableStructure()\Tableitems[i]=ReplaceString(RtfTable.RawTableStructure()\Tableitems[i],"G{","{\f1\fs24 ")
      RtfTable.RawTableStructure()\Tableitems[i]=ReplaceString(RtfTable.RawTableStructure()\Tableitems[i],"BLANK",#LeerzeileRTF)
      RtfTable.RawTableStructure()\Tableitems[i]=ReplaceString(RtfTable.RawTableStructure()\Tableitems[i],"SPC",Space(1))
      RtfTable.RawTableStructure()\Tableitems[i]=ReplaceString(RtfTable.RawTableStructure()\Tableitems[i],"DEG",Chr(176))
      RtfTable.RawTableStructure()\Tableitems[i]=ReplaceString(RtfTable.RawTableStructure()\Tableitems[i],"ANGS",Chr(197))
      RtfTable.RawTableStructure()\Tableitems[i]=ReplaceString(RtfTable.RawTableStructure()\Tableitems[i],"DOT",Chr(183));"·")
      RtfTable.RawTableStructure()\Tableitems[i]=ReplaceString(RtfTable.RawTableStructure()\Tableitems[i],"^{","{\super ")
      RtfTable.RawTableStructure()\Tableitems[i]=ReplaceString(RtfTable.RawTableStructure()\Tableitems[i],"_{","{\sub ")
      RtfTable.RawTableStructure()\Tableitems[i]=ReplaceString(RtfTable.RawTableStructure()\Tableitems[i],"data_",Name_of_Structure.s)
      RtfTable.RawTableStructure()\Tableitems[i]=ReplaceString(RtfTable.RawTableStructure()\Tableitems[i],"HKLRNG",HKL_entry_RTF())
      RtfTable.RawTableStructure()\Tableitems[i]=ReplaceString(RtfTable.RawTableStructure()\Tableitems[i],"SPACE_GROUP",SPG_Dict_RTF(CifItem("_space_group_name_H-M_alt")))
      If Trim(RtfTable.RawTableStructure()\Tableitems[i]) = "SYM_OPS"
        Create_Symcode_to_SymSymbol_and_List_of_Symops(Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Selected_Angles_from_CIF.AngCIFStructure())
        RtfTable.RawTableStructure()\Tableitems[i]=ReplaceString(RtfTable.RawTableStructure()\Tableitems[i],"SYM_OPS",Create_SymSatz_RTF(Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Selected_Angles_from_CIF.AngCIFStructure())) 
      EndIf
      If Trim(RtfTable.RawTableStructure()\Tableitems[i]) = "SYM_OPS_SORTED"
        Create_Symcode_to_SymSymbol_and_List_of_Symops(Sorted_Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Sorted_Selected_Angles_from_CIF.AngCIFStructure())
        RtfTable.RawTableStructure()\Tableitems[i]=ReplaceString(RtfTable.RawTableStructure()\Tableitems[i],"SYM_OPS_SORTED",Create_SymSatz_RTF(Sorted_Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Sorted_Selected_Angles_from_CIF.AngCIFStructure())) 
      EndIf
      If Trim(RtfTable.RawTableStructure()\Tableitems[i]) = "CAPTION"
        RtfTable.RawTableStructure()\Tableitems[i]=""
        RtfTable.RawTableStructure()\Tableitems[RtfTable.RawTableStructure()\Number_of_Tableitems+1]=#LeerzeileRTF
      EndIf
      If Trim(RtfTable.RawTableStructure()\Tableitems[i]) = "FIGURE_CAPTION"
        RtfTable.RawTableStructure()\Tableitems[i]=""
        ;RtfTable.RawTableStructure()\Tableitems[RtfTable.RawTableStructure()\Number_of_Tableitems+1]=#LeerzeileRTF
      EndIf
      If FindString(RtfTable.RawTableStructure()\Tableitems[i],"TAB")
        Number_of_Tabs.i=Number_of_Tabs.i+1
        If Number_of_Tabs.i=1
          RtfTable.RawTableStructure()\Tableitems[0]=#TR1
          RtfTable.RawTableStructure()\Tableitems[i]=ReplaceString(RtfTable.RawTableStructure()\Tableitems[i],"TAB",#TR2)
          RtfTable.RawTableStructure()\Tableitems[RtfTable.RawTableStructure()\Number_of_Tableitems+1]=#TR3
        Else
          RtfTable.RawTableStructure()\Tableitems[0]=#TR14
          RtfTable.RawTableStructure()\Tableitems[i]=ReplaceString(RtfTable.RawTableStructure()\Tableitems[i],"TAB",#TR2)
          RtfTable.RawTableStructure()\Tableitems[RtfTable.RawTableStructure()\Number_of_Tableitems+1]=#TR3
        EndIf
      EndIf 
      If FindString(RtfTable.RawTableStructure()\Tableitems[i],"FORMULA_SUM")
        ForEach Sum_Formula.Summenformel()
          RtfTable.RawTableStructure()\Tableitems[i]=RtfTable.RawTableStructure()\Tableitems[i] + Sum_Formula.Summenformel()\Elemente + "{\sub " + Sum_Formula.Summenformel()\Anzahl + "}"
        Next
        RtfTable.RawTableStructure()\Tableitems[i]=ReplaceString(RtfTable.RawTableStructure()\Tableitems[i],"FORMULA_SUM","")
      EndIf      
      If FindString(RtfTable.RawTableStructure()\Tableitems[i],"FORMULA_MOIETY")
        ForEach Moiety_Formula.Moietyformel()
          ;RtfTable.RawTableStructure()\Tableitems[i]=RtfTable.RawTableStructure()\Tableitems[i] + Moiety_Formula.Moietyformel()\Elemente + "{\sub " + Moiety_Formula.Moietyformel()\Anzahl + "}" + "{\super " + Moiety_Formula.Moietyformel()\Ladung + "}" + Moiety_Formula.Moietyformel()\Trennung
          RtfTable.RawTableStructure()\Tableitems[i]=RtfTable.RawTableStructure()\Tableitems[i] + Moiety_Formula.Moietyformel()\Aufklammer + Moiety_Formula.Moietyformel()\Elemente + "{\sub " + Moiety_Formula.Moietyformel()\Anzahl + "}" + "{\super " + Moiety_Formula.Moietyformel()\Ladung + "}" + Moiety_Formula.Moietyformel()\Zuklammer + Moiety_Formula.Moietyformel()\Trennung  
        Next
        RtfTable.RawTableStructure()\Tableitems[i]=ReplaceString(RtfTable.RawTableStructure()\Tableitems[i],"FORMULA_MOIETY","")
      EndIf    
    Next
  Next
  
  
  ;   ForEach RtfTable.RawTableStructure()
  ;     For i = 0 To RtfTable.RawTableStructure()\Number_of_Tableitems+1
  ;       Debug Str(i) + ": " + RtfTable.RawTableStructure()\Tableitems[i]
  ;     Next
  ;   Next
  
  
  ForEach RtfTable.RawTableStructure()
    For i = 0 To RtfTable.RawTableStructure()\Number_of_Tableitems+1
      If RtfTable.RawTableStructure()\Tableitems[i] = "BONDLENGTHS_2_COLUMN" 
        Create_Symcode_to_SymSymbol_and_List_of_Symops(Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Selected_Angles_from_CIF.AngCIFStructure())
        Create_Bondlengths_2_Column_Table_RTF(Selected_Bond_Lenghts_from_CIF.DistCIFStructure())
        ForEach RTF_Bondlengths_2_Column_Table.s()
          AddElement(Rtffile.s())
          Rtffile.s()=RTF_Bondlengths_2_Column_Table.s()
        Next
       ElseIf RtfTable.RawTableStructure()\Tableitems[i] = "BONDLENGTHS_4_COLUMN" 
          Create_Symcode_to_SymSymbol_and_List_of_Symops(Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Selected_Angles_from_CIF.AngCIFStructure())
          Create_Bondlengths_4_Column_Table_RTF(Selected_Bond_Lenghts_from_CIF.DistCIFStructure())
          ForEach RTF_Bondlengths_4_Column_Table.s()
            AddElement(Rtffile.s())
            Rtffile.s()=RTF_Bondlengths_4_Column_Table.s()
          Next
        ElseIf RtfTable.RawTableStructure()\Tableitems[i] = "BONDANGLES_2_COLUMN" 
          Create_Symcode_to_SymSymbol_and_List_of_Symops(Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Selected_Angles_from_CIF.AngCIFStructure())
          Create_Angles_2_Column_Table_RTF(Selected_Angles_from_CIF.AngCIFStructure())
          ForEach RTF_Angles_2_Column_Table.s()
            AddElement(Rtffile.s())
            Rtffile.s()=RTF_Angles_2_Column_Table.s()
          Next
        ElseIf RtfTable.RawTableStructure()\Tableitems[i] = "BONDANGLES_4_COLUMN" 
          Create_Symcode_to_SymSymbol_and_List_of_Symops(Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Selected_Angles_from_CIF.AngCIFStructure())
          Create_Angles_4_Column_Table_RTF(Selected_Angles_from_CIF.AngCIFStructure())
          ForEach RTF_Angles_4_Column_Table.s()
            AddElement(Rtffile.s())
            Rtffile.s()=RTF_Angles_4_Column_Table.s()
          Next
        ElseIf RtfTable.RawTableStructure()\Tableitems[i] = "BONDLENGTHS_2_COLUMN_SORTED" 
          Create_Symcode_to_SymSymbol_and_List_of_Symops(Sorted_Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Sorted_Selected_Angles_from_CIF.AngCIFStructure())
          Create_Bondlengths_2_Column_Table_RTF(Sorted_Selected_Bond_Lenghts_from_CIF.DistCIFStructure())
          ForEach RTF_Bondlengths_2_Column_Table.s()
            AddElement(Rtffile.s())
            Rtffile.s()=RTF_Bondlengths_2_Column_Table.s()
          Next
        ElseIf RtfTable.RawTableStructure()\Tableitems[i] = "BONDLENGTHS_4_COLUMN_SORTED" 
          Create_Symcode_to_SymSymbol_and_List_of_Symops(Sorted_Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Sorted_Selected_Angles_from_CIF.AngCIFStructure())
          Create_Bondlengths_4_Column_Table_RTF(Sorted_Selected_Bond_Lenghts_from_CIF.DistCIFStructure())
          ForEach RTF_Bondlengths_4_Column_Table.s()
            AddElement(Rtffile.s())
            Rtffile.s()=RTF_Bondlengths_4_Column_Table.s()
          Next
        ElseIf RtfTable.RawTableStructure()\Tableitems[i] = "BONDANGLES_2_COLUMN_SORTED" 
          Create_Symcode_to_SymSymbol_and_List_of_Symops(Sorted_Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Sorted_Selected_Angles_from_CIF.AngCIFStructure())
          Create_Angles_2_Column_Table_RTF(Sorted_Selected_Angles_from_CIF.AngCIFStructure())
          ForEach RTF_Angles_2_Column_Table.s()
            AddElement(Rtffile.s())
            Rtffile.s()=RTF_Angles_2_Column_Table.s()
          Next
        ElseIf RtfTable.RawTableStructure()\Tableitems[i] = "BONDANGLES_4_COLUMN_SORTED" 
          Create_Symcode_to_SymSymbol_and_List_of_Symops(Sorted_Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Sorted_Selected_Angles_from_CIF.AngCIFStructure())
          Create_Angles_4_Column_Table_RTF(Sorted_Selected_Angles_from_CIF.AngCIFStructure())
          ForEach RTF_Angles_4_Column_Table.s()
            AddElement(Rtffile.s())
            Rtffile.s()=RTF_Angles_4_Column_Table.s()
          Next
        ElseIf RtfTable.RawTableStructure()\Tableitems[i] = "BONDLENGTHS_AND_ANGLES_FIGURE" 
          Create_Symcode_to_SymSymbol_and_List_of_Symops(Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Selected_Angles_from_CIF.AngCIFStructure())
          Create_Figure_Caption_RTF(Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Selected_Angles_from_CIF.AngCIFStructure())
          AddElement(Rtffile.s())
          Rtffile.s()=Create_Figure_Caption_RTF(Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Selected_Angles_from_CIF.AngCIFStructure())+Create_SymSatz_RTF(Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Selected_Angles_from_CIF.AngCIFStructure())
          Rtffile.s()=RemoveString(Rtffile.s(),"}{\pard \f0\fs24 ")
        ElseIf RtfTable.RawTableStructure()\Tableitems[i] = "BONDLENGTHS_AND_ANGLES_FIGURE_SORTED"
          Create_Symcode_to_SymSymbol_and_List_of_Symops(Sorted_Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Sorted_Selected_Angles_from_CIF.AngCIFStructure())
          Create_Figure_Caption_RTF(Sorted_Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Sorted_Selected_Angles_from_CIF.AngCIFStructure())
          AddElement(Rtffile.s())
          Rtffile.s()=Create_Figure_Caption_RTF(Sorted_Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Sorted_Selected_Angles_from_CIF.AngCIFStructure())+Create_SymSatz_RTF(Sorted_Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Sorted_Selected_Angles_from_CIF.AngCIFStructure())
          Rtffile.s()=RemoveString(Rtffile.s(),"}{\pard \f0\fs24 ")
        Else
          AddElement(Rtffile.s())
          Rtffile.s()=Rtffile()+RtfTable.RawTableStructure()\Tableitems[i]
        EndIf
      Next
    Next
    
    
;     ForEach Rtffile.s()
;       If Rtffile.s()="" ;Or Rtffile.s()=" "
;         DeleteElement(Rtffile.s())
;       EndIf
;     Next
    
    ; Laesst den Rtffile schoener aussehen (nicht unbedingt notwendig)
    Protected NewList Nice_Rtffile.s()
    Protected Nice_Rtf_Line.s
    
    ForEach Rtffile.s()
      Nice_Rtf_Line.s=Nice_Rtf_Line.s+Rtffile.s()
      If FindString(Nice_Rtf_Line,"\cell\row}") Or FindString(Nice_Rtf_Line,"margb562") Or FindString(Nice_Rtf_Line,"\par}") Or FindString(Nice_Rtf_Line,"}}") 
        AddElement(Nice_Rtffile.s())
        Nice_Rtffile.s()=Nice_Rtf_Line.s
        Nice_Rtf_Line.s=""
      EndIf
    Next
    
    ClearList(Rtffile.s())
    CopyList(Nice_Rtffile.s(),Rtffile.s())
    ; schoener aussehen bis hierher
    
    LastElement(Rtffile.s())
    AddElement(Rtffile.s())
    Rtffile.s()="}" ;fuer Word
    
    ForEach Rtffile.s()
      rtf.s=rtf.s + Rtffile.s()
    Next
; 
;     *mem_rtf = AllocateMemory(StringByteLength(rtf.s, #PB_UTF8) + SizeOf(Character))
;     PokeS(*mem_rtf, rtf.s, -1, #PB_Ascii)
;     SetGadgetText(Editor_0, PeekS(*mem_rtf))
;     FreeMemory(*mem_rtf)
  
EndProcedure

Procedure Create_LaTeX(List RawTable.RawTableStructure())
  
  Protected i.i
  Protected Number_of_Tabs.i
  Protected NewList LaTeXTable.RawTableStructure()
  Protected LaTeX.s
  Protected Is_CAPTION.b=#False
  Protected Is_IGNORE_LATEX.b=#False
  
  CopyList(RawTable.RawTableStructure(),LaTeXTable.RawTableStructure())
  
  ForEach LaTeXTable.RawTableStructure() ;von Latex zu ignorieren
    For i = 1 To LaTeXTable.RawTableStructure()\Number_of_Tableitems
      If FindString(LaTeXTable.RawTableStructure()\Tableitems[i],"TEX_IGNORE") Or FindString(LaTeXTable.RawTableStructure()\Tableitems[i],"ASCII")
        Is_IGNORE_LATEX.b=#True
      EndIf
    Next
    If Is_IGNORE_LATEX.b=#True
      DeleteElement(LaTeXTable.RawTableStructure())
      Is_IGNORE_LATEX.b=#False
    EndIf
  Next
    
  
  ForEach LaTeXTable.RawTableStructure()
    Number_of_Tabs.i=0
    For i = 1 To LaTeXTable.RawTableStructure()\Number_of_Tableitems
      LaTeXTable.RawTableStructure()\Tableitems[i]=ReplaceString(LaTeXTable.RawTableStructure()\Tableitems[i],"TEX","")
      LaTeXTable.RawTableStructure()\Tableitems[i]=ReplaceString(LaTeXTable.RawTableStructure()\Tableitems[i],"SPC"," ")
      LaTeXTable.RawTableStructure()\Tableitems[i]=ReplaceString(LaTeXTable.RawTableStructure()\Tableitems[i],"BLANK","")
      LaTeXTable.RawTableStructure()\Tableitems[i]=ReplaceString(LaTeXTable.RawTableStructure()\Tableitems[i],"DOT","$\cdot$")
      LaTeXTable.RawTableStructure()\Tableitems[i]=ReplaceString(LaTeXTable.RawTableStructure()\Tableitems[i],"ANGS","\r{A}")
      LaTeXTable.RawTableStructure()\Tableitems[i]=ReplaceString(LaTeXTable.RawTableStructure()\Tableitems[i],"DEG","^{\circ}")
      LaTeXTable.RawTableStructure()\Tableitems[i]=ReplaceString(LaTeXTable.RawTableStructure()\Tableitems[i],">","$>$")
      LaTeXTable.RawTableStructure()\Tableitems[i]=ReplaceString(LaTeXTable.RawTableStructure()\Tableitems[i],"data_",Name_of_Structure.s)
      LaTeXTable.RawTableStructure()\Tableitems[i]=ReplaceString(LaTeXTable.RawTableStructure()\Tableitems[i],"SPACE_GROUP","$"+SPG_Dict_Latex(CifItem("_space_group_name_H-M_alt"))+"$")
      If FindString(LaTeXTable.RawTableStructure()\Tableitems[i],"SYM_OPS") And Not FindString(LaTeXTable.RawTableStructure()\Tableitems[i],"SYM_OPS_SORTED")
        Create_Symcode_to_SymSymbol_and_List_of_Symops(Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Selected_Angles_from_CIF.AngCIFStructure())
        LaTeXTable.RawTableStructure()\Tableitems[i]=ReplaceString(LaTeXTable.RawTableStructure()\Tableitems[i],"SYM_OPS",Create_SymSatz_LaTeX(Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Selected_Angles_from_CIF.AngCIFStructure())) 
      EndIf
      If FindString(LaTeXTable.RawTableStructure()\Tableitems[i],"SYM_OPS_SORTED") 
        Create_Symcode_to_SymSymbol_and_List_of_Symops(Sorted_Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Sorted_Selected_Angles_from_CIF.AngCIFStructure())
        LaTeXTable.RawTableStructure()\Tableitems[i]=ReplaceString(LaTeXTable.RawTableStructure()\Tableitems[i],"SYM_OPS_SORTED",Create_SymSatz_LaTeX(Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Selected_Angles_from_CIF.AngCIFStructure())) 
      EndIf
      If Trim(LaTeXTable.RawTableStructure()\Tableitems[i]) = "x"
        LaTeXTable.RawTableStructure()\Tableitems[i]=ReplaceString(LaTeXTable.RawTableStructure()\Tableitems[i],"x", "$\times$")
      EndIf
      If Trim(LaTeXTable.RawTableStructure()\Tableitems[i]) = "HKLRNG"
        LaTeXTable.RawTableStructure()\Tableitems[i]=ReplaceString(LaTeXTable.RawTableStructure()\Tableitems[i],"HKLRNG", HKL_entry_LaTex())
      EndIf
      If FindString(LaTeXTable.RawTableStructure()\Tableitems[i],"_") ;nichtvorhandene CIF-Itmes
        If CreateRegularExpression(0, "_[a-z]{1,}[a-z0-9]{0,}_.*")
          If ExamineRegularExpression(0,LaTeXTable.RawTableStructure()\Tableitems[i])
            While NextRegularExpressionMatch(0)
              LaTeXTable.RawTableStructure()\Tableitems[i]=ReplaceString(LaTeXTable.RawTableStructure()\Tableitems[i],RegularExpressionMatchString(0),"\textbf{item not found!}")
            Wend
          EndIf
        Else
          PrintN("Error! " + RegularExpressionError())
        EndIf
        FreeRegularExpression(0)
      EndIf
      If FindString(LaTeXTable.RawTableStructure()\Tableitems[i],"Table") ;Table entfernen
        If CreateRegularExpression(0, "Table\s*[a-zA-Z0-9][\.\-a-zA-Z0-9]*")
          If ExamineRegularExpression(0,LaTeXTable.RawTableStructure()\Tableitems[i])
            While NextRegularExpressionMatch(0)
              LaTeXTable.RawTableStructure()\Tableitems[i]=ReplaceString(LaTeXTable.RawTableStructure()\Tableitems[i],RegularExpressionMatchString(0),"")
            Wend
          EndIf
        Else
          PrintN("Error! " + RegularExpressionError())
        EndIf
        FreeRegularExpression(0)
      EndIf
      If FindString(LaTeXTable.RawTableStructure()\Tableitems[i],"Figure") ;Figure entfernen
        If CreateRegularExpression(0, "Figure\s*[a-zA-Z0-9][\.\-a-zA-Z0-9]*")
          If ExamineRegularExpression(0,LaTeXTable.RawTableStructure()\Tableitems[i])
            While NextRegularExpressionMatch(0)
              LaTeXTable.RawTableStructure()\Tableitems[i]=ReplaceString(LaTeXTable.RawTableStructure()\Tableitems[i],RegularExpressionMatchString(0),"")
            Wend
          EndIf
        Else
          PrintN("Error! " + RegularExpressionError())
        EndIf
        FreeRegularExpression(0)
      EndIf
      If FindString(LaTeXTable.RawTableStructure()\Tableitems[i],"B{")
        If CreateRegularExpression(0, "B{(.*?)}")
          If ExamineRegularExpression(0,LaTeXTable.RawTableStructure()\Tableitems[i])
            While NextRegularExpressionMatch(0)
              LaTeXTable.RawTableStructure()\Tableitems[i]=ReplaceString(LaTeXTable.RawTableStructure()\Tableitems[i],RegularExpressionMatchString(0),"\textbf{"+RegularExpressionGroup(0, 1)+"}")
            Wend
          EndIf
        Else
          PrintN("Error! " + RegularExpressionError())
        EndIf
        FreeRegularExpression(0)
      EndIf
      If FindString(LaTeXTable.RawTableStructure()\Tableitems[i],"I{")
        If CreateRegularExpression(0, "I{(.*?)}")
          If ExamineRegularExpression(0,LaTeXTable.RawTableStructure()\Tableitems[i])
            While NextRegularExpressionMatch(0)
              LaTeXTable.RawTableStructure()\Tableitems[i]=ReplaceString(LaTeXTable.RawTableStructure()\Tableitems[i],RegularExpressionMatchString(0),"$"+RegularExpressionGroup(0, 1)+"$")
            Wend
          EndIf
        Else
          PrintN("Error! " + RegularExpressionError())
        EndIf
        FreeRegularExpression(0)
      EndIf
      If FindString(LaTeXTable.RawTableStructure()\Tableitems[i],"G{")
        If CreateRegularExpression(0, "G{(.*?)}")
          If ExamineRegularExpression(0,LaTeXTable.RawTableStructure()\Tableitems[i])
            While NextRegularExpressionMatch(0)
              LaTeXTable.RawTableStructure()\Tableitems[i]=ReplaceString(LaTeXTable.RawTableStructure()\Tableitems[i],RegularExpressionMatchString(0),Greek_Dict_Latex(RegularExpressionMatchString(0)))
            Wend
          EndIf
        Else
          PrintN("Error! " + RegularExpressionError())
        EndIf
        FreeRegularExpression(0)
      EndIf
      If FindString(LaTeXTable.RawTableStructure()\Tableitems[i],"^{")
        If CreateRegularExpression(0, "\^{(.*?)}")
          If ExamineRegularExpression(0,LaTeXTable.RawTableStructure()\Tableitems[i])
            While NextRegularExpressionMatch(0)
              LaTeXTable.RawTableStructure()\Tableitems[i]=ReplaceString(LaTeXTable.RawTableStructure()\Tableitems[i],RegularExpressionMatchString(0),"$^{"+RegularExpressionGroup(0, 1)+"}$")
            Wend
          EndIf
        Else
          PrintN("Error! " + RegularExpressionError())
        EndIf
        FreeRegularExpression(0)
      EndIf
      If FindString(LaTeXTable.RawTableStructure()\Tableitems[i],"_{")
        If CreateRegularExpression(0, "_{(.*?)}")
          If ExamineRegularExpression(0,LaTeXTable.RawTableStructure()\Tableitems[i])
            While NextRegularExpressionMatch(0)
              LaTeXTable.RawTableStructure()\Tableitems[i]=ReplaceString(LaTeXTable.RawTableStructure()\Tableitems[i],RegularExpressionMatchString(0),"$_\mathrm{"+RegularExpressionGroup(0, 1)+"}$")
            Wend
          EndIf
        Else
          PrintN("Error! " + RegularExpressionError())
        EndIf
        FreeRegularExpression(0)
      EndIf
      If FindString(LaTeXTable.RawTableStructure()\Tableitems[i],"-") And Not FindString(LaTeXTable.RawTableStructure()\Tableitems[i],"{-") And Not FindString(LaTeXTable.RawTableStructure()\Tableitems[i],"x") And Not FindString(LaTeXTable.RawTableStructure()\Tableitems[i],"\leq") 
        If CreateRegularExpression(0, "-(\d.*)")
          If ExamineRegularExpression(0,LaTeXTable.RawTableStructure()\Tableitems[i])
            While NextRegularExpressionMatch(0)
              LaTeXTable.RawTableStructure()\Tableitems[i]=ReplaceString(LaTeXTable.RawTableStructure()\Tableitems[i],RegularExpressionMatchString(0),"$-" + RegularExpressionGroup(0, 1)+"$")
            Wend
          EndIf
        Else
          PrintN("Error! " + RegularExpressionError())
        EndIf
        FreeRegularExpression(0)
      EndIf
      If Trim(LaTeXTable.RawTableStructure()\Tableitems[i]) = "CAPTION"
        LaTeXTable.RawTableStructure()\Tableitems[i]=ReplaceString(LaTeXTable.RawTableStructure()\Tableitems[i],"CAPTION","\caption{")
        LaTeXTable.RawTableStructure()\Tableitems[LaTeXTable.RawTableStructure()\Number_of_Tableitems+1]="}"
      EndIf
      If Trim(LaTeXTable.RawTableStructure()\Tableitems[i]) = "FIGURE_CAPTION"
        LaTeXTable.RawTableStructure()\Tableitems[i]=ReplaceString(LaTeXTable.RawTableStructure()\Tableitems[i],"FIGURE_CAPTION","\caption{") 
        ;caption wir erst mit %BONDLENGTHS_AND_ANGLES_FIGURE% geschlossen
      EndIf
      If Trim(LaTeXTable.RawTableStructure()\Tableitems[i]) = "TAB"
        LaTeXTable.RawTableStructure()\Tableitems[i]=ReplaceString(LaTeXTable.RawTableStructure()\Tableitems[i],"TAB"," & ")
        LaTeXTable.RawTableStructure()\Tableitems[LaTeXTable.RawTableStructure()\Number_of_Tableitems+1]=" \\"
      EndIf
      If FindString(LaTeXTable.RawTableStructure()\Tableitems[i],"FORMULA_SUM")
        ForEach Sum_Formula.Summenformel()
          LaTeXTable.RawTableStructure()\Tableitems[i]=LaTeXTable.RawTableStructure()\Tableitems[i] + Sum_Formula.Summenformel()\Elemente + "$_{" + Sum_Formula.Summenformel()\Anzahl + "}$"
        Next
        LaTeXTable.RawTableStructure()\Tableitems[i]=ReplaceString(LaTeXTable.RawTableStructure()\Tableitems[i],"FORMULA_SUM","")
      EndIf  
      If FindString(LaTeXTable.RawTableStructure()\Tableitems[i],"FORMULA_MOIETY")
        ForEach Moiety_Formula.Moietyformel()
          ;LaTeXTable.RawTableStructure()\Tableitems[i]=LaTeXTable.RawTableStructure()\Tableitems[i] + Moiety_Formula.Moietyformel()\Elemente + "$_{" + Moiety_Formula.Moietyformel()\Anzahl + "}$" + "$^{" + Moiety_Formula.Moietyformel()\Ladung + "}$" + Moiety_Formula.Moietyformel()\Trennung
          LaTeXTable.RawTableStructure()\Tableitems[i]=LaTeXTable.RawTableStructure()\Tableitems[i] + Moiety_Formula.Moietyformel()\Aufklammer + Moiety_Formula.Moietyformel()\Elemente + "$_{" + Moiety_Formula.Moietyformel()\Anzahl + "}$" + "$^{" + Moiety_Formula.Moietyformel()\Ladung + "}$" + Moiety_Formula.Moietyformel()\Zuklammer + Moiety_Formula.Moietyformel()\Trennung
        Next
        LaTeXTable.RawTableStructure()\Tableitems[i]=ReplaceString(LaTeXTable.RawTableStructure()\Tableitems[i],"FORMULA_MOIETY","")
      EndIf    
    Next
  Next
  
  ForEach LaTeXTable.RawTableStructure()
    For i = 0 To LaTeXTable.RawTableStructure()\Number_of_Tableitems+1
      If LaTeXTable.RawTableStructure()\Tableitems[i] = "BONDLENGTHS_2_COLUMN" 
        Create_Symcode_to_SymSymbol_and_List_of_Symops(Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Selected_Angles_from_CIF.AngCIFStructure())
        Create_Bondlengths_2_Column_Table_LaTeX(Selected_Bond_Lenghts_from_CIF.DistCIFStructure())
        ForEach LaTeX_Bondlengths_2_Column_Table.s()
          AddElement(LaTeXFile.s())
          LaTeXFile.s()=LaTeX_Bondlengths_2_Column_Table.s() + #CRLF$
        Next
        LastElement(LaTeXFile.s())
        LaTeXFile.s()=RemoveString(LaTeXFile.s(),#CRLF$)
      ElseIf LaTeXTable.RawTableStructure()\Tableitems[i] = "BONDLENGTHS_4_COLUMN" 
        Create_Symcode_to_SymSymbol_and_List_of_Symops(Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Selected_Angles_from_CIF.AngCIFStructure())
        Create_Bondlengths_4_Column_Table_LaTeX(Selected_Bond_Lenghts_from_CIF.DistCIFStructure())
        ForEach LaTeX_Bondlengths_4_Column_Table.s()
          AddElement(LaTeXFile.s())
          LaTeXFile.s()=LaTeX_Bondlengths_4_Column_Table.s() + #CRLF$
        Next
        LastElement(LaTeXFile.s())
        LaTeXFile.s()=RemoveString(LaTeXFile.s(),#CRLF$)
      ElseIf LaTeXTable.RawTableStructure()\Tableitems[i] = "BONDANGLES_2_COLUMN" 
        Create_Symcode_to_SymSymbol_and_List_of_Symops(Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Selected_Angles_from_CIF.AngCIFStructure())
        Create_Angles_2_Column_Table_LaTeX(Selected_Angles_from_CIF.DistCIFStructure())
        ForEach LaTeX_Angles_2_Column_Table.s()
          AddElement(LaTeXFile.s())
          LaTeXFile.s()=LaTeX_Angles_2_Column_Table.s() + #CRLF$
        Next
        LastElement(LaTeXFile.s())
        LaTeXFile.s()=RemoveString(LaTeXFile.s(),#CRLF$)
      ElseIf LaTeXTable.RawTableStructure()\Tableitems[i] = "BONDANGLES_4_COLUMN" 
        Create_Symcode_to_SymSymbol_and_List_of_Symops(Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Selected_Angles_from_CIF.AngCIFStructure())
        Create_Angles_4_Column_Table_LaTeX(Selected_Angles_from_CIF.DistCIFStructure())
        ForEach LaTeX_Angles_4_Column_Table.s()
          AddElement(LaTeXFile.s())
          LaTeXFile.s()=LaTeX_Angles_4_Column_Table.s() + #CRLF$
        Next
        LastElement(LaTeXFile.s())
        LaTeXFile.s()=RemoveString(LaTeXFile.s(),#CRLF$)
      ElseIf LaTeXTable.RawTableStructure()\Tableitems[i] = "BONDLENGTHS_2_COLUMN_SORTED" 
        Create_Symcode_to_SymSymbol_and_List_of_Symops(Sorted_Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Sorted_Selected_Angles_from_CIF.AngCIFStructure())
        Create_Bondlengths_2_Column_Table_LaTeX(Sorted_Selected_Bond_Lenghts_from_CIF.DistCIFStructure())
        ForEach LaTeX_Bondlengths_2_Column_Table.s()
          AddElement(LaTeXFile.s())
          LaTeXFile.s()=LaTeX_Bondlengths_2_Column_Table.s() + #CRLF$
        Next
      ElseIf LaTeXTable.RawTableStructure()\Tableitems[i] = "BONDLENGTHS_4_COLUMN_SORTED" 
        Create_Symcode_to_SymSymbol_and_List_of_Symops(Sorted_Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Sorted_Selected_Angles_from_CIF.AngCIFStructure())
        Create_Bondlengths_4_Column_Table_LaTeX(Sorted_Selected_Bond_Lenghts_from_CIF.DistCIFStructure())
        ForEach LaTeX_Bondlengths_4_Column_Table.s()
          AddElement(LaTeXFile.s())
          LaTeXFile.s()=LaTeX_Bondlengths_4_Column_Table.s() + #CRLF$
        Next
        LastElement(LaTeXFile.s())
        LaTeXFile.s()=RemoveString(LaTeXFile.s(),#CRLF$)
      ElseIf LaTeXTable.RawTableStructure()\Tableitems[i] = "BONDANGLES_2_COLUMN_SORTED" 
        Create_Symcode_to_SymSymbol_and_List_of_Symops(Sorted_Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Sorted_Selected_Angles_from_CIF.AngCIFStructure())
        Create_Angles_2_Column_Table_LaTeX(Sorted_Selected_Angles_from_CIF.DistCIFStructure())
        ForEach LaTeX_Angles_2_Column_Table.s()
          AddElement(LaTeXFile.s())
          LaTeXFile.s()=LaTeX_Angles_2_Column_Table.s() + #CRLF$
        Next
        LastElement(LaTeXFile.s())
        LaTeXFile.s()=RemoveString(LaTeXFile.s(),#CRLF$)
      ElseIf LaTeXTable.RawTableStructure()\Tableitems[i] = "BONDANGLES_4_COLUMN_SORTED" 
        Create_Symcode_to_SymSymbol_and_List_of_Symops(Sorted_Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Sorted_Selected_Angles_from_CIF.AngCIFStructure())
        Create_Angles_4_Column_Table_LaTeX(Sorted_Selected_Angles_from_CIF.DistCIFStructure())
        ForEach LaTeX_Angles_4_Column_Table.s()
          AddElement(LaTeXFile.s())
          LaTeXFile.s()=LaTeX_Angles_4_Column_Table.s() + #CRLF$
        Next
        LastElement(LaTeXFile.s())
        LaTeXFile.s()=RemoveString(LaTeXFile.s(),#CRLF$)
      ElseIf LaTeXTable.RawTableStructure()\Tableitems[i] = "BONDLENGTHS_AND_ANGLES_FIGURE" 
        Create_Symcode_to_SymSymbol_and_List_of_Symops(Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Selected_Angles_from_CIF.AngCIFStructure())
        AddElement(LaTeXFile.s())
        LaTeXFile.s()=Create_Figure_Caption_LaTeX(Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Selected_Angles_from_CIF.AngCIFStructure())+Create_SymSatz_LaTeX(Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Selected_Angles_from_CIF.AngCIFStructure())+"}" ;caption geschlossen
      ElseIf LaTeXTable.RawTableStructure()\Tableitems[i] = "BONDLENGTHS_AND_ANGLES_FIGURE_SORTED" 
        Create_Symcode_to_SymSymbol_and_List_of_Symops(Sorted_Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Sorted_Selected_Angles_from_CIF.AngCIFStructure())
        AddElement(LaTeXFile.s())
        LaTeXFile.s()=Create_Figure_Caption_LaTeX(Sorted_Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Sorted_Selected_Angles_from_CIF.AngCIFStructure())+Create_SymSatz_LaTeX(Sorted_Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Sorted_Selected_Angles_from_CIF.AngCIFStructure())+"}" ;caption geschlossen
      Else 
        AddElement(LaTeXFile.s())
        LaTeXFile.s()=LaTeXFile.s()+LaTeXTable.RawTableStructure()\Tableitems[i]
      EndIf     
    Next
    LaTeXFile.s()=LaTeXFile()+#CRLF$
  Next

; ;   
; ;   ForEach LaTeXTable.RawTableStructure()
; ;     For i = 0 To LaTeXTable.RawTableStructure()\Number_of_Tableitems+1
; ;       AddElement(LaTeXFile.s())
; ;       LaTeXFile.s()=LaTeXFile.s()+LaTeXTable.RawTableStructure()\Tableitems[i]
; ;     Next
; ;     LaTeXFile.s()=LaTeXFile()+#CRLF$
; ;   Next
;   
  ForEach LaTeXFile.s() ;Aufraeumen
    LaTeXFile.s()=ReplaceString(LaTeXFile.s(),"$$","")
    LaTeXFile.s()=ReplaceString(LaTeXFile.s(),"\textbf{}","")
    LaTeXFile.s()=ReplaceString(LaTeXFile.s(),"$^{}$","")
    LaTeXFile.s()=ReplaceString(LaTeXFile.s(),"^{}","")
    ;LaTeXFile.s()=ReplaceString(LaTeXFile.s(),"_{}","")
  Next
  
  ForEach LaTeXFile()
    LaTeX.s=LaTeX.s+LaTeXFile()
    LaTeX.s=ReplaceString(LaTeX.s,#CRLF$+#CRLF$,#CRLF$)
  Next
  
 ;SetGadgetText(Editor_0, LaTeX.s)
  
EndProcedure

Procedure Create_Ascii(List RawTable.RawTableStructure())
  
  Protected i.i
  Protected Number_of_Tabs.i
  Protected NewList AsciiTable.RawTableStructure()
  Protected Ascii.s
  Protected Is_IGNORE_LATEX.b=#True
  Protected Max_Char_Column.i
  Protected Numer_of_Spaces_to_Insert.i
  
  CopyList(RawTable.RawTableStructure(),AsciiTable.RawTableStructure())
  
  ForEach AsciiTable.RawTableStructure() ;von Ascii zu ignorieren
    For i = 1 To AsciiTable.RawTableStructure()\Number_of_Tableitems
      If FindString(AsciiTable.RawTableStructure()\Tableitems[i],"TEX\") 
        Is_IGNORE_LATEX.b=#True
      EndIf
    Next
    If Is_IGNORE_LATEX.b=#True
      DeleteElement(AsciiTable.RawTableStructure())
      Is_IGNORE_LATEX.b=#False
    EndIf
  Next
  
  ForEach AsciiTable.RawTableStructure()
    Number_of_Tabs.i=0
    For i = 1 To AsciiTable.RawTableStructure()\Number_of_Tableitems
      AsciiTable.RawTableStructure()\Tableitems[i]=ReplaceString(AsciiTable.RawTableStructure()\Tableitems[i],"TEX_IGNORE","")
      AsciiTable.RawTableStructure()\Tableitems[i]=ReplaceString(AsciiTable.RawTableStructure()\Tableitems[i],"ASCII\","")
      AsciiTable.RawTableStructure()\Tableitems[i]=ReplaceString(AsciiTable.RawTableStructure()\Tableitems[i],"FIGURE_CAPTION","")
      AsciiTable.RawTableStructure()\Tableitems[i]=ReplaceString(AsciiTable.RawTableStructure()\Tableitems[i],"CAPTION","")
      AsciiTable.RawTableStructure()\Tableitems[i]=ReplaceString(AsciiTable.RawTableStructure()\Tableitems[i],"B{","")
      AsciiTable.RawTableStructure()\Tableitems[i]=ReplaceString(AsciiTable.RawTableStructure()\Tableitems[i],"I{","")
      AsciiTable.RawTableStructure()\Tableitems[i]=ReplaceString(AsciiTable.RawTableStructure()\Tableitems[i],"BLANK",#CRLF$)
      AsciiTable.RawTableStructure()\Tableitems[i]=ReplaceString(AsciiTable.RawTableStructure()\Tableitems[i],"SPC",Space(1))
      AsciiTable.RawTableStructure()\Tableitems[i]=ReplaceString(AsciiTable.RawTableStructure()\Tableitems[i],"DEG","°")
      AsciiTable.RawTableStructure()\Tableitems[i]=ReplaceString(AsciiTable.RawTableStructure()\Tableitems[i],"ANGS","Å")
      AsciiTable.RawTableStructure()\Tableitems[i]=ReplaceString(AsciiTable.RawTableStructure()\Tableitems[i],"DOT","·")
      AsciiTable.RawTableStructure()\Tableitems[i]=ReplaceString(AsciiTable.RawTableStructure()\Tableitems[i],"G{a",Chr(945))
      AsciiTable.RawTableStructure()\Tableitems[i]=ReplaceString(AsciiTable.RawTableStructure()\Tableitems[i],"G{b",Chr(946))
      AsciiTable.RawTableStructure()\Tableitems[i]=ReplaceString(AsciiTable.RawTableStructure()\Tableitems[i],"G{g",Chr(947))
      AsciiTable.RawTableStructure()\Tableitems[i]=ReplaceString(AsciiTable.RawTableStructure()\Tableitems[i],"G{r",Chr(961))
      AsciiTable.RawTableStructure()\Tableitems[i]=ReplaceString(AsciiTable.RawTableStructure()\Tableitems[i],"G{m","µ")
      AsciiTable.RawTableStructure()\Tableitems[i]=ReplaceString(AsciiTable.RawTableStructure()\Tableitems[i],"G{q",Chr(952))
      AsciiTable.RawTableStructure()\Tableitems[i]=ReplaceString(AsciiTable.RawTableStructure()\Tableitems[i],"G{s",Chr(963))
      AsciiTable.RawTableStructure()\Tableitems[i]=ReplaceString(AsciiTable.RawTableStructure()\Tableitems[i],"^{","^")
      AsciiTable.RawTableStructure()\Tableitems[i]=ReplaceString(AsciiTable.RawTableStructure()\Tableitems[i],"_{","")
      AsciiTable.RawTableStructure()\Tableitems[i]=ReplaceString(AsciiTable.RawTableStructure()\Tableitems[i],"}","")
      AsciiTable.RawTableStructure()\Tableitems[i]=ReplaceString(AsciiTable.RawTableStructure()\Tableitems[i],"^-1",Chr(8315) + Chr(185))
      AsciiTable.RawTableStructure()\Tableitems[i]=ReplaceString(AsciiTable.RawTableStructure()\Tableitems[i],"^2",Chr(178))
      AsciiTable.RawTableStructure()\Tableitems[i]=ReplaceString(AsciiTable.RawTableStructure()\Tableitems[i],"^3",Chr(179))
      AsciiTable.RawTableStructure()\Tableitems[i]=ReplaceString(AsciiTable.RawTableStructure()\Tableitems[i],"^-3",Chr(8315) + Chr(179))
      AsciiTable.RawTableStructure()\Tableitems[i]=ReplaceString(AsciiTable.RawTableStructure()\Tableitems[i],"data_",Name_of_Structure.s)
      AsciiTable.RawTableStructure()\Tableitems[i]=ReplaceString(AsciiTable.RawTableStructure()\Tableitems[i],"HKLRNG",HKL_entry_Ascii())
      AsciiTable.RawTableStructure()\Tableitems[i]=ReplaceString(AsciiTable.RawTableStructure()\Tableitems[i],"SPACE_GROUP",CifItem("_space_group_name_H-M_alt"))

      If FindString(AsciiTable.RawTableStructure()\Tableitems[i],"SYM_OPS") And Not FindString(AsciiTable.RawTableStructure()\Tableitems[i],"SYM_OPS_SORTED")
        Create_Symcode_to_SymSymbol_and_List_of_Symops(Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Selected_Angles_from_CIF.AngCIFStructure())
        AsciiTable.RawTableStructure()\Tableitems[i]=ReplaceString(AsciiTable.RawTableStructure()\Tableitems[i],"SYM_OPS",Create_SymSatz_Ascii(Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Selected_Angles_from_CIF.AngCIFStructure())) 
      EndIf
      
      If FindString(AsciiTable.RawTableStructure()\Tableitems[i],"SYM_OPS_SORTED")
        Create_Symcode_to_SymSymbol_and_List_of_Symops(Sorted_Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Sorted_Selected_Angles_from_CIF.AngCIFStructure())
        AsciiTable.RawTableStructure()\Tableitems[i]=ReplaceString(AsciiTable.RawTableStructure()\Tableitems[i],"SYM_OPS_SORTED",Create_SymSatz_Ascii(Sorted_Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Sorted_Selected_Angles_from_CIF.AngCIFStructure())) 
      EndIf
      
      If FindString(AsciiTable.RawTableStructure()\Tableitems[i],"FORMULA_SUM")
        ForEach Sum_Formula.Summenformel()
          AsciiTable.RawTableStructure()\Tableitems[i]=AsciiTable.RawTableStructure()\Tableitems[i] + Sum_Formula.Summenformel()\Elemente +  Sum_Formula.Summenformel()\Anzahl + " "
        Next
        AsciiTable.RawTableStructure()\Tableitems[i]=ReplaceString(AsciiTable.RawTableStructure()\Tableitems[i],"FORMULA_SUM","")
      EndIf
      
      If FindString(AsciiTable.RawTableStructure()\Tableitems[i],"FORMULA_MOIETY")
        ForEach Moiety_Formula.Moietyformel()
          ;AsciiTable.RawTableStructure()\Tableitems[i]=AsciiTable.RawTableStructure()\Tableitems[i] + Moiety_Formula.Moietyformel()\Elemente + Moiety_Formula.Moietyformel()\Anzahl + " " + Moiety_Formula.Moietyformel()\Ladung + Moiety_Formula.Moietyformel()\Trennung
          AsciiTable.RawTableStructure()\Tableitems[i]=AsciiTable.RawTableStructure()\Tableitems[i] + Moiety_Formula.Moietyformel()\Aufklammer + Moiety_Formula.Moietyformel()\Elemente + Moiety_Formula.Moietyformel()\Anzahl + " " + Moiety_Formula.Moietyformel()\Ladung + Moiety_Formula.Moietyformel()\Zuklammer + Moiety_Formula.Moietyformel()\Trennung  
        Next
        AsciiTable.RawTableStructure()\Tableitems[i]=ReplaceString(AsciiTable.RawTableStructure()\Tableitems[i],"FORMULA_MOIETY","")
      EndIf       
    Next
  Next
  
  ForEach AsciiTable.RawTableStructure()
    AddElement(AsciiFile.s())
    For i = 0 To AsciiTable.RawTableStructure()\Number_of_Tableitems+1
      AsciiFile.s()=AsciiFile.s()+AsciiTable.RawTableStructure()\Tableitems[i]
    Next
    If AsciiFile.s() <> #CRLF$ 
      AsciiFile.s()=AsciiFile.s()+#CRLF$
    Else
      AsciiFile.s()=AsciiFile.s()
    EndIf   
  Next
  
  ForEach AsciiFile.s()
    If FindString(AsciiFile.s(),"BONDLENGTHS_2_COLUMN") And Not FindString(AsciiFile.s(),"BONDLENGTHS_2_COLUMN_SORTED")
      DeleteElement(AsciiFile.s())
      Create_Symcode_to_SymSymbol_and_List_of_Symops(Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Selected_Angles_from_CIF.AngCIFStructure())
      Create_Bondlengths_2_Column_Table_Ascii(Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),AsciiFile.s())
      DeleteElement(AsciiFile.s())
      ForEach Ascii_Bondlengths_2_Column_Table.s()
        AddElement(AsciiFile.s())
        AsciiFile.s()=Ascii_Bondlengths_2_Column_Table.s() + #CRLF$
      Next
    ElseIf FindString(AsciiFile.s(),"BONDANGLES_2_COLUMN") And Not FindString(AsciiFile.s(),"BONDANGLES_2_COLUMN_SORTED")    
      DeleteElement(AsciiFile.s())
      Create_Symcode_to_SymSymbol_and_List_of_Symops(Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Selected_Angles_from_CIF.AngCIFStructure())
      Create_Angles_2_Column_Table_Ascii(Selected_Angles_from_CIF.DistCIFStructure(),AsciiFile.s())
      DeleteElement(AsciiFile.s())
      ForEach Ascii_Angles_2_Column_Table.s()
        AddElement(AsciiFile.s())
        AsciiFile.s()=Ascii_Angles_2_Column_Table.s() + #CRLF$
      Next
    ElseIf FindString(AsciiFile.s(),"BONDLENGTHS_2_COLUMN_SORTED")
      DeleteElement(AsciiFile.s())
      Create_Symcode_to_SymSymbol_and_List_of_Symops(Sorted_Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Sorted_Selected_Angles_from_CIF.AngCIFStructure())
      Create_Bondlengths_2_Column_Table_Ascii(Sorted_Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),AsciiFile.s())
      DeleteElement(AsciiFile.s())
      ForEach Ascii_Bondlengths_2_Column_Table.s()
        AddElement(AsciiFile.s())
        AsciiFile.s()=Ascii_Bondlengths_2_Column_Table.s() + #CRLF$
      Next
    ElseIf FindString(AsciiFile.s(),"BONDANGLES_2_COLUMN_SORTED")
      DeleteElement(AsciiFile.s())
      Create_Symcode_to_SymSymbol_and_List_of_Symops(Sorted_Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Sorted_Selected_Angles_from_CIF.AngCIFStructure())
      Create_Angles_2_Column_Table_Ascii(Sorted_Selected_Angles_from_CIF.DistCIFStructure(),AsciiFile.s())
      DeleteElement(AsciiFile.s())
      ForEach Ascii_Angles_2_Column_Table.s()
        AddElement(AsciiFile.s())
        AsciiFile.s()=Ascii_Angles_2_Column_Table.s() + #CRLF$
      Next
    ElseIf FindString(AsciiFile.s(),"BONDLENGTHS_4_COLUMN") And Not FindString(AsciiFile.s(),"BONDLENGTHS_4_COLUMN_SORTED")
      DeleteElement(AsciiFile.s())
      Create_Symcode_to_SymSymbol_and_List_of_Symops(Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Selected_Angles_from_CIF.AngCIFStructure())
      Create_Bondlengths_4_Column_Table_Ascii(Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),AsciiFile.s())
      DeleteElement(AsciiFile.s())
      ForEach Ascii_Bondlengths_4_Column_Table.s()
        AddElement(AsciiFile.s())
        AsciiFile.s()=Ascii_Bondlengths_4_Column_Table.s() + #CRLF$
      Next
    ElseIf FindString(AsciiFile.s(),"BONDANGLES_4_COLUMN") And Not FindString(AsciiFile.s(),"BONDANGLES_4_COLUMN_SORTED")
      DeleteElement(AsciiFile.s())
      Create_Symcode_to_SymSymbol_and_List_of_Symops(Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Selected_Angles_from_CIF.AngCIFStructure())
      Create_Angles_4_Column_Table_Ascii(Selected_Angles_from_CIF.DistCIFStructure(),AsciiFile.s())
      DeleteElement(AsciiFile.s())
      ForEach Ascii_Angles_4_Column_Table.s()
        AddElement(AsciiFile.s())
        AsciiFile.s()=Ascii_Angles_4_Column_Table.s() + #CRLF$
      Next
    ElseIf FindString(AsciiFile.s(),"BONDLENGTHS_4_COLUMN_SORTED") 
      DeleteElement(AsciiFile.s())
      Create_Symcode_to_SymSymbol_and_List_of_Symops(Sorted_Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Sorted_Selected_Angles_from_CIF.AngCIFStructure())
      Create_Bondlengths_4_Column_Table_Ascii(Sorted_Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),AsciiFile.s())
      DeleteElement(AsciiFile.s())
      ForEach Ascii_Bondlengths_4_Column_Table.s()
        AddElement(AsciiFile.s())
        AsciiFile.s()=Ascii_Bondlengths_4_Column_Table.s() + #CRLF$
      Next
    ElseIf FindString(AsciiFile.s(),"BONDANGLES_4_COLUMN_SORTED") 
      DeleteElement(AsciiFile.s())
      Create_Symcode_to_SymSymbol_and_List_of_Symops(Sorted_Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Sorted_Selected_Angles_from_CIF.AngCIFStructure())
      Create_Angles_4_Column_Table_Ascii(Sorted_Selected_Angles_from_CIF.DistCIFStructure(),AsciiFile.s())
      DeleteElement(AsciiFile.s())
      ForEach Ascii_Angles_4_Column_Table.s()
        AddElement(AsciiFile.s())
        AsciiFile.s()=Ascii_Angles_4_Column_Table.s() + #CRLF$
      Next
    ElseIf FindString(AsciiFile.s(),"BONDLENGTHS_AND_ANGLES_FIGURE") And Not FindString(AsciiFile.s(),"BONDLENGTHS_AND_ANGLES_FIGURE_SORTED")
      Create_Symcode_to_SymSymbol_and_List_of_Symops(Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Selected_Angles_from_CIF.AngCIFStructure())
      DeleteElement(AsciiFile.s())
      AsciiFile.s()=ReplaceString(AsciiFile.s(),#CRLF$,"")
      AddElement(AsciiFile.s())
      AsciiFile.s()=Create_Figure_Caption_Ascii(Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Selected_Angles_from_CIF.AngCIFStructure())+Create_SymSatz_Ascii(Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Selected_Angles_from_CIF.AngCIFStructure())
    ElseIf FindString(AsciiFile.s(),"BONDLENGTHS_AND_ANGLES_FIGURE_SORTED") 
      Create_Symcode_to_SymSymbol_and_List_of_Symops(Sorted_Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Sorted_Selected_Angles_from_CIF.AngCIFStructure())
      DeleteElement(AsciiFile.s())
      AsciiFile.s()=ReplaceString(AsciiFile.s(),#CRLF$,"")
      AddElement(AsciiFile.s())
      AsciiFile.s()=Create_Figure_Caption_Ascii(Sorted_Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Selected_Angles_from_CIF.AngCIFStructure())+Create_SymSatz_Ascii(Sorted_Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Sorted_Selected_Angles_from_CIF.AngCIFStructure())
    EndIf
  Next
  
;   ForEach AsciiTable.RawTableStructure()
;     AddElement(AsciiFile.s())
;     For i = 0 To AsciiTable.RawTableStructure()\Number_of_Tableitems+1
;       If AsciiTable.RawTableStructure()\Tableitems[i] <> "END_TBL"
;         AsciiFile.s()=AsciiFile.s()+AsciiTable.RawTableStructure()\Tableitems[i]
;         EndIf
;     Next
;     AsciiFile.s()=AsciiFile.s()+#CRLF$
;   Next
  
  ;maximale anzahl an Zeichen in der ersten Spalte ermitteln
  ForEach AsciiFile.s()
    If FindString(AsciiFile.s(),"TAB")
      If Len(StringField(AsciiFile.s(),1,"TAB")) >  Max_Char_Column.i
        Max_Char_Column.i=Len(StringField(AsciiFile.s(),1,"TAB"))
      EndIf
    ElseIf FindString(AsciiFile.s(),"END_TBL")
      Break
    EndIf
  Next 
  
  ;Tabelle tabulieren
  ForEach AsciiFile.s()
    If FindString(AsciiFile.s(),"TAB")
      Numer_of_Spaces_to_Insert.i = Max_Char_Column.i + 4 - Len(StringField(AsciiFile.s(),1,"TAB")) 
      AsciiFile.s()=ReplaceString(AsciiFile.s(),"TAB",Space(Numer_of_Spaces_to_Insert.i))
    ElseIf FindString(AsciiFile.s(),"END_TBL")
      AsciiFile.s()=RemoveString(AsciiFile.s(),"END_TBL"+#CRLF$)
      Break
    EndIf
  Next
  
  
  ForEach AsciiFile()
   ; If AsciiFile() <> #CRLF$
      Ascii.s=Ascii.s+AsciiFile()
    ;EndIf
    
  Next
  
  ;SetGadgetText(Editor_0, Ascii.s)
  
EndProcedure

Procedure Create_Markdown_Ascii(List RawTable.RawTableStructure())
  
  Protected i.i
  Protected Number_of_Tabs.i
  Protected NewList Markdown_AsciiTable.RawTableStructure()
  Protected Markdown_Ascii.s
  Protected Is_IGNORE_LATEX.b=#True
  Protected Max_Char_Column.i
  Protected Numer_of_Spaces_to_Insert.i
  Protected Is_MARKDOWN_PSEUDO_HEADER.b = #False
  
  CopyList(RawTable.RawTableStructure(),Markdown_AsciiTable.RawTableStructure())
  
  ForEach Markdown_AsciiTable.RawTableStructure() ;von Ascii zu ignorieren
    For i = 1 To Markdown_AsciiTable.RawTableStructure()\Number_of_Tableitems
      If FindString(Markdown_AsciiTable.RawTableStructure()\Tableitems[i],"TEX\") 
        Is_IGNORE_LATEX.b=#True
      EndIf
    Next
    If Is_IGNORE_LATEX.b=#True
      DeleteElement(Markdown_AsciiTable.RawTableStructure())
      Is_IGNORE_LATEX.b=#False
    EndIf
  Next
  
  ForEach Markdown_AsciiTable.RawTableStructure()
    Number_of_Tabs.i=0
    For i = 1 To Markdown_AsciiTable.RawTableStructure()\Number_of_Tableitems
      Markdown_AsciiTable.RawTableStructure()\Tableitems[i]=ReplaceString(Markdown_AsciiTable.RawTableStructure()\Tableitems[i],"TEX_IGNORE","")
      Markdown_AsciiTable.RawTableStructure()\Tableitems[i]=ReplaceString(Markdown_AsciiTable.RawTableStructure()\Tableitems[i],"ASCII\","")
      Markdown_AsciiTable.RawTableStructure()\Tableitems[i]=ReplaceString(Markdown_AsciiTable.RawTableStructure()\Tableitems[i],"FIGURE_CAPTION","")
      Markdown_AsciiTable.RawTableStructure()\Tableitems[i]=ReplaceString(Markdown_AsciiTable.RawTableStructure()\Tableitems[i],"CAPTION","")
      Markdown_AsciiTable.RawTableStructure()\Tableitems[i]=ReplaceString(Markdown_AsciiTable.RawTableStructure()\Tableitems[i],"BLANK",#CRLF$)
      Markdown_AsciiTable.RawTableStructure()\Tableitems[i]=ReplaceString(Markdown_AsciiTable.RawTableStructure()\Tableitems[i],"SPC",Space(1))
      Markdown_AsciiTable.RawTableStructure()\Tableitems[i]=ReplaceString(Markdown_AsciiTable.RawTableStructure()\Tableitems[i],"DEG","°")
      Markdown_AsciiTable.RawTableStructure()\Tableitems[i]=ReplaceString(Markdown_AsciiTable.RawTableStructure()\Tableitems[i],"ANGS","Å")
      Markdown_AsciiTable.RawTableStructure()\Tableitems[i]=ReplaceString(Markdown_AsciiTable.RawTableStructure()\Tableitems[i],"DOT","·")
      Markdown_AsciiTable.RawTableStructure()\Tableitems[i]=ReplaceString(Markdown_AsciiTable.RawTableStructure()\Tableitems[i],"G{a}",Chr(945))
      Markdown_AsciiTable.RawTableStructure()\Tableitems[i]=ReplaceString(Markdown_AsciiTable.RawTableStructure()\Tableitems[i],"G{b}",Chr(946))
      Markdown_AsciiTable.RawTableStructure()\Tableitems[i]=ReplaceString(Markdown_AsciiTable.RawTableStructure()\Tableitems[i],"G{g}",Chr(947))
      Markdown_AsciiTable.RawTableStructure()\Tableitems[i]=ReplaceString(Markdown_AsciiTable.RawTableStructure()\Tableitems[i],"G{r}",Chr(961))
      Markdown_AsciiTable.RawTableStructure()\Tableitems[i]=ReplaceString(Markdown_AsciiTable.RawTableStructure()\Tableitems[i],"G{m}","µ")
      Markdown_AsciiTable.RawTableStructure()\Tableitems[i]=ReplaceString(Markdown_AsciiTable.RawTableStructure()\Tableitems[i],"G{q}",Chr(952))
      Markdown_AsciiTable.RawTableStructure()\Tableitems[i]=ReplaceString(Markdown_AsciiTable.RawTableStructure()\Tableitems[i],"G{s}",Chr(963))
      Markdown_AsciiTable.RawTableStructure()\Tableitems[i]=ReplaceString(Markdown_AsciiTable.RawTableStructure()\Tableitems[i],"data_",Name_of_Structure.s)
      Markdown_AsciiTable.RawTableStructure()\Tableitems[i]=ReplaceString(Markdown_AsciiTable.RawTableStructure()\Tableitems[i],"HKLRNG",HKL_entry_Ascii())
      Markdown_AsciiTable.RawTableStructure()\Tableitems[i]=ReplaceString(Markdown_AsciiTable.RawTableStructure()\Tableitems[i],"SPACE_GROUP",SPG_Dict_Markdown_Ascii(CifItem("_space_group_name_H-M_alt")))
      
      If FindString(Markdown_AsciiTable.RawTableStructure()\Tableitems[i],"SYM_OPS") And Not FindString(Markdown_AsciiTable.RawTableStructure()\Tableitems[i],"SYM_OPS_SORTED")
        Create_Symcode_to_SymSymbol_and_List_of_Symops(Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Selected_Angles_from_CIF.AngCIFStructure())
        Markdown_AsciiTable.RawTableStructure()\Tableitems[i]=ReplaceString(Markdown_AsciiTable.RawTableStructure()\Tableitems[i],"SYM_OPS",Create_SymSatz_Markdown_Ascii(Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Selected_Angles_from_CIF.AngCIFStructure())) 
      EndIf
      
       If FindString(Markdown_AsciiTable.RawTableStructure()\Tableitems[i],"SYM_OPS_SORTED") 
        Create_Symcode_to_SymSymbol_and_List_of_Symops(Sorted_Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Sorted_Selected_Angles_from_CIF.AngCIFStructure())
        Markdown_AsciiTable.RawTableStructure()\Tableitems[i]=ReplaceString(Markdown_AsciiTable.RawTableStructure()\Tableitems[i],"SYM_OPS_SORTED",Create_SymSatz_Markdown_Ascii(Sorted_Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Sorted_Selected_Angles_from_CIF.AngCIFStructure())) 
      EndIf
      
      If FindString(Markdown_AsciiTable.RawTableStructure()\Tableitems[i],"FORMULA_SUM")
        ForEach Sum_Formula.Summenformel()
          Markdown_AsciiTable.RawTableStructure()\Tableitems[i]=Markdown_AsciiTable.RawTableStructure()\Tableitems[i] + Sum_Formula.Summenformel()\Elemente
          If Sum_Formula.Summenformel()\Anzahl <> ""
            Markdown_AsciiTable.RawTableStructure()\Tableitems[i]=Markdown_AsciiTable.RawTableStructure()\Tableitems[i] + "~" + Sum_Formula.Summenformel()\Anzahl +"~"
          EndIf
        Next
        Markdown_AsciiTable.RawTableStructure()\Tableitems[i]=ReplaceString(Markdown_AsciiTable.RawTableStructure()\Tableitems[i],"FORMULA_SUM","")
      EndIf
      
      If FindString(Markdown_AsciiTable.RawTableStructure()\Tableitems[i],"FORMULA_MOIETY")
        ForEach Moiety_Formula.Moietyformel()
          Markdown_AsciiTable.RawTableStructure()\Tableitems[i]=Markdown_AsciiTable.RawTableStructure()\Tableitems[i] + Moiety_Formula.Moietyformel()\Aufklammer + Moiety_Formula.Moietyformel()\Elemente ;+ Moiety_Formula.Moietyformel()\Anzahl + " " + Moiety_Formula.Moietyformel()\Ladung + Moiety_Formula.Moietyformel()\Trennung
          If Moiety_Formula.Moietyformel()\Anzahl <> ""
            Markdown_AsciiTable.RawTableStructure()\Tableitems[i]=Markdown_AsciiTable.RawTableStructure()\Tableitems[i] + "~" + Moiety_Formula.Moietyformel()\Anzahl + "~"
          EndIf
          If Moiety_Formula.Moietyformel()\Ladung <> ""
            Markdown_AsciiTable.RawTableStructure()\Tableitems[i]=Markdown_AsciiTable.RawTableStructure()\Tableitems[i] + "^" + Moiety_Formula.Moietyformel()\Ladung + "^"
          EndIf
          If Moiety_Formula.Moietyformel()\Zuklammer <> ""
            Markdown_AsciiTable.RawTableStructure()\Tableitems[i]=Markdown_AsciiTable.RawTableStructure()\Tableitems[i] + Moiety_Formula.Moietyformel()\Zuklammer
          EndIf
          If Moiety_Formula.Moietyformel()\Trennung <> ""
            Markdown_AsciiTable.RawTableStructure()\Tableitems[i]=Markdown_AsciiTable.RawTableStructure()\Tableitems[i] + Moiety_Formula.Moietyformel()\Trennung
          EndIf
        Next
        Markdown_AsciiTable.RawTableStructure()\Tableitems[i]=ReplaceString(Markdown_AsciiTable.RawTableStructure()\Tableitems[i],"FORMULA_MOIETY","")
      EndIf      
      
       If FindString(Markdown_AsciiTable.RawTableStructure()\Tableitems[i],"B{")
        If CreateRegularExpression(0, "B{(.*?)}")
          If ExamineRegularExpression(0,Markdown_AsciiTable.RawTableStructure()\Tableitems[i])
            While NextRegularExpressionMatch(0)
              Markdown_AsciiTable.RawTableStructure()\Tableitems[i]=ReplaceString(Markdown_AsciiTable.RawTableStructure()\Tableitems[i],RegularExpressionMatchString(0),"**"+RegularExpressionGroup(0, 1)+"**")
            Wend
          EndIf
        Else
          PrintN("Error! " + RegularExpressionError())
        EndIf
        FreeRegularExpression(0)
      EndIf
      If FindString(Markdown_AsciiTable.RawTableStructure()\Tableitems[i],"I{")
        If CreateRegularExpression(0, "I{(.*?)}")
          If ExamineRegularExpression(0,Markdown_AsciiTable.RawTableStructure()\Tableitems[i])
            While NextRegularExpressionMatch(0)
              Markdown_AsciiTable.RawTableStructure()\Tableitems[i]=ReplaceString(Markdown_AsciiTable.RawTableStructure()\Tableitems[i],RegularExpressionMatchString(0),"*"+RegularExpressionGroup(0, 1)+"*")
            Wend
          EndIf
        Else
          PrintN("Error! " + RegularExpressionError())
        EndIf
        FreeRegularExpression(0)
      EndIf
      If FindString(Markdown_AsciiTable.RawTableStructure()\Tableitems[i],"^{")
        If CreateRegularExpression(0, "\^{(.*?)}")
          If ExamineRegularExpression(0,Markdown_AsciiTable.RawTableStructure()\Tableitems[i])
            While NextRegularExpressionMatch(0)
              Markdown_AsciiTable.RawTableStructure()\Tableitems[i]=ReplaceString(Markdown_AsciiTable.RawTableStructure()\Tableitems[i],RegularExpressionMatchString(0),"^"+RegularExpressionGroup(0, 1)+"^")
            Wend
          EndIf
        Else
          PrintN("Error! " + RegularExpressionError())
        EndIf
        FreeRegularExpression(0)
      EndIf
      If FindString(Markdown_AsciiTable.RawTableStructure()\Tableitems[i],"_{")
        If CreateRegularExpression(0, "_{(.*?)}")
          If ExamineRegularExpression(0,Markdown_AsciiTable.RawTableStructure()\Tableitems[i])
            While NextRegularExpressionMatch(0)
              Markdown_AsciiTable.RawTableStructure()\Tableitems[i]=ReplaceString(Markdown_AsciiTable.RawTableStructure()\Tableitems[i],RegularExpressionMatchString(0),"~"+RegularExpressionGroup(0, 1)+"~")
            Wend
          EndIf
        Else
          PrintN("Error! " + RegularExpressionError())
        EndIf
        FreeRegularExpression(0)
      EndIf
    Next
  Next
  
  ForEach Markdown_AsciiTable.RawTableStructure()
    AddElement(Markdown_AsciiFile.s())
    For i = 0 To Markdown_AsciiTable.RawTableStructure()\Number_of_Tableitems+1
      Markdown_AsciiFile.s()=Markdown_AsciiFile.s()+Markdown_AsciiTable.RawTableStructure()\Tableitems[i]
    Next
    If Markdown_AsciiFile.s() <> #CRLF$ 
      Markdown_AsciiFile.s()=Markdown_AsciiFile.s()+#CRLF$
    Else
      Markdown_AsciiFile.s()=Markdown_AsciiFile.s()
    EndIf   
  Next
  
  ForEach Markdown_AsciiFile.s()
    If FindString(Markdown_AsciiFile.s(),"BONDLENGTHS_2_COLUMN") And Not FindString(Markdown_AsciiFile.s(),"BONDLENGTHS_2_COLUMN_SORTED")
      DeleteElement(Markdown_AsciiFile.s())
      Create_Symcode_to_SymSymbol_and_List_of_Symops(Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Selected_Angles_from_CIF.AngCIFStructure())
      Create_Bondlengths_2_Column_Table_Markdown_Ascii(Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Markdown_AsciiFile.s())
      DeleteElement(Markdown_AsciiFile.s())
      ForEach Markdown_Ascii_Bondlengths_2_Column_Table.s()
        AddElement(Markdown_AsciiFile.s())
        Markdown_AsciiFile.s()=Markdown_Ascii_Bondlengths_2_Column_Table.s() + #CRLF$
      Next
    ElseIf FindString(Markdown_AsciiFile.s(),"BONDLENGTHS_4_COLUMN") And Not FindString(Markdown_AsciiFile.s(),"BONDLENGTHS_4_COLUMN_SORTED")
      DeleteElement(Markdown_AsciiFile.s())
      Create_Symcode_to_SymSymbol_and_List_of_Symops(Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Selected_Angles_from_CIF.AngCIFStructure())
      Create_Bondlengths_4_Column_Table_Markdown_Ascii(Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Markdown_AsciiFile.s())
      DeleteElement(Markdown_AsciiFile.s())
      ForEach Markdown_Ascii_Bondlengths_4_Column_Table.s()
        AddElement(Markdown_AsciiFile.s())
        Markdown_AsciiFile.s()=Markdown_Ascii_Bondlengths_4_Column_Table.s() + #CRLF$
      Next
    ElseIf FindString(Markdown_AsciiFile.s(),"BONDANGLES_2_COLUMN") And Not FindString(Markdown_AsciiFile.s(),"BONDANGLES_2_COLUMN_SORTED")
      DeleteElement(Markdown_AsciiFile.s())
      Create_Symcode_to_SymSymbol_and_List_of_Symops(Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Selected_Angles_from_CIF.AngCIFStructure())
      Create_Angles_2_Column_Table_Markdown_Ascii(Selected_Angles_from_CIF.DistCIFStructure(),Markdown_AsciiFile.s())
      DeleteElement(Markdown_AsciiFile.s())
      ForEach Markdown_Ascii_Angles_2_Column_Table.s()
        AddElement(Markdown_AsciiFile.s())
        Markdown_AsciiFile.s()=Markdown_Ascii_Angles_2_Column_Table.s() + #CRLF$
      Next
    ElseIf FindString(Markdown_AsciiFile.s(),"BONDANGLES_4_COLUMN") And Not FindString(Markdown_AsciiFile.s(),"BONDANGLES_4_COLUMN_SORTED")
      DeleteElement(Markdown_AsciiFile.s())
      Create_Symcode_to_SymSymbol_and_List_of_Symops(Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Selected_Angles_from_CIF.AngCIFStructure())
      Create_Angles_4_Column_Table_Markdown_Ascii(Selected_Angles_from_CIF.DistCIFStructure(),Markdown_AsciiFile.s())
      DeleteElement(Markdown_AsciiFile.s())
      ForEach Markdown_Ascii_Angles_4_Column_Table.s()
        AddElement(Markdown_AsciiFile.s())
        Markdown_AsciiFile.s()=Markdown_Ascii_Angles_4_Column_Table.s() + #CRLF$
      Next
    ElseIf FindString(Markdown_AsciiFile.s(),"BONDLENGTHS_2_COLUMN_SORTED") 
      DeleteElement(Markdown_AsciiFile.s())
      Create_Symcode_to_SymSymbol_and_List_of_Symops(Sorted_Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Sorted_Selected_Angles_from_CIF.AngCIFStructure())
      Create_Bondlengths_2_Column_Table_Markdown_Ascii(Sorted_Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Markdown_AsciiFile.s())
      DeleteElement(Markdown_AsciiFile.s())
      ForEach Markdown_Ascii_Bondlengths_2_Column_Table.s()
        AddElement(Markdown_AsciiFile.s())
        Markdown_AsciiFile.s()=Markdown_Ascii_Bondlengths_2_Column_Table.s() + #CRLF$
      Next
    ElseIf FindString(Markdown_AsciiFile.s(),"BONDLENGTHS_4_COLUMN_SORTED") 
      DeleteElement(Markdown_AsciiFile.s())
      Create_Symcode_to_SymSymbol_and_List_of_Symops(Sorted_Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Sorted_Selected_Angles_from_CIF.AngCIFStructure())
      Create_Bondlengths_4_Column_Table_Markdown_Ascii(Sorted_Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Markdown_AsciiFile.s())
      DeleteElement(Markdown_AsciiFile.s())
      ForEach Markdown_Ascii_Bondlengths_4_Column_Table.s()
        AddElement(Markdown_AsciiFile.s())
        Markdown_AsciiFile.s()=Markdown_Ascii_Bondlengths_4_Column_Table.s() + #CRLF$
      Next
    ElseIf FindString(Markdown_AsciiFile.s(),"BONDANGLES_2_COLUMN_SORTED") 
      DeleteElement(Markdown_AsciiFile.s())
      Create_Symcode_to_SymSymbol_and_List_of_Symops(Sorted_Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Sorted_Selected_Angles_from_CIF.AngCIFStructure())
      Create_Angles_2_Column_Table_Markdown_Ascii(Sorted_Selected_Angles_from_CIF.DistCIFStructure(),Markdown_AsciiFile.s())
      DeleteElement(Markdown_AsciiFile.s())
      ForEach Markdown_Ascii_Angles_2_Column_Table.s()
        AddElement(Markdown_AsciiFile.s())
        Markdown_AsciiFile.s()=Markdown_Ascii_Angles_2_Column_Table.s() + #CRLF$
      Next
    ElseIf FindString(Markdown_AsciiFile.s(),"BONDANGLES_4_COLUMN_SORTED") 
      DeleteElement(Markdown_AsciiFile.s())
      Create_Symcode_to_SymSymbol_and_List_of_Symops(Sorted_Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Sorted_Selected_Angles_from_CIF.AngCIFStructure())
      Create_Angles_4_Column_Table_Markdown_Ascii(Sorted_Selected_Angles_from_CIF.DistCIFStructure(),Markdown_AsciiFile.s())
      DeleteElement(Markdown_AsciiFile.s())
      ForEach Markdown_Ascii_Angles_4_Column_Table.s()
        AddElement(Markdown_AsciiFile.s())
        Markdown_AsciiFile.s()=Markdown_Ascii_Angles_4_Column_Table.s() + #CRLF$
      Next
    ElseIf FindString(Markdown_AsciiFile.s(),"BONDLENGTHS_AND_ANGLES_FIGURE") And Not FindString(Markdown_AsciiFile.s(),"BONDLENGTHS_AND_ANGLES_FIGURE_SORTED")
      Create_Symcode_to_SymSymbol_and_List_of_Symops(Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Selected_Angles_from_CIF.AngCIFStructure())
      DeleteElement(Markdown_AsciiFile.s())
      Markdown_AsciiFile.s()=ReplaceString(Markdown_AsciiFile.s(),#CRLF$,"")
      AddElement(Markdown_AsciiFile.s())
      Markdown_AsciiFile.s()=Create_Figure_Caption_Markdown_Ascii(Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Selected_Angles_from_CIF.AngCIFStructure())+Create_SymSatz_Markdown_Ascii(Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Selected_Angles_from_CIF.AngCIFStructure())
    ElseIf FindString(Markdown_AsciiFile.s(),"BONDLENGTHS_AND_ANGLES_FIGURE_SORTED") 
      Create_Symcode_to_SymSymbol_and_List_of_Symops(Sorted_Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Sorted_Selected_Angles_from_CIF.AngCIFStructure())
      DeleteElement(Markdown_AsciiFile.s())
      Markdown_AsciiFile.s()=ReplaceString(Markdown_AsciiFile.s(),#CRLF$,"")
      AddElement(Markdown_AsciiFile.s())
      Markdown_AsciiFile.s()=Create_Figure_Caption_Markdown_Ascii(Sorted_Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Selected_Angles_from_CIF.AngCIFStructure())+Create_SymSatz_Markdown_Ascii(Sorted_Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Sorted_Selected_Angles_from_CIF.AngCIFStructure())
    EndIf
  Next
  
  
  ;Fuer erste Tabelle, damit sie als Tabelle in Markdown dargestellt wird (da kein Header)
  ForEach Markdown_AsciiFile.s()
    If FindString(Markdown_AsciiFile.s(),"TAB")
      PushListPosition(Markdown_AsciiFile.s())
      Break
    EndIf
  Next 
  PopListPosition(Markdown_AsciiFile.s())
  InsertElement(Markdown_AsciiFile.s())
  Markdown_AsciiFile.s()=#CRLF$
  AddElement(Markdown_AsciiFile.s())
  Markdown_AsciiFile.s()="[]() TAB []()" + #CRLF$
  AddElement(Markdown_AsciiFile.s())
  Markdown_AsciiFile.s()="----TAB-------------------------------" + #CRLF$
;    

  ForEach Markdown_AsciiFile.s()
    If FindString(Markdown_AsciiFile.s(),"TAB")
      If Len(StringField(Markdown_AsciiFile.s(),1,"TAB")) >  Max_Char_Column.i
        Max_Char_Column.i=Len(StringField(Markdown_AsciiFile.s(),1,"TAB"))
      EndIf
    ElseIf FindString(Markdown_AsciiFile.s(),"END_TBL")
      Break
    EndIf
  Next 
  
  ;Tabelle tabulieren
  ForEach Markdown_AsciiFile.s()
    If FindString(Markdown_AsciiFile.s(),"TAB")
      Numer_of_Spaces_to_Insert.i = Max_Char_Column.i + 4 - Len(StringField(Markdown_AsciiFile.s(),1,"TAB")) 
      Markdown_AsciiFile.s()=ReplaceString(Markdown_AsciiFile.s(),"TAB",Space(Numer_of_Spaces_to_Insert.i-3)+"|"+Space(1))
    ElseIf FindString(Markdown_AsciiFile.s(),"END_TBL")
      Markdown_AsciiFile.s()=RemoveString(Markdown_AsciiFile.s(),"END_TBL"+#CRLF$)
      Break
    EndIf
  Next
  
  ForEach Markdown_AsciiFile.s()
    If FindString(Markdown_AsciiFile.s(),"---")
      Markdown_AsciiFile.s()=ReplaceString(Markdown_AsciiFile.s()," ","-") 
      Break
    EndIf
  Next
  
  
  ForEach Markdown_AsciiFile.s()
   ; If AsciiFile() <> #CRLF$
      Markdown_Ascii.s=Markdown_Ascii.s+Markdown_AsciiFile.s()
    ;EndIf
  Next
  
  ;SetGadgetText(Editor_0, Markdown_Ascii.s)
  
EndProcedure


Procedure Create_Symcode_to_SymSymbol_and_List_of_Symops(List Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),List Selected_Angles_from_CIF.AngCIFStructure())
  
  ClearMap(SymCode_to_SymSymbol.s())
  ClearList(List_of_SymOps.s())
  
;   ForEach Selected_Bond_Lenghts_from_CIF.DistCIFStructure()
;     Debug Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\Alles
;   Next
;   Debug"=================="
  
  
  ;Symops 2_456 etc. werden zu Symbolen ' '' ''' etc. umgesetzt
  
  Protected Entry_Sym_in_List_of_Sympos.s
  Protected SymopSymbol.s
  
  ForEach Selected_Bond_Lenghts_from_CIF.DistCIFStructure()
    If ListSize(Selected_Bond_Lenghts_from_CIF.DistCIFStructure())
      AddElement(List_of_SymOps.s())
      List_of_SymOps.s()=Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\Symmetrie1
      AddElement(List_of_SymOps.s())
      List_of_SymOps.s()=Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\Symmetrie2
    EndIf
  Next
  
  ForEach Selected_Angles_from_CIF.AngCIFStructure()
    If ListSize(Selected_Angles_from_CIF.AngCIFStructure())
      AddElement(List_of_SymOps.s())
      List_of_SymOps.s()=Selected_Angles_from_CIF.AngCIFStructure()\Symmetrie1
      AddElement(List_of_SymOps.s())
      List_of_SymOps.s()=Selected_Angles_from_CIF.AngCIFStructure()\Symmetrie2
      AddElement(List_of_SymOps.s())
      List_of_SymOps.s()=Selected_Angles_from_CIF.AngCIFStructure()\Symmetrie3
    EndIf
  Next
  
  ForEach List_of_SymOps.s()
    If List_of_SymOps.s()="" Or List_of_SymOps.s()=" " Or List_of_SymOps.s()="."
      DeleteElement(List_of_SymOps.s())
    EndIf
  Next
  
  ForEach List_of_SymOps.s()             ;loescht doppelte Eintraege in SymOpListe
    Entry_Sym_in_List_of_Sympos.s = List_of_SymOps.s()
    PushListPosition(List_of_SymOps.s())
    While NextElement(List_of_SymOps.s())
      If List_of_SymOps.s() = Entry_Sym_in_List_of_Sympos.s 
        DeleteElement(List_of_SymOps.s())
      EndIf
    Wend
    PopListPosition(List_of_SymOps.s())
  Next
  
  Restore SymSymbols
  ForEach List_of_SymOps.s()
    Read.s SymopSymbol.s
    SymCode_to_SymSymbol.s(List_of_SymOps.s())=SymopSymbol.s
  Next
  
EndProcedure

Procedure.s Create_SymSatz_LaTeX(List Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),List Selected_Angles_from_CIF.AngCIFStructure())
  
  Protected SymCodeSatz.s 
  Protected SymOpNummer_in_CIF.i
  Protected SymOpCode_in_CIF.s
  Protected CurrentSymOp.s
  
  ForEach Selected_Bond_Lenghts_from_CIF.DistCIFStructure()
    Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\SymmetrieSymbol1=SymCode_to_SymSymbol.s(Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\Symmetrie1)
    Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\SymmetrieSymbol2=SymCode_to_SymSymbol.s(Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\Symmetrie2)
  Next
  
  ForEach Selected_Angles_from_CIF.AngCIFStructure()
    Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol1=SymCode_to_SymSymbol.s(Selected_Angles_from_CIF.AngCIFStructure()\Symmetrie1)
    Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol2=SymCode_to_SymSymbol.s(Selected_Angles_from_CIF.AngCIFStructure()\Symmetrie2)
    Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol3=SymCode_to_SymSymbol.s(Selected_Angles_from_CIF.AngCIFStructure()\Symmetrie3)
  Next
  
  ;SymmetrieOP Satz erstellen
  
  Select ListSize(List_of_SymOps.s())
    Case 0
      ;ffff
    Case 1
      ForEach List_of_SymOps.s()
        SymOpNummer_in_CIF.i=Val(StringField(List_of_SymOps.s(),1,"_"))-1
        SymOpCode_in_CIF.s=StringField(List_of_SymOps.s(),2,"_")
        SelectElement(Sym_Ops_from_CIF.s(),SymOpNummer_in_CIF.i)
        CurrentSymOp.s=Sym_Ops_from_CIF.s()
        SymCodeSatz.s  = "(" + "$" + SymCode_to_SymSymbol.s(List_of_SymOps.s()) + "$" + ")" + " " + "$" + Symcode_to_String(CurrentSymOp.s,SymOpCode_in_CIF.s) + "$"
      Next 
      Symsatz_Latex.s = "Symmetry transformation used to generate equivalent atoms: " + SymCodeSatz.s + "." 
    Default
      ForEach List_of_SymOps.s()
        SymOpNummer_in_CIF.i=Val(StringField(List_of_SymOps.s(),1,"_"))-1
        SymOpCode_in_CIF.s=StringField(List_of_SymOps.s(),2,"_")
        SelectElement(Sym_Ops_from_CIF.s(),SymOpNummer_in_CIF.i)
        CurrentSymOp.s=Sym_Ops_from_CIF.s()
        SymCodeSatz.s = SymCodeSatz.s + "(" + "$" + SymCode_to_SymSymbol.s(List_of_SymOps.s()) + "$" + ")" + " " + "$" +  Symcode_to_String(CurrentSymOp.s,SymOpCode_in_CIF.s) + "$" + "; "
      Next 
      SymCodeSatz.s = Trim(SymCodeSatz.s)
      SymCodeSatz.s = RTrim(SymCodeSatz.s,";")
      SymCodeSatz.s = ReplaceString(SymCodeSatz.s,"($(","($")
      SymCodeSatz.s = ReplaceString(SymCodeSatz.s,")$)","$)")
      Symsatz_Latex.s= "Symmetry transformations used to generate equivalent atoms: " + SymCodeSatz.s + "."
  EndSelect
  
  ProcedureReturn Symsatz_Latex.s
  
EndProcedure

Procedure.s Create_SymSatz_RTF(List Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),List Selected_Angles_from_CIF.AngCIFStructure())
  
  Protected SymCodeSatz.s 
  Protected SymOpNummer_in_CIF.i
  Protected SymOpCode_in_CIF.s
  Protected CurrentSymOp.s
  
  ForEach Selected_Bond_Lenghts_from_CIF.DistCIFStructure()
    Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\SymmetrieSymbol1=SymCode_to_SymSymbol.s(Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\Symmetrie1)
    Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\SymmetrieSymbol2=SymCode_to_SymSymbol.s(Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\Symmetrie2)
  Next
  
  ForEach Selected_Angles_from_CIF.AngCIFStructure()
    Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol1=SymCode_to_SymSymbol.s(Selected_Angles_from_CIF.AngCIFStructure()\Symmetrie1)
    Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol2=SymCode_to_SymSymbol.s(Selected_Angles_from_CIF.AngCIFStructure()\Symmetrie2)
    Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol3=SymCode_to_SymSymbol.s(Selected_Angles_from_CIF.AngCIFStructure()\Symmetrie3)
  Next
  
  Symsatz_RTF.s="{\pard \f0\fs24 " 
  
  Select ListSize(List_of_SymOps.s())
    Case 0
      Symsatz_RTF.s=Symsatz_RTF.s ;+ #LeerzeileRTF
    Case 1
      ForEach List_of_SymOps.s()
        SymOpNummer_in_CIF.i=Val(StringField(List_of_SymOps.s(),1,"_"))-1
        SymOpCode_in_CIF.s=StringField(List_of_SymOps.s(),2,"_")
        SelectElement(Sym_Ops_from_CIF.s(),SymOpNummer_in_CIF.i)
        CurrentSymOp.s=Sym_Ops_from_CIF.s()
        SymCodeSatz.s = "(" + SymCode_to_SymSymbol.s(List_of_SymOps.s()) + ")" + " " + Symcode_to_String(CurrentSymOp.s,SymOpCode_in_CIF.s)
      Next 
      SymCodeSatz.s = ReplaceString(SymCodeSatz.s,"x","{\i x}")
      SymCodeSatz.s = ReplaceString(SymCodeSatz.s,"y","{\i y}")
      SymCodeSatz.s = ReplaceString(SymCodeSatz.s,"z","{\i z}")
      Symsatz_RTF.s=Symsatz_RTF.s + "Symmetry transformation used to generate equivalent atoms: " + SymCodeSatz.s + "."; + "\par}"
    Default
      ForEach List_of_SymOps.s()
        SymOpNummer_in_CIF.i=Val(StringField(List_of_SymOps.s(),1,"_"))-1
        SymOpCode_in_CIF.s=StringField(List_of_SymOps.s(),2,"_")
        SelectElement(Sym_Ops_from_CIF.s(),SymOpNummer_in_CIF.i)
        CurrentSymOp.s=Sym_Ops_from_CIF.s()
        SymCodeSatz.s = SymCodeSatz.s + "(" + SymCode_to_SymSymbol.s(List_of_SymOps.s()) + ")" + " " + Symcode_to_String(CurrentSymOp.s,SymOpCode_in_CIF.s) +"; "
      Next 
      SymCodeSatz.s = ReplaceString(SymCodeSatz.s,"x","{\i x}")
      SymCodeSatz.s = ReplaceString(SymCodeSatz.s,"y","{\i y}")
      SymCodeSatz.s = ReplaceString(SymCodeSatz.s,"z","{\i z}")
      SymCodeSatz.s = Trim(SymCodeSatz.s)
      SymCodeSatz.s = RTrim(SymCodeSatz.s,";")
      SymCodeSatz.s = ReplaceString(SymCodeSatz.s,"((","(")
      SymCodeSatz.s = ReplaceString(SymCodeSatz.s,"))",")")
      Symsatz_RTF.s=Symsatz_RTF.s + "Symmetry transformations used to generate equivalent atoms: " + SymCodeSatz.s + "." 
  EndSelect
  
  Symsatz_RTF.s=Symsatz_RTF.s+ "\par}"
  
  ProcedureReturn Symsatz_RTF.s
  
EndProcedure

Procedure.s Create_SymSatz_Ascii(List Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),List Selected_Angles_from_CIF.AngCIFStructure())
  
  Protected SymCodeSatz.s 
  Protected SymOpNummer_in_CIF.i
  Protected SymOpCode_in_CIF.s
  Protected CurrentSymOp.s
  
  ForEach Selected_Bond_Lenghts_from_CIF.DistCIFStructure()
    Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\SymmetrieSymbol1=SymCode_to_SymSymbol.s(Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\Symmetrie1)
    Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\SymmetrieSymbol2=SymCode_to_SymSymbol.s(Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\Symmetrie2)
  Next
  
  ForEach Selected_Angles_from_CIF.AngCIFStructure()
    Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol1=SymCode_to_SymSymbol.s(Selected_Angles_from_CIF.AngCIFStructure()\Symmetrie1)
    Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol2=SymCode_to_SymSymbol.s(Selected_Angles_from_CIF.AngCIFStructure()\Symmetrie2)
    Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol3=SymCode_to_SymSymbol.s(Selected_Angles_from_CIF.AngCIFStructure()\Symmetrie3)
  Next
  
  ;SymmetrieOP Satz erstellen
  
  Select ListSize(List_of_SymOps.s())
    Case 0
      ;ffff
    Case 1
      ForEach List_of_SymOps.s()
        SymOpNummer_in_CIF.i=Val(StringField(List_of_SymOps.s(),1,"_"))-1
        SymOpCode_in_CIF.s=StringField(List_of_SymOps.s(),2,"_")
        SelectElement(Sym_Ops_from_CIF.s(),SymOpNummer_in_CIF.i)
        CurrentSymOp.s=Sym_Ops_from_CIF.s()
        SymCodeSatz.s  = "(" + SymCode_to_SymSymbol.s(List_of_SymOps.s()) + ")" + " " + Symcode_to_String(CurrentSymOp.s,SymOpCode_in_CIF.s) 
      Next 
      Symsatz_Ascii.s = "Symmetry transformation used to generate equivalent atoms: " + SymCodeSatz.s + "." 
    Default
      ForEach List_of_SymOps.s()
        SymOpNummer_in_CIF.i=Val(StringField(List_of_SymOps.s(),1,"_"))-1
        SymOpCode_in_CIF.s=StringField(List_of_SymOps.s(),2,"_")
        SelectElement(Sym_Ops_from_CIF.s(),SymOpNummer_in_CIF.i)
        CurrentSymOp.s=Sym_Ops_from_CIF.s()
        SymCodeSatz.s = SymCodeSatz.s + "(" + SymCode_to_SymSymbol.s(List_of_SymOps.s()) + ")" + " " +  Symcode_to_String(CurrentSymOp.s,SymOpCode_in_CIF.s) + "; "
      Next 
      SymCodeSatz.s = Trim(SymCodeSatz.s)
      SymCodeSatz.s = RTrim(SymCodeSatz.s,";")
      SymCodeSatz.s = ReplaceString(SymCodeSatz.s,"((","(")
      SymCodeSatz.s = ReplaceString(SymCodeSatz.s,"))",")")
      Symsatz_Ascii.s= "Symmetry transformations used to generate equivalent atoms: " + SymCodeSatz.s + "."
  EndSelect
  
  ProcedureReturn Symsatz_Ascii.s
  
EndProcedure

Procedure.s Create_SymSatz_Markdown_Ascii(List Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),List Selected_Angles_from_CIF.AngCIFStructure())
  
  Protected SymCodeSatz.s 
  Protected SymOpNummer_in_CIF.i
  Protected SymOpCode_in_CIF.s
  Protected CurrentSymOp.s
  
  ForEach Selected_Bond_Lenghts_from_CIF.DistCIFStructure()
    Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\SymmetrieSymbol1=SymCode_to_SymSymbol.s(Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\Symmetrie1)
    Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\SymmetrieSymbol2=SymCode_to_SymSymbol.s(Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\Symmetrie2)
  Next
  
  ForEach Selected_Angles_from_CIF.AngCIFStructure()
    Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol1=SymCode_to_SymSymbol.s(Selected_Angles_from_CIF.AngCIFStructure()\Symmetrie1)
    Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol2=SymCode_to_SymSymbol.s(Selected_Angles_from_CIF.AngCIFStructure()\Symmetrie2)
    Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol3=SymCode_to_SymSymbol.s(Selected_Angles_from_CIF.AngCIFStructure()\Symmetrie3)
  Next
  
  Select ListSize(List_of_SymOps.s())
    Case 0
      ;fff
    Case 1
      ForEach List_of_SymOps.s()
        SymOpNummer_in_CIF.i=Val(StringField(List_of_SymOps.s(),1,"_"))-1
        SymOpCode_in_CIF.s=StringField(List_of_SymOps.s(),2,"_")
        SelectElement(Sym_Ops_from_CIF.s(),SymOpNummer_in_CIF.i)
        CurrentSymOp.s=Sym_Ops_from_CIF.s()
        SymCodeSatz.s = "(" + SymCode_to_SymSymbol.s(List_of_SymOps.s()) + ")" + " " + Symcode_to_String(CurrentSymOp.s,SymOpCode_in_CIF.s)
      Next 
      SymCodeSatz.s = ReplaceString(SymCodeSatz.s,"x","*x*")
      SymCodeSatz.s = ReplaceString(SymCodeSatz.s,"y","*y*")
      SymCodeSatz.s = ReplaceString(SymCodeSatz.s,"z","*z*")
      SymSatz_Markdown_Ascii.s=SymSatz_Markdown_Ascii.s + "Symmetry transformation used to generate equivalent atoms: " + SymCodeSatz.s + "."
    Default
      ForEach List_of_SymOps.s()
        SymOpNummer_in_CIF.i=Val(StringField(List_of_SymOps.s(),1,"_"))-1
        SymOpCode_in_CIF.s=StringField(List_of_SymOps.s(),2,"_")
        SelectElement(Sym_Ops_from_CIF.s(),SymOpNummer_in_CIF.i)
        CurrentSymOp.s=Sym_Ops_from_CIF.s()
        SymCodeSatz.s = SymCodeSatz.s + "(" + SymCode_to_SymSymbol.s(List_of_SymOps.s()) + ")" + " " + Symcode_to_String(CurrentSymOp.s,SymOpCode_in_CIF.s) +"; "
      Next 
      SymCodeSatz.s = ReplaceString(SymCodeSatz.s,"x","*x*")
      SymCodeSatz.s = ReplaceString(SymCodeSatz.s,"y","*y*")
      SymCodeSatz.s = ReplaceString(SymCodeSatz.s,"z","*z*")
      SymCodeSatz.s = Trim(SymCodeSatz.s)
      SymCodeSatz.s = RTrim(SymCodeSatz.s,";")
      SymCodeSatz.s = ReplaceString(SymCodeSatz.s,"((","(")
      SymCodeSatz.s = ReplaceString(SymCodeSatz.s,"))",")")
      SymSatz_Markdown_Ascii.s=SymSatz_Markdown_Ascii.s + "Symmetry transformations used to generate equivalent atoms: " + SymCodeSatz.s + "." 
  EndSelect
  
  ProcedureReturn SymSatz_Markdown_Ascii.s
  
EndProcedure

Procedure Create_Bondlengths_2_Column_Table_RTF(List Selected_Bond_Lenghts_from_CIF.DistCIFStructure())
  
  #LeerzeileRTF="{\pard\plain \f0\fs24 \par}"
  #TR1="{\trowd\trgaph108\trql\cellx3600\cellx7200\pard\intbl \f0\fs24 "
  #TR2="\cell\pard\intbl \f0\fs24 " 
  #TR3="\cell\row}"

  ClearList(RTF_Bondlengths_2_Column_Table.s())
  
  ForEach Selected_Bond_Lenghts_from_CIF.DistCIFStructure()
    Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\SymmetrieSymbol1=SymCode_to_SymSymbol.s(Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\Symmetrie1)
    Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\SymmetrieSymbol2=SymCode_to_SymSymbol.s(Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\Symmetrie2)
  Next
  
  ;Tabelle erzeugen
  
  ForEach Selected_Bond_Lenghts_from_CIF.DistCIFStructure()
    If ListSize(Selected_Bond_Lenghts_from_CIF.DistCIFStructure())
      AddElement(RTF_Bondlengths_2_Column_Table.s())
      RTF_Bondlengths_2_Column_Table.s() = #TR1 + Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\Atom1 + Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\SymmetrieSymbol1 + "-" + Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\Atom2 + Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\SymmetrieSymbol2 + #TR2 + Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\Abstand + #TR3
    EndIf
  Next
  
EndProcedure

Procedure Create_Bondlengths_2_Column_Table_LaTex(List Selected_Bond_Lenghts_from_CIF.DistCIFStructure())
  
  ClearList(LaTeX_Bondlengths_2_Column_Table.s())
  
  ForEach Selected_Bond_Lenghts_from_CIF.DistCIFStructure()
    Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\SymmetrieSymbol1=SymCode_to_SymSymbol.s(Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\Symmetrie1)
    Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\SymmetrieSymbol2=SymCode_to_SymSymbol.s(Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\Symmetrie2)
  Next
  
  ;Tabelle erzeugen
  
  ForEach Selected_Bond_Lenghts_from_CIF.DistCIFStructure()
    If ListSize(Selected_Bond_Lenghts_from_CIF.DistCIFStructure())
      AddElement(LaTeX_Bondlengths_2_Column_Table.s())
      LaTeX_Bondlengths_2_Column_Table.s() = Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\Atom1 + "$^{" + Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\SymmetrieSymbol1 + "}$" + "--" + Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\Atom2 + "$^{" + Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\SymmetrieSymbol2 + "}$" + " & " + Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\Abstand + " \\"
    EndIf
  Next
  
EndProcedure

Procedure Create_Bondlengths_2_Column_Table_Ascii(List Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Caption.s)
  
  Protected Max_Char_Column.i
  Protected Numer_of_Spaces_to_Insert.i
  
  ClearList(Ascii_Bondlengths_2_Column_Table.s())
  
  AddElement(Ascii_Bondlengths_2_Column_Table.s())
  Ascii_Bondlengths_2_Column_Table.s()=RemoveString(Caption.s,#CRLF$)
  
  ForEach Selected_Bond_Lenghts_from_CIF.DistCIFStructure()
    Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\SymmetrieSymbol1=SymCode_to_SymSymbol.s(Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\Symmetrie1)
    Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\SymmetrieSymbol2=SymCode_to_SymSymbol.s(Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\Symmetrie2)
  Next
  
  ;Tabelle erzeugen
  
  ForEach Selected_Bond_Lenghts_from_CIF.DistCIFStructure()
    If ListSize(Selected_Bond_Lenghts_from_CIF.DistCIFStructure())
      AddElement(Ascii_Bondlengths_2_Column_Table.s())
      Ascii_Bondlengths_2_Column_Table.s() = Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\Atom1 + Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\SymmetrieSymbol1 +  "-" + Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\Atom2 + Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\SymmetrieSymbol2 + "TAB" + Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\Abstand 
    EndIf
  Next
  
  ForEach Ascii_Bondlengths_2_Column_Table.s()
    If FindString(Ascii_Bondlengths_2_Column_Table.s(),"TAB")
      If Len(StringField(Ascii_Bondlengths_2_Column_Table.s(),1,"TAB")) >  Max_Char_Column.i
        Max_Char_Column.i=Len(StringField(Ascii_Bondlengths_2_Column_Table.s(),1,"TAB"))
      EndIf
    EndIf
  Next 
  
  ;Tabelle tabulieren
  ForEach Ascii_Bondlengths_2_Column_Table.s()
    If FindString(Ascii_Bondlengths_2_Column_Table.s(),"TAB")
      Numer_of_Spaces_to_Insert.i = Max_Char_Column.i + 4 - Len(StringField(Ascii_Bondlengths_2_Column_Table.s(),1,"TAB")) 
      Ascii_Bondlengths_2_Column_Table.s()=ReplaceString(Ascii_Bondlengths_2_Column_Table.s(),"TAB",Space(Numer_of_Spaces_to_Insert.i))
    EndIf
  Next
  
EndProcedure

Procedure Create_Bondlengths_2_Column_Table_Markdown_Ascii(List Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Caption.s)
  
  Protected Max_Char_Column.i
  Protected Numer_of_Spaces_to_Insert.i
  
  ClearList(Markdown_Ascii_Bondlengths_2_Column_Table.s())
  
  AddElement(Markdown_Ascii_Bondlengths_2_Column_Table.s())
  Markdown_Ascii_Bondlengths_2_Column_Table.s()=""
  
  AddElement(Markdown_Ascii_Bondlengths_2_Column_Table.s())
  Markdown_Ascii_Bondlengths_2_Column_Table.s()=RemoveString(Caption.s,#CRLF$)
  
  AddElement(Markdown_Ascii_Bondlengths_2_Column_Table.s())
  Markdown_Ascii_Bondlengths_2_Column_Table.s()=LSet("-",Len(StringField(RemoveString(Caption.s,#CRLF$),1,"TAB")),"-")+"TAB"+LSet("-",Len(StringField(RemoveString(Caption.s,#CRLF$),2,"TAB")),"-")
  
  ForEach Selected_Bond_Lenghts_from_CIF.DistCIFStructure()
    Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\SymmetrieSymbol1=SymCode_to_SymSymbol.s(Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\Symmetrie1)
    Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\SymmetrieSymbol2=SymCode_to_SymSymbol.s(Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\Symmetrie2)
  Next
  
  ;Tabelle erzeugen
  
  ForEach Selected_Bond_Lenghts_from_CIF.DistCIFStructure()
    If ListSize(Selected_Bond_Lenghts_from_CIF.DistCIFStructure())
      AddElement(Markdown_Ascii_Bondlengths_2_Column_Table.s())
      Markdown_Ascii_Bondlengths_2_Column_Table.s() = Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\Atom1 
      If Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\SymmetrieSymbol1 <> ""
        Markdown_Ascii_Bondlengths_2_Column_Table.s() = Markdown_Ascii_Bondlengths_2_Column_Table.s() + "^" +  Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\SymmetrieSymbol1 + "^"
      EndIf
      Markdown_Ascii_Bondlengths_2_Column_Table.s() = Markdown_Ascii_Bondlengths_2_Column_Table.s() + "-" + Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\Atom2
      If Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\SymmetrieSymbol2 <> ""
        Markdown_Ascii_Bondlengths_2_Column_Table.s() = Markdown_Ascii_Bondlengths_2_Column_Table.s() + "^" +  Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\SymmetrieSymbol2 + "^"
      EndIf
      Markdown_Ascii_Bondlengths_2_Column_Table.s() = Markdown_Ascii_Bondlengths_2_Column_Table.s() + "TAB"
      Markdown_Ascii_Bondlengths_2_Column_Table.s() = Markdown_Ascii_Bondlengths_2_Column_Table.s() + Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\Abstand 
    EndIf
  Next
  
;   ForEach Markdown_Ascii_Bondlengths_2_Column_Table.s() ;Aufraeumen
;     Markdown_Ascii_Bondlengths_2_Column_Table.s()=ReplaceString(Markdown_Ascii_Bondlengths_2_Column_Table.s(),"^^","")
;   Next

  ForEach Markdown_Ascii_Bondlengths_2_Column_Table.s()
    If FindString(Markdown_Ascii_Bondlengths_2_Column_Table.s(),"TAB")
      If Len(StringField(Markdown_Ascii_Bondlengths_2_Column_Table.s(),1,"TAB")) >  Max_Char_Column.i
        Max_Char_Column.i=Len(StringField(Markdown_Ascii_Bondlengths_2_Column_Table.s(),1,"TAB"))
      EndIf
    EndIf
  Next 
  
  ;Tabelle tabulieren
  ForEach Markdown_Ascii_Bondlengths_2_Column_Table.s()
    If FindString(Markdown_Ascii_Bondlengths_2_Column_Table.s(),"TAB")
      Numer_of_Spaces_to_Insert.i = Max_Char_Column.i + 4 - Len(StringField(Markdown_Ascii_Bondlengths_2_Column_Table.s(),1,"TAB")) 
      Markdown_Ascii_Bondlengths_2_Column_Table.s()=ReplaceString(Markdown_Ascii_Bondlengths_2_Column_Table.s(),"TAB",Space(Numer_of_Spaces_to_Insert.i-1) + "|" +Space(3))
    EndIf
  Next
  
  ForEach Markdown_Ascii_Bondlengths_2_Column_Table.s()
    If FindString(Markdown_Ascii_Bondlengths_2_Column_Table.s(),"--")
      Markdown_Ascii_Bondlengths_2_Column_Table.s()=ReplaceString(Markdown_Ascii_Bondlengths_2_Column_Table.s()," ","-")
      Break
    EndIf
  Next
  
  LastElement(Markdown_Ascii_Bondlengths_2_Column_Table.s())
  AddElement(Markdown_Ascii_Bondlengths_2_Column_Table.s())
  Markdown_Ascii_Bondlengths_2_Column_Table.s()=""
  
EndProcedure

Procedure Create_Bondlengths_4_Column_Table_RTF(List Selected_Bond_Lenghts_from_CIF.DistCIFStructure())
  
  #LeerzeileRTF="{\pard\plain \f0\fs24 \par}"
  #TR1="{\trowd\trgaph108\trql\cellx3600\cellx7200\pard\intbl \f0\fs24 "
  #TR2="\cell\pard\intbl \f0\fs24 " 
  #TR3="\cell\row}"
  #TR14="{\trowd\trgaph108\trql\cellx2500\cellx4200\cellx6700\cellx8400\pard\intbl \f0\fs24 "
  
;   Protected SymopSymbol.s
;   Protected SymCodeSatz.s 
;   Protected SymOpNummer_in_CIF.i
;   Protected SymOpCode_in_CIF.s
;   Protected CurrentSymOp.s
  
  Protected NumberOfRowsBonds.i
  Protected i.i
  
  Protected NewList Selected_Bond_Lenghts_from_CIF_Columns1and2.DistCIFStructure()
  Protected NewList Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure()
  
  NumberOfRowsBonds.i=Round(ListSize(Selected_Bond_Lenghts_from_CIF.DistCIFStructure())/2,#PB_Round_Nearest)
  
  ClearList(RTF_Bondlengths_4_Column_Table.s())
  
  ForEach Selected_Bond_Lenghts_from_CIF.DistCIFStructure()
    Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\SymmetrieSymbol1=SymCode_to_SymSymbol.s(Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\Symmetrie1)
    Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\SymmetrieSymbol2=SymCode_to_SymSymbol.s(Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\Symmetrie2)
  Next
  
  CopyList(Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Selected_Bond_Lenghts_from_CIF_Columns1and2.DistCIFStructure())
  SelectElement(Selected_Bond_Lenghts_from_CIF_Columns1and2.DistCIFStructure(), NumberOfRowsBonds.i)
  SplitList(Selected_Bond_Lenghts_from_CIF_Columns1and2.DistCIFStructure(),Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure())  
  
  If ListSize(Selected_Bond_Lenghts_from_CIF_Columns1and2.DistCIFStructure()) > ListSize(Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure())
    LastElement(Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure())
    AddElement(Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure()) 
    Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure()\Atom1.s="xxx"
    Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure()\Atom2.s="xxx"
    Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure()\SymmetrieSymbol1=""
    Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure()\SymmetrieSymbol2=""
    Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure()\Abstand=""
  EndIf

  ;Tabelle erzeugen
  
   FirstElement(Selected_Bond_Lenghts_from_CIF_Columns1and2.DistCIFStructure())
   FirstElement(Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure())
  
  For i = 1 To NumberOfRowsBonds.i
    AddElement(RTF_Bondlengths_4_Column_Table.s())
    RTF_Bondlengths_4_Column_Table.s() = #TR14 + Selected_Bond_Lenghts_from_CIF_Columns1and2.DistCIFStructure()\Atom1 + Selected_Bond_Lenghts_from_CIF_Columns1and2.DistCIFStructure()\SymmetrieSymbol1 + "-" + Selected_Bond_Lenghts_from_CIF_Columns1and2.DistCIFStructure()\Atom2 + Selected_Bond_Lenghts_from_CIF_Columns1and2.DistCIFStructure()\SymmetrieSymbol2 + #TR2 + Selected_Bond_Lenghts_from_CIF_Columns1and2.DistCIFStructure()\Abstand + #TR2 + Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure()\Atom1 + Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure()\SymmetrieSymbol1 + "-" + Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure()\Atom2 + Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure()\SymmetrieSymbol2 + #TR2 + Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure()\Abstand + #TR3
    RTF_Bondlengths_4_Column_Table.s()=RemoveString(RTF_Bondlengths_4_Column_Table.s(),"xxx-xxx")
    NextElement(Selected_Bond_Lenghts_from_CIF_Columns1and2.DistCIFStructure())
    NextElement(Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure())
  Next
  
  ;
  ;   ForEach Bond_Lenghts_from_CIF.DistCIFStructure()
  ;     Debug "Alles " + Bond_Lenghts_from_CIF.DistCIFStructure()\Alles
  ;     Debug "Atom1 " + Bond_Lenghts_from_CIF.DistCIFStructure()\Atom1
  ;     Debug "Atom2 " + Bond_Lenghts_from_CIF.DistCIFStructure()\Atom2
  ;     Debug "Element1 " + Bond_Lenghts_from_CIF.DistCIFStructure()\Element1
  ;     Debug "Element2 " + Bond_Lenghts_from_CIF.DistCIFStructure()\Element2
  ;     Debug "Abstand " + Bond_Lenghts_from_CIF.DistCIFStructure()\Abstand
  ;     Debug "AbstandNum " + Bond_Lenghts_from_CIF.DistCIFStructure()\AbstandNum
  ;     Debug "EsdNum " + Bond_Lenghts_from_CIF.DistCIFStructure()\EsdNum
  ;     Debug "Sym1 " + Bond_Lenghts_from_CIF.DistCIFStructure()\Symmetrie1
  ;     Debug "Sym2 " + Bond_Lenghts_from_CIF.DistCIFStructure()\Symmetrie2
  ;     Debug "SymSymbol1 " + Bond_Lenghts_from_CIF.DistCIFStructure()\SymmetrieSymbol1
  ;     Debug "SymSymbol2 " + Bond_Lenghts_from_CIF.DistCIFStructure()\SymmetrieSymbol2
  ;   Next
  
EndProcedure

Procedure Create_Bondlengths_4_Column_Table_LaTeX(List Selected_Bond_Lenghts_from_CIF.DistCIFStructure())
  
  Protected NumberOfRowsBonds.i
  Protected i.i
  
  Protected NewList Selected_Bond_Lenghts_from_CIF_Columns1and2.DistCIFStructure()
  Protected NewList Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure()
  
  NumberOfRowsBonds.i=Round(ListSize(Selected_Bond_Lenghts_from_CIF.DistCIFStructure())/2,#PB_Round_Nearest)
  
  ClearList(LaTeX_Bondlengths_4_Column_Table.s())
  
  ForEach Selected_Bond_Lenghts_from_CIF.DistCIFStructure()
    Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\SymmetrieSymbol1=SymCode_to_SymSymbol.s(Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\Symmetrie1)
    Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\SymmetrieSymbol2=SymCode_to_SymSymbol.s(Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\Symmetrie2)
  Next
  
  CopyList(Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Selected_Bond_Lenghts_from_CIF_Columns1and2.DistCIFStructure())
  SelectElement(Selected_Bond_Lenghts_from_CIF_Columns1and2.DistCIFStructure(), NumberOfRowsBonds.i)
  SplitList(Selected_Bond_Lenghts_from_CIF_Columns1and2.DistCIFStructure(),Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure())  
  
  If ListSize(Selected_Bond_Lenghts_from_CIF_Columns1and2.DistCIFStructure()) > ListSize(Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure())
    LastElement(Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure())
    AddElement(Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure()) 
    Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure()\Atom1.s="xxx"
    Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure()\Atom2.s="xxx"
    Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure()\SymmetrieSymbol1="xxx"
    Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure()\SymmetrieSymbol2="xxx"
    Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure()\Abstand=""
  EndIf
  
  ;Tabelle erzeugen
  
  FirstElement(Selected_Bond_Lenghts_from_CIF_Columns1and2.DistCIFStructure())
  FirstElement(Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure())
  
  For i = 1 To NumberOfRowsBonds.i
    AddElement(LaTeX_Bondlengths_4_Column_Table.s())
    LaTeX_Bondlengths_4_Column_Table.s() = Selected_Bond_Lenghts_from_CIF_Columns1and2.DistCIFStructure()\Atom1 + "$^{" + Selected_Bond_Lenghts_from_CIF_Columns1and2.DistCIFStructure()\SymmetrieSymbol1 + "}$" + "--" + Selected_Bond_Lenghts_from_CIF_Columns1and2.DistCIFStructure()\Atom2 + "$^{" + Selected_Bond_Lenghts_from_CIF_Columns1and2.DistCIFStructure()\SymmetrieSymbol2 + "}$" + " & " + Selected_Bond_Lenghts_from_CIF_Columns1and2.DistCIFStructure()\Abstand + " & " + Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure()\Atom1 + "$^{" + Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure()\SymmetrieSymbol1 + "}$" + "--" + Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure()\Atom2 + "$^{" + Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure()\SymmetrieSymbol2 + "}$" + " & " + Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure()\Abstand + " \\"
    LaTeX_Bondlengths_4_Column_Table.s() = RemoveString(LaTeX_Bondlengths_4_Column_Table.s(),"xxx$^{xxx}$--xxx$^{xxx}$")
    NextElement(Selected_Bond_Lenghts_from_CIF_Columns1and2.DistCIFStructure())
    NextElement(Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure())
  Next
  
    
;     ForEach SymCode_to_SymSymbol.s()
;       Debug MapKey(SymCode_to_SymSymbol.s()) + ":  " + SymCode_to_SymSymbol.s()
;     Next  
;     
;     ForEach List_of_SymOps_in_Bonds.s()
;       Debug List_of_SymOps_in_Bonds.s()
;     Next
  ;
  ;   ForEach Bond_Lenghts_from_CIF.DistCIFStructure()
  ;     Debug "Alles " + Bond_Lenghts_from_CIF.DistCIFStructure()\Alles
  ;     Debug "Atom1 " + Bond_Lenghts_from_CIF.DistCIFStructure()\Atom1
  ;     Debug "Atom2 " + Bond_Lenghts_from_CIF.DistCIFStructure()\Atom2
  ;     Debug "Element1 " + Bond_Lenghts_from_CIF.DistCIFStructure()\Element1
  ;     Debug "Element2 " + Bond_Lenghts_from_CIF.DistCIFStructure()\Element2
  ;     Debug "Abstand " + Bond_Lenghts_from_CIF.DistCIFStructure()\Abstand
  ;     Debug "AbstandNum " + Bond_Lenghts_from_CIF.DistCIFStructure()\AbstandNum
  ;     Debug "EsdNum " + Bond_Lenghts_from_CIF.DistCIFStructure()\EsdNum
  ;     Debug "Sym1 " + Bond_Lenghts_from_CIF.DistCIFStructure()\Symmetrie1
  ;     Debug "Sym2 " + Bond_Lenghts_from_CIF.DistCIFStructure()\Symmetrie2
  ;     Debug "SymSymbol1 " + Bond_Lenghts_from_CIF.DistCIFStructure()\SymmetrieSymbol1
  ;     Debug "SymSymbol2 " + Bond_Lenghts_from_CIF.DistCIFStructure()\SymmetrieSymbol2
  ;   Next
  
EndProcedure

Procedure Create_Bondlengths_4_Column_Table_Ascii(List Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Caption.s)
  
  Protected NumberOfRowsBonds.i
  Protected i.i
  
  Protected NewList Selected_Bond_Lenghts_from_CIF_Columns1and2.DistCIFStructure()
  Protected NewList Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure()
  
  NumberOfRowsBonds.i=Round(ListSize(Selected_Bond_Lenghts_from_CIF.DistCIFStructure())/2,#PB_Round_Nearest)
  
  ClearList(Ascii_Bondlengths_4_Column_Table.s())
  
  Caption.s=ReplaceString(Caption.s,"TAB","TB1",#PB_String_CaseSensitive,0,1)
  Caption.s=ReplaceString(Caption.s,"TAB","TB2",#PB_String_CaseSensitive,0,1)
  Caption.s=ReplaceString(Caption.s,"TAB","TB3",#PB_String_CaseSensitive,0,1)
  Caption.s=ReplaceString(Caption.s,"TB1","TAB",#PB_String_CaseSensitive,0,1)
  
  AddElement(Ascii_Bondlengths_4_Column_Table.s())
  Ascii_Bondlengths_4_Column_Table.s()=RemoveString(Caption.s,#CRLF$)
    
  
  ForEach Selected_Bond_Lenghts_from_CIF.DistCIFStructure()
    Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\SymmetrieSymbol1=SymCode_to_SymSymbol.s(Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\Symmetrie1)
    Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\SymmetrieSymbol2=SymCode_to_SymSymbol.s(Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\Symmetrie2)
  Next
  
  CopyList(Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Selected_Bond_Lenghts_from_CIF_Columns1and2.DistCIFStructure())
  SelectElement(Selected_Bond_Lenghts_from_CIF_Columns1and2.DistCIFStructure(), NumberOfRowsBonds.i)
  SplitList(Selected_Bond_Lenghts_from_CIF_Columns1and2.DistCIFStructure(),Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure())  
  
  If ListSize(Selected_Bond_Lenghts_from_CIF_Columns1and2.DistCIFStructure()) > ListSize(Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure())
    LastElement(Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure())
    AddElement(Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure()) 
    Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure()\Atom1.s="xxx"
    Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure()\Atom2.s="xxx"
    Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure()\SymmetrieSymbol1="xxx"
    Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure()\SymmetrieSymbol2="xxx"
    Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure()\Abstand=""
  EndIf
  
  ;Tabelle erzeugen
  
  FirstElement(Selected_Bond_Lenghts_from_CIF_Columns1and2.DistCIFStructure())
  FirstElement(Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure())
  
  For i = 1 To NumberOfRowsBonds.i
    AddElement(Ascii_Bondlengths_4_Column_Table.s())
    Ascii_Bondlengths_4_Column_Table.s() = Selected_Bond_Lenghts_from_CIF_Columns1and2.DistCIFStructure()\Atom1 + Selected_Bond_Lenghts_from_CIF_Columns1and2.DistCIFStructure()\SymmetrieSymbol1 + "-" + Selected_Bond_Lenghts_from_CIF_Columns1and2.DistCIFStructure()\Atom2 + Selected_Bond_Lenghts_from_CIF_Columns1and2.DistCIFStructure()\SymmetrieSymbol2 + "TAB" + Selected_Bond_Lenghts_from_CIF_Columns1and2.DistCIFStructure()\Abstand + "TB2" + Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure()\Atom1 + Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure()\SymmetrieSymbol1 + "-" + Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure()\Atom2 + Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure()\SymmetrieSymbol2 + "TB3" + Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure()\Abstand
    Ascii_Bondlengths_4_Column_Table.s() = RemoveString(Ascii_Bondlengths_4_Column_Table.s(),"xxxxxx-xxxxxx")
    NextElement(Selected_Bond_Lenghts_from_CIF_Columns1and2.DistCIFStructure())
    NextElement(Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure())
  Next
  
  ForEach Ascii_Bondlengths_4_Column_Table.s()
    If FindString(Ascii_Bondlengths_4_Column_Table.s(),"TAB")
      If Len(StringField(Ascii_Bondlengths_4_Column_Table.s(),1,"TAB")) >  Max_Char_Column.i
        Max_Char_Column.i=Len(StringField(Ascii_Bondlengths_4_Column_Table.s(),1,"TAB"))
      EndIf
    EndIf
  Next 
  
  ;Tabelle tabulieren
  ForEach Ascii_Bondlengths_4_Column_Table.s()
    If FindString(Ascii_Bondlengths_4_Column_Table.s(),"TAB")
      Numer_of_Spaces_to_Insert.i = Max_Char_Column.i + 4 - Len(StringField(Ascii_Bondlengths_4_Column_Table.s(),1,"TAB")) 
      Ascii_Bondlengths_4_Column_Table.s()=ReplaceString(Ascii_Bondlengths_4_Column_Table.s(),"TAB",Space(Numer_of_Spaces_to_Insert.i))
    EndIf
  Next
  
    ForEach Ascii_Bondlengths_4_Column_Table.s()
    If FindString(Ascii_Bondlengths_4_Column_Table.s(),"TB2")
      If Len(StringField(Ascii_Bondlengths_4_Column_Table.s(),1,"TB2")) >  Max_Char_Column.i
        Max_Char_Column.i=Len(StringField(Ascii_Bondlengths_4_Column_Table.s(),1,"TB2"))
      EndIf
    EndIf
  Next 
    ForEach Ascii_Bondlengths_4_Column_Table.s()
    If FindString(Ascii_Bondlengths_4_Column_Table.s(),"TB2")
      Numer_of_Spaces_to_Insert.i = Max_Char_Column.i + 4 - Len(StringField(Ascii_Bondlengths_4_Column_Table.s(),1,"TB2")) 
      Ascii_Bondlengths_4_Column_Table.s()=ReplaceString(Ascii_Bondlengths_4_Column_Table.s(),"TB2",Space(Numer_of_Spaces_to_Insert.i))
    EndIf
  Next
  
      ForEach Ascii_Bondlengths_4_Column_Table.s()
    If FindString(Ascii_Bondlengths_4_Column_Table.s(),"TB3")
      If Len(StringField(Ascii_Bondlengths_4_Column_Table.s(),1,"TB3")) >  Max_Char_Column.i
        Max_Char_Column.i=Len(StringField(Ascii_Bondlengths_4_Column_Table.s(),1,"TB3"))
      EndIf
    EndIf
  Next 
    ForEach Ascii_Bondlengths_4_Column_Table.s()
    If FindString(Ascii_Bondlengths_4_Column_Table.s(),"TB3")
      Numer_of_Spaces_to_Insert.i = Max_Char_Column.i + 4 - Len(StringField(Ascii_Bondlengths_4_Column_Table.s(),1,"TB3")) 
      Ascii_Bondlengths_4_Column_Table.s()=ReplaceString(Ascii_Bondlengths_4_Column_Table.s(),"TB3",Space(Numer_of_Spaces_to_Insert.i))
    EndIf
  Next

EndProcedure

Procedure Create_Bondlengths_4_Column_Table_Markdown_Ascii(List Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Caption.s)
  
  Protected NumberOfRowsBonds.i
  Protected i.i
  Protected Markdown_Helper_String.s
  
  Protected NewList Selected_Bond_Lenghts_from_CIF_Columns1and2.DistCIFStructure()
  Protected NewList Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure()
  
  NumberOfRowsBonds.i=Round(ListSize(Selected_Bond_Lenghts_from_CIF.DistCIFStructure())/2,#PB_Round_Nearest)
  
  ClearList(Markdown_Ascii_Bondlengths_4_Column_Table.s())
  
  Markdown_Helper_String.s = LSet("-",Len(StringField(RemoveString(Caption.s,#CRLF$),1,"TAB")),"-") + "TAB" + LSet("-",Len(StringField(RemoveString(Caption.s,#CRLF$),2,"TAB")),"-") + "TAB" + LSet("-",Len(StringField(RemoveString(Caption.s,#CRLF$),3,"TAB")),"-") + "TAB" + LSet("-",Len(StringField(RemoveString(Caption.s,#CRLF$),4,"TAB")),"-")
  
  Caption.s=ReplaceString(Caption.s,"TAB","TB1",#PB_String_CaseSensitive,0,1)
  Caption.s=ReplaceString(Caption.s,"TAB","TB2",#PB_String_CaseSensitive,0,1)
  Caption.s=ReplaceString(Caption.s,"TAB","TB3",#PB_String_CaseSensitive,0,1)
  Caption.s=ReplaceString(Caption.s,"TB1","TAB",#PB_String_CaseSensitive,0,1)
  
  Markdown_Helper_String.s=ReplaceString(Markdown_Helper_String.s,"TAB","TB1",#PB_String_CaseSensitive,0,1)
  Markdown_Helper_String.s=ReplaceString(Markdown_Helper_String.s,"TAB","TB2",#PB_String_CaseSensitive,0,1)
  Markdown_Helper_String.s=ReplaceString(Markdown_Helper_String.s,"TAB","TB3",#PB_String_CaseSensitive,0,1)
  Markdown_Helper_String.s=ReplaceString(Markdown_Helper_String.s,"TB1","TAB",#PB_String_CaseSensitive,0,1)
  
  AddElement(Markdown_Ascii_Bondlengths_4_Column_Table.s())
  Markdown_Ascii_Bondlengths_4_Column_Table.s()=""
  
  AddElement(Markdown_Ascii_Bondlengths_4_Column_Table.s())
  Markdown_Ascii_Bondlengths_4_Column_Table.s()=RemoveString(Caption.s,#CRLF$)
    
  AddElement(Markdown_Ascii_Bondlengths_4_Column_Table.s())
  Markdown_Ascii_Bondlengths_4_Column_Table.s()=Markdown_Helper_String.s
  
  ForEach Selected_Bond_Lenghts_from_CIF.DistCIFStructure()
    Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\SymmetrieSymbol1=SymCode_to_SymSymbol.s(Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\Symmetrie1)
    Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\SymmetrieSymbol2=SymCode_to_SymSymbol.s(Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\Symmetrie2)
  Next
  
  CopyList(Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),Selected_Bond_Lenghts_from_CIF_Columns1and2.DistCIFStructure())
  SelectElement(Selected_Bond_Lenghts_from_CIF_Columns1and2.DistCIFStructure(), NumberOfRowsBonds.i)
  SplitList(Selected_Bond_Lenghts_from_CIF_Columns1and2.DistCIFStructure(),Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure())  
  
  If ListSize(Selected_Bond_Lenghts_from_CIF_Columns1and2.DistCIFStructure()) > ListSize(Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure())
    LastElement(Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure())
    AddElement(Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure()) 
    Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure()\Atom1.s="xxx"
    Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure()\Atom2.s="xxx"
    Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure()\SymmetrieSymbol1="xxx"
    Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure()\SymmetrieSymbol2="xxx"
    Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure()\Abstand=""
  EndIf
  
  ;Tabelle erzeugen
  
  FirstElement(Selected_Bond_Lenghts_from_CIF_Columns1and2.DistCIFStructure())
  FirstElement(Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure())
  
  For i = 1 To NumberOfRowsBonds.i
    AddElement(Markdown_Ascii_Bondlengths_4_Column_Table.s())
 ;   Markdown_Ascii_Bondlengths_4_Column_Table.s() = Selected_Bond_Lenghts_from_CIF_Columns1and2.DistCIFStructure()\Atom1 + Selected_Bond_Lenghts_from_CIF_Columns1and2.DistCIFStructure()\SymmetrieSymbol1 + "-" + Selected_Bond_Lenghts_from_CIF_Columns1and2.DistCIFStructure()\Atom2 + "^" + Selected_Bond_Lenghts_from_CIF_Columns1and2.DistCIFStructure()\SymmetrieSymbol2 + "^" +  "TAB" + Selected_Bond_Lenghts_from_CIF_Columns1and2.DistCIFStructure()\Abstand + "TB2" + Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure()\Atom1 + "^" + Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure()\SymmetrieSymbol1 + "^" + "-" + Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure()\Atom2 + "^" + Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure()\SymmetrieSymbol2 + "^" + "TB3" + Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure()\Abstand
    Markdown_Ascii_Bondlengths_4_Column_Table.s() = Selected_Bond_Lenghts_from_CIF_Columns1and2.DistCIFStructure()\Atom1 
    If Selected_Bond_Lenghts_from_CIF_Columns1and2.DistCIFStructure()\SymmetrieSymbol1 <>""
      Markdown_Ascii_Bondlengths_4_Column_Table.s() = Markdown_Ascii_Bondlengths_4_Column_Table.s() + "^" + Selected_Bond_Lenghts_from_CIF_Columns1and2.DistCIFStructure()\SymmetrieSymbol1 + "^"
    EndIf
    Markdown_Ascii_Bondlengths_4_Column_Table.s() = Markdown_Ascii_Bondlengths_4_Column_Table.s() + "-" +  Selected_Bond_Lenghts_from_CIF_Columns1and2.DistCIFStructure()\Atom2  
    If Selected_Bond_Lenghts_from_CIF_Columns1and2.DistCIFStructure()\SymmetrieSymbol2 <>""
      Markdown_Ascii_Bondlengths_4_Column_Table.s() = Markdown_Ascii_Bondlengths_4_Column_Table.s() + "^" + Selected_Bond_Lenghts_from_CIF_Columns1and2.DistCIFStructure()\SymmetrieSymbol2 + "^"
    EndIf
    Markdown_Ascii_Bondlengths_4_Column_Table.s() = Markdown_Ascii_Bondlengths_4_Column_Table.s() + "TAB"
    Markdown_Ascii_Bondlengths_4_Column_Table.s() = Markdown_Ascii_Bondlengths_4_Column_Table.s() + Selected_Bond_Lenghts_from_CIF_Columns1and2.DistCIFStructure()\Abstand + "TB2"
    Markdown_Ascii_Bondlengths_4_Column_Table.s() = Markdown_Ascii_Bondlengths_4_Column_Table.s() + Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure()\Atom1 
    If Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure()\SymmetrieSymbol1 <>""
      Markdown_Ascii_Bondlengths_4_Column_Table.s() = Markdown_Ascii_Bondlengths_4_Column_Table.s() + "^" + Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure()\SymmetrieSymbol1 + "^"
    EndIf
    Markdown_Ascii_Bondlengths_4_Column_Table.s() = Markdown_Ascii_Bondlengths_4_Column_Table.s() + "-" +  Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure()\Atom2
    If Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure()\SymmetrieSymbol2 <>""
      Markdown_Ascii_Bondlengths_4_Column_Table.s() = Markdown_Ascii_Bondlengths_4_Column_Table.s() + "^" + Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure()\SymmetrieSymbol2 + "^"
    EndIf
    Markdown_Ascii_Bondlengths_4_Column_Table.s() = Markdown_Ascii_Bondlengths_4_Column_Table.s() + "TB3"
    Markdown_Ascii_Bondlengths_4_Column_Table.s() = Markdown_Ascii_Bondlengths_4_Column_Table.s() + Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure()\Abstand 
    
    Markdown_Ascii_Bondlengths_4_Column_Table.s() = RemoveString(Markdown_Ascii_Bondlengths_4_Column_Table.s(),"xxx^xxx^-xxx^xxx^")
    NextElement(Selected_Bond_Lenghts_from_CIF_Columns1and2.DistCIFStructure())
    NextElement(Selected_Bond_Lenghts_from_CIF_Columns3and4.DistCIFStructure())
  Next
  
  ForEach Markdown_Ascii_Bondlengths_4_Column_Table.s()
    If FindString(Markdown_Ascii_Bondlengths_4_Column_Table.s(),"TAB")
      If Len(StringField(Markdown_Ascii_Bondlengths_4_Column_Table.s(),1,"TAB")) >  Max_Char_Column.i
        Max_Char_Column.i=Len(StringField(Markdown_Ascii_Bondlengths_4_Column_Table.s(),1,"TAB"))
      EndIf
    EndIf
  Next 
  ForEach Markdown_Ascii_Bondlengths_4_Column_Table.s()
    If FindString(Markdown_Ascii_Bondlengths_4_Column_Table.s(),"TAB")
      Numer_of_Spaces_to_Insert.i = Max_Char_Column.i + 4 - Len(StringField(Markdown_Ascii_Bondlengths_4_Column_Table.s(),1,"TAB")) 
      Markdown_Ascii_Bondlengths_4_Column_Table.s()=ReplaceString(Markdown_Ascii_Bondlengths_4_Column_Table.s(),"TAB",Space(Numer_of_Spaces_to_Insert.i-1) + "|" +Space(3))
    EndIf
  Next
  
  ForEach Markdown_Ascii_Bondlengths_4_Column_Table.s()
    If FindString(Markdown_Ascii_Bondlengths_4_Column_Table.s(),"TB2")
      If Len(StringField(Markdown_Ascii_Bondlengths_4_Column_Table.s(),1,"TB2")) >  Max_Char_Column.i
        Max_Char_Column.i=Len(StringField(Markdown_Ascii_Bondlengths_4_Column_Table.s(),1,"TB2"))
      EndIf
    EndIf
  Next 
  ForEach Markdown_Ascii_Bondlengths_4_Column_Table.s()
    If FindString(Markdown_Ascii_Bondlengths_4_Column_Table.s(),"TB2")
      Numer_of_Spaces_to_Insert.i = Max_Char_Column.i + 4 - Len(StringField(Markdown_Ascii_Bondlengths_4_Column_Table.s(),1,"TB2")) 
      Markdown_Ascii_Bondlengths_4_Column_Table.s()=ReplaceString(Markdown_Ascii_Bondlengths_4_Column_Table.s(),"TB2",Space(Numer_of_Spaces_to_Insert.i-1) + "|" +Space(3))
    EndIf
  Next
  
  ForEach Markdown_Ascii_Bondlengths_4_Column_Table.s()
    If FindString(Markdown_Ascii_Bondlengths_4_Column_Table.s(),"TB3")
      If Len(StringField(Markdown_Ascii_Bondlengths_4_Column_Table.s(),1,"TB3")) >  Max_Char_Column.i
        Max_Char_Column.i=Len(StringField(Markdown_Ascii_Bondlengths_4_Column_Table.s(),1,"TB3"))
      EndIf
    EndIf
  Next 
  ForEach Markdown_Ascii_Bondlengths_4_Column_Table.s()
    If FindString(Markdown_Ascii_Bondlengths_4_Column_Table.s(),"TB3")
      Numer_of_Spaces_to_Insert.i = Max_Char_Column.i + 4 - Len(StringField(Markdown_Ascii_Bondlengths_4_Column_Table.s(),1,"TB3")) 
      Markdown_Ascii_Bondlengths_4_Column_Table.s()=ReplaceString(Markdown_Ascii_Bondlengths_4_Column_Table.s(),"TB3",Space(Numer_of_Spaces_to_Insert.i-1) + "|" +Space(3))
    EndIf
  Next
  
  ForEach Markdown_Ascii_Bondlengths_4_Column_Table.s()
    If FindString(Markdown_Ascii_Bondlengths_4_Column_Table.s(),"--")
      Markdown_Ascii_Bondlengths_4_Column_Table.s()=ReplaceString(Markdown_Ascii_Bondlengths_4_Column_Table.s()," ","-")
      Break
    EndIf
  Next
  
  LastElement(Markdown_Ascii_Bondlengths_4_Column_Table.s())
  AddElement(Markdown_Ascii_Bondlengths_4_Column_Table.s())
  Markdown_Ascii_Bondlengths_4_Column_Table.s()=""

EndProcedure

Procedure Create_Angles_2_Column_Table_RTF(List Selected_Angles_from_CIF.AngCIFStructure())
  
  #LeerzeileRTF="{\pard\plain \f0\fs24 \par}"
  #TR1="{\trowd\trgaph108\trql\cellx3600\cellx7200\pard\intbl \f0\fs24 "
  #TR2="\cell\pard\intbl \f0\fs24 " 
  #TR3="\cell\row}"
  
;   Protected SymopSymbol.s
;   Protected SymCodeSatz.s 
;   Protected SymOpNummer_in_CIF.i
;   Protected SymOpCode_in_CIF.s
;   Protected CurrentSymOp.s
  
  ClearList(RTF_Angles_2_Column_Table.s())

  ForEach Selected_Angles_from_CIF.AngCIFStructure()
    Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol1=SymCode_to_SymSymbol.s(Selected_Angles_from_CIF.AngCIFStructure()\Symmetrie1)
    Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol2=SymCode_to_SymSymbol.s(Selected_Angles_from_CIF.AngCIFStructure()\Symmetrie2)
    Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol3=SymCode_to_SymSymbol.s(Selected_Angles_from_CIF.AngCIFStructure()\Symmetrie3)
  Next
  
  ;Ende Symops 2_456 etc. werden zu Symbolen ' '' ''' etc. umgesetzt
  
  ;Tabelle erzeugen
  
  ForEach Selected_Angles_from_CIF.AngCIFStructure()
    If ListSize(Selected_Angles_from_CIF.AngCIFStructure())
      Select Len(StringField(Selected_Angles_from_CIF.AngCIFStructure()\Winkel,1,".")) ;rueckt Winkel schoener in die Tabelle ein
        Case 1
          AddElement(RTF_Angles_2_Column_Table.s())
          RTF_Angles_2_Column_Table.s() = #TR1 + Selected_Angles_from_CIF.AngCIFStructure()\Atom1 + Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol1 + "-" + Selected_Angles_from_CIF.AngCIFStructure()\Atom2 + Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol2 + "-" + Selected_Angles_from_CIF.AngCIFStructure()\Atom3 + Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol3 + #TR2 + "  " + Selected_Angles_from_CIF.AngCIFStructure()\Winkel + #TR3
        Case 2
          AddElement(RTF_Angles_2_Column_Table.s())
          RTF_Angles_2_Column_Table.s() = #TR1 + Selected_Angles_from_CIF.AngCIFStructure()\Atom1 + Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol1 + "-" + Selected_Angles_from_CIF.AngCIFStructure()\Atom2 + Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol2 + "-" + Selected_Angles_from_CIF.AngCIFStructure()\Atom3 + Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol3 + #TR2 + " " + Selected_Angles_from_CIF.AngCIFStructure()\Winkel + #TR3
        Default
          AddElement(RTF_Angles_2_Column_Table.s())
          RTF_Angles_2_Column_Table.s() = #TR1 + Selected_Angles_from_CIF.AngCIFStructure()\Atom1 + Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol1 + "-" + Selected_Angles_from_CIF.AngCIFStructure()\Atom2 + Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol2 + "-" + Selected_Angles_from_CIF.AngCIFStructure()\Atom3 + Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol3 + #TR2 + Selected_Angles_from_CIF.AngCIFStructure()\Winkel + #TR3
      EndSelect
    EndIf
  Next
  
  ;
  ;   ForEach Bond_Lenghts_from_CIF.DistCIFStructure()
  ;     Debug "Alles " + Bond_Lenghts_from_CIF.DistCIFStructure()\Alles
  ;     Debug "Atom1 " + Bond_Lenghts_from_CIF.DistCIFStructure()\Atom1
  ;     Debug "Atom2 " + Bond_Lenghts_from_CIF.DistCIFStructure()\Atom2
  ;     Debug "Element1 " + Bond_Lenghts_from_CIF.DistCIFStructure()\Element1
  ;     Debug "Element2 " + Bond_Lenghts_from_CIF.DistCIFStructure()\Element2
  ;     Debug "Abstand " + Bond_Lenghts_from_CIF.DistCIFStructure()\Abstand
  ;     Debug "AbstandNum " + Bond_Lenghts_from_CIF.DistCIFStructure()\AbstandNum
  ;     Debug "EsdNum " + Bond_Lenghts_from_CIF.DistCIFStructure()\EsdNum
  ;     Debug "Sym1 " + Bond_Lenghts_from_CIF.DistCIFStructure()\Symmetrie1
  ;     Debug "Sym2 " + Bond_Lenghts_from_CIF.DistCIFStructure()\Symmetrie2
  ;     Debug "SymSymbol1 " + Bond_Lenghts_from_CIF.DistCIFStructure()\SymmetrieSymbol1
  ;     Debug "SymSymbol2 " + Bond_Lenghts_from_CIF.DistCIFStructure()\SymmetrieSymbol2
  ;   Next
  
EndProcedure

Procedure Create_Angles_2_Column_Table_LaTeX(List Selected_Angles_from_CIF.AngCIFStructure())
    
  ClearList(LaTeX_Angles_2_Column_Table.s())

  ForEach Selected_Angles_from_CIF.AngCIFStructure()
    Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol1=SymCode_to_SymSymbol.s(Selected_Angles_from_CIF.AngCIFStructure()\Symmetrie1)
    Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol2=SymCode_to_SymSymbol.s(Selected_Angles_from_CIF.AngCIFStructure()\Symmetrie2)
    Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol3=SymCode_to_SymSymbol.s(Selected_Angles_from_CIF.AngCIFStructure()\Symmetrie3)
  Next
  
  ;Ende Symops 2_456 etc. werden zu Symbolen ' '' ''' etc. umgesetzt
  
  ForEach Selected_Angles_from_CIF.AngCIFStructure()
    If ListSize(Selected_Angles_from_CIF.AngCIFStructure())
      AddElement(LaTeX_Angles_2_Column_Table.s())
      LaTeX_Angles_2_Column_Table.s() = Selected_Angles_from_CIF.AngCIFStructure()\Atom1 + "$^{" + Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol1 + "}$" + "--" + Selected_Angles_from_CIF.AngCIFStructure()\Atom2 + "$^{" + Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol2 + "}$" +  "--" + Selected_Angles_from_CIF.AngCIFStructure()\Atom3 +  "$^{" + Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol3 + "}$" + " & " + Selected_Angles_from_CIF.AngCIFStructure()\Winkel + " \\"
    EndIf
  Next
  
EndProcedure

Procedure Create_Angles_2_Column_Table_Ascii(List Selected_Angles_from_CIF.AngCIFStructure(),Caption.s)
  
  Protected Max_Char_Column.i
  Protected Numer_of_Spaces_to_Insert.i
  
  ClearList(Ascii_Angles_2_Column_Table.s())
  
  AddElement(Ascii_Angles_2_Column_Table.s())
  Ascii_Angles_2_Column_Table.s()=RemoveString(Caption.s,#CRLF$)
  

  ForEach Selected_Angles_from_CIF.AngCIFStructure()
    Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol1=SymCode_to_SymSymbol.s(Selected_Angles_from_CIF.AngCIFStructure()\Symmetrie1)
    Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol2=SymCode_to_SymSymbol.s(Selected_Angles_from_CIF.AngCIFStructure()\Symmetrie2)
    Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol3=SymCode_to_SymSymbol.s(Selected_Angles_from_CIF.AngCIFStructure()\Symmetrie3)
  Next
  
  ;Ende Symops 2_456 etc. werden zu Symbolen ' '' ''' etc. umgesetzt
  
;   ForEach Selected_Angles_from_CIF.AngCIFStructure()
;     If ListSize(Selected_Angles_from_CIF.AngCIFStructure())
;       AddElement(Ascii_Angles_2_Column_Table.s())
;       Ascii_Angles_2_Column_Table.s() = Selected_Angles_from_CIF.AngCIFStructure()\Atom1 + Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol1 + "-" + Selected_Angles_from_CIF.AngCIFStructure()\Atom2 + Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol2 + "-" + Selected_Angles_from_CIF.AngCIFStructure()\Atom3 +  Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol3 + "TAB" + Selected_Angles_from_CIF.AngCIFStructure()\Winkel 
;     EndIf
;   Next
  
  ForEach Selected_Angles_from_CIF.AngCIFStructure()
    If ListSize(Selected_Angles_from_CIF.AngCIFStructure())
      Select Len(StringField(Selected_Angles_from_CIF.AngCIFStructure()\Winkel,1,".")) ;rueckt Winkel schoener in die Tabelle ein
        Case 1
          AddElement(Ascii_Angles_2_Column_Table.s())
          Ascii_Angles_2_Column_Table.s() = Selected_Angles_from_CIF.AngCIFStructure()\Atom1 + Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol1 + "-" + Selected_Angles_from_CIF.AngCIFStructure()\Atom2 + Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol2 + "-" + Selected_Angles_from_CIF.AngCIFStructure()\Atom3 + Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol3 + "TAB" + "  " + Selected_Angles_from_CIF.AngCIFStructure()\Winkel
        Case 2
          AddElement(Ascii_Angles_2_Column_Table.s())
          Ascii_Angles_2_Column_Table.s() = Selected_Angles_from_CIF.AngCIFStructure()\Atom1 + Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol1 + "-" + Selected_Angles_from_CIF.AngCIFStructure()\Atom2 + Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol2 + "-" + Selected_Angles_from_CIF.AngCIFStructure()\Atom3 + Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol3 + "TAB" + " " + Selected_Angles_from_CIF.AngCIFStructure()\Winkel 
        Default
          AddElement(Ascii_Angles_2_Column_Table.s())
          Ascii_Angles_2_Column_Table.s() = Selected_Angles_from_CIF.AngCIFStructure()\Atom1 + Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol1 + "-" + Selected_Angles_from_CIF.AngCIFStructure()\Atom2 + Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol2 + "-" + Selected_Angles_from_CIF.AngCIFStructure()\Atom3 + Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol3 + "TAB" + Selected_Angles_from_CIF.AngCIFStructure()\Winkel 
      EndSelect
    EndIf
  Next
  
  ForEach Ascii_Angles_2_Column_Table.s()
    If FindString(Ascii_Angles_2_Column_Table.s(),"TAB")
      If Len(StringField(Ascii_Angles_2_Column_Table.s(),1,"TAB")) >  Max_Char_Column.i
        Max_Char_Column.i=Len(StringField(Ascii_Angles_2_Column_Table.s(),1,"TAB"))
      EndIf
    EndIf
  Next 
  
  ;Tabelle tabulieren
  ForEach Ascii_Angles_2_Column_Table.s()
    If FindString(Ascii_Angles_2_Column_Table.s(),"TAB")
      Numer_of_Spaces_to_Insert.i = Max_Char_Column.i + 4 - Len(StringField(Ascii_Angles_2_Column_Table.s(),1,"TAB")) 
      Ascii_Angles_2_Column_Table.s()=ReplaceString(Ascii_Angles_2_Column_Table.s(),"TAB",Space(Numer_of_Spaces_to_Insert.i))
    EndIf
  Next
    
EndProcedure

Procedure Create_Angles_2_Column_Table_Markdown_Ascii(List Selected_Angles_from_CIF.AngCIFStructure(),Caption.s)
  
  Protected Max_Char_Column.i
  Protected Numer_of_Spaces_to_Insert.i

  ClearList(Markdown_Ascii_Angles_2_Column_Table.s())
  
  AddElement(Markdown_Ascii_Angles_2_Column_Table.s())
  Markdown_Ascii_Angles_2_Column_Table.s()=""
  
  AddElement(Markdown_Ascii_Angles_2_Column_Table.s())
  Markdown_Ascii_Angles_2_Column_Table.s()=RemoveString(Caption.s,#CRLF$)
  
  AddElement(Markdown_Ascii_Angles_2_Column_Table.s())
  Markdown_Ascii_Angles_2_Column_Table.s()=LSet("-",Len(StringField(RemoveString(Caption.s,#CRLF$),1,"TAB")),"-")+"TAB"+LSet("-",Len(StringField(RemoveString(Caption.s,#CRLF$),2,"TAB")),"-")
  
  ForEach Selected_Angles_from_CIF.AngCIFStructure()
    Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol1=SymCode_to_SymSymbol.s(Selected_Angles_from_CIF.AngCIFStructure()\Symmetrie1)
    Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol2=SymCode_to_SymSymbol.s(Selected_Angles_from_CIF.AngCIFStructure()\Symmetrie2)
    Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol3=SymCode_to_SymSymbol.s(Selected_Angles_from_CIF.AngCIFStructure()\Symmetrie3)
  Next
  
  ForEach Selected_Angles_from_CIF.AngCIFStructure()
    If ListSize(Selected_Angles_from_CIF.AngCIFStructure())
      Select Len(StringField(Selected_Angles_from_CIF.AngCIFStructure()\Winkel,1,".")) ;rueckt Winkel schoener in die Tabelle ein
        Case 1
          AddElement(Markdown_Ascii_Angles_2_Column_Table.s())
          Markdown_Ascii_Angles_2_Column_Table.s() = Selected_Angles_from_CIF.AngCIFStructure()\Atom1 ;+ Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol1 + "-" + Selected_Angles_from_CIF.AngCIFStructure()\Atom2 + Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol2 + "-" + Selected_Angles_from_CIF.AngCIFStructure()\Atom3 + Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol3 + "TAB" + "  " + Selected_Angles_from_CIF.AngCIFStructure()\Winkel
          If Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol1 <> ""
            Markdown_Ascii_Angles_2_Column_Table.s() = Markdown_Ascii_Angles_2_Column_Table.s() + "^" + Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol1 + "^"
          EndIf
          Markdown_Ascii_Angles_2_Column_Table.s() = Markdown_Ascii_Angles_2_Column_Table.s() + "-" +  Selected_Angles_from_CIF.AngCIFStructure()\Atom2 
          If Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol2 <> ""
            Markdown_Ascii_Angles_2_Column_Table.s() = Markdown_Ascii_Angles_2_Column_Table.s() + "^" + Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol2 + "^"
          EndIf
          Markdown_Ascii_Angles_2_Column_Table.s() = Markdown_Ascii_Angles_2_Column_Table.s() + "-" +  Selected_Angles_from_CIF.AngCIFStructure()\Atom3
          If Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol3 <> ""
            Markdown_Ascii_Angles_2_Column_Table.s() = Markdown_Ascii_Angles_2_Column_Table.s() + "^" + Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol3 + "^"
          EndIf
          Markdown_Ascii_Angles_2_Column_Table.s() = Markdown_Ascii_Angles_2_Column_Table.s() + "TAB" + "  " + Selected_Angles_from_CIF.AngCIFStructure()\Winkel
        Case 2
          AddElement(Markdown_Ascii_Angles_2_Column_Table.s())
          Markdown_Ascii_Angles_2_Column_Table.s() = Selected_Angles_from_CIF.AngCIFStructure()\Atom1 ;+ Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol1 + "-" + Selected_Angles_from_CIF.AngCIFStructure()\Atom2 + Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol2 + "-" + Selected_Angles_from_CIF.AngCIFStructure()\Atom3 + Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol3 + "TAB" + " " + Selected_Angles_from_CIF.AngCIFStructure()\Winkel 
          If Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol1 <> ""
            Markdown_Ascii_Angles_2_Column_Table.s() = Markdown_Ascii_Angles_2_Column_Table.s() + "^" + Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol1 + "^"
          EndIf
          Markdown_Ascii_Angles_2_Column_Table.s() = Markdown_Ascii_Angles_2_Column_Table.s() + "-" +  Selected_Angles_from_CIF.AngCIFStructure()\Atom2 
          If Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol2 <> ""
            Markdown_Ascii_Angles_2_Column_Table.s() = Markdown_Ascii_Angles_2_Column_Table.s() + "^" + Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol2 + "^"
          EndIf
          Markdown_Ascii_Angles_2_Column_Table.s() = Markdown_Ascii_Angles_2_Column_Table.s() + "-" +  Selected_Angles_from_CIF.AngCIFStructure()\Atom3
          If Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol3 <> ""
            Markdown_Ascii_Angles_2_Column_Table.s() = Markdown_Ascii_Angles_2_Column_Table.s() + "^" + Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol3 + "^"
          EndIf
          Markdown_Ascii_Angles_2_Column_Table.s() = Markdown_Ascii_Angles_2_Column_Table.s() + "TAB" + " " + Selected_Angles_from_CIF.AngCIFStructure()\Winkel
        Default
          AddElement(Markdown_Ascii_Angles_2_Column_Table.s())
          Markdown_Ascii_Angles_2_Column_Table.s() = Selected_Angles_from_CIF.AngCIFStructure()\Atom1 
          If Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol1 <> ""
            Markdown_Ascii_Angles_2_Column_Table.s() = Markdown_Ascii_Angles_2_Column_Table.s() + "^" + Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol1 + "^"
          EndIf
          Markdown_Ascii_Angles_2_Column_Table.s() = Markdown_Ascii_Angles_2_Column_Table.s() + "-" +  Selected_Angles_from_CIF.AngCIFStructure()\Atom2 
          If Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol2 <> ""
            Markdown_Ascii_Angles_2_Column_Table.s() = Markdown_Ascii_Angles_2_Column_Table.s() + "^" + Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol2 + "^"
          EndIf
          Markdown_Ascii_Angles_2_Column_Table.s() = Markdown_Ascii_Angles_2_Column_Table.s() + "-" +  Selected_Angles_from_CIF.AngCIFStructure()\Atom3
          If Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol3 <> ""
            Markdown_Ascii_Angles_2_Column_Table.s() = Markdown_Ascii_Angles_2_Column_Table.s() + "^" + Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol3 + "^"
          EndIf
          Markdown_Ascii_Angles_2_Column_Table.s() = Markdown_Ascii_Angles_2_Column_Table.s() + "TAB" + Selected_Angles_from_CIF.AngCIFStructure()\Winkel
      EndSelect
    EndIf
  Next
  
  ForEach Markdown_Ascii_Angles_2_Column_Table.s()
    If FindString(Markdown_Ascii_Angles_2_Column_Table.s(),"TAB")
      If Len(StringField(Markdown_Ascii_Angles_2_Column_Table.s(),1,"TAB")) >  Max_Char_Column.i
        Max_Char_Column.i=Len(StringField(Markdown_Ascii_Angles_2_Column_Table.s(),1,"TAB"))
      EndIf
    EndIf
  Next 
  
  ;Tabelle tabulieren
  ForEach Markdown_Ascii_Angles_2_Column_Table.s()
    If FindString(Markdown_Ascii_Angles_2_Column_Table.s(),"TAB")
      Numer_of_Spaces_to_Insert.i = Max_Char_Column.i + 4 - Len(StringField(Markdown_Ascii_Angles_2_Column_Table.s(),1,"TAB")) 
      Markdown_Ascii_Angles_2_Column_Table.s()=ReplaceString(Markdown_Ascii_Angles_2_Column_Table.s(),"TAB",Space(Numer_of_Spaces_to_Insert.i-1) + "|" +Space(3))
    EndIf
  Next
  
  ForEach Markdown_Ascii_Angles_2_Column_Table.s()
    If FindString(Markdown_Ascii_Angles_2_Column_Table.s(),"--")
      Markdown_Ascii_Angles_2_Column_Table.s()=ReplaceString(Markdown_Ascii_Angles_2_Column_Table.s()," ","-")
      Break
    EndIf
  Next
  
  LastElement(Markdown_Ascii_Angles_2_Column_Table.s())
  AddElement(Markdown_Ascii_Angles_2_Column_Table.s())
  Markdown_Ascii_Angles_2_Column_Table.s()=""
    
EndProcedure

Procedure Create_Angles_4_Column_Table_RTF(List Selected_Angles_from_CIF.AngCIFStructure())
  
  #LeerzeileRTF="{\pard\plain \f0\fs24 \par}"
  #TR1="{\trowd\trgaph108\trql\cellx3600\cellx7200\pard\intbl \f0\fs24 "
  #TR2="\cell\pard\intbl \f0\fs24 " 
  #TR3="\cell\row}"
  #TR14="{\trowd\trgaph108\trql\cellx2500\cellx4200\cellx6700\cellx8400\pard\intbl \f0\fs24 "
  
;   Define SymopSymbol.s
;   Define SymCodeSatz.s 
;   Define SymOpNummer_in_CIF.i
;   Define SymOpCode_in_CIF.s
;   Define CurrentSymOp.s
  Protected NumberOfRowsAngles.i
  Protected i.i
  
  Protected NewList Selected_Angles_from_CIF_Columns1and2.AngCIFStructure()
  Protected NewList Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()
  
  NumberOfRowsAngles.i=Round(ListSize(Selected_Angles_from_CIF.AngCIFStructure())/2,#PB_Round_Nearest)
  
  ClearList(RTF_Angles_4_Column_Table.s())
  
  ForEach Selected_Angles_from_CIF.AngCIFStructure()
    Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol1=SymCode_to_SymSymbol.s(Selected_Angles_from_CIF.AngCIFStructure()\Symmetrie1)
    Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol2=SymCode_to_SymSymbol.s(Selected_Angles_from_CIF.AngCIFStructure()\Symmetrie2)
  Next
  
  CopyList(Selected_Angles_from_CIF.AngCIFStructure(),Selected_Angles_from_CIF_Columns1and2.AngCIFStructure())
  SelectElement(Selected_Angles_from_CIF_Columns1and2.AngCIFStructure(), NumberOfRowsAngles.i)
  SplitList(Selected_Angles_from_CIF_Columns1and2.AngCIFStructure(),Selected_Angles_from_CIF_Columns3and4.AngCIFStructure())  
  
  If ListSize(Selected_Angles_from_CIF_Columns1and2.AngCIFStructure()) > ListSize(Selected_Angles_from_CIF_Columns3and4.AngCIFStructure())
    LastElement(Selected_Angles_from_CIF_Columns3and4.AngCIFStructure())
    AddElement(Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()) 
    Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\Atom1.s="xxx"
    Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\Atom2.s="xxx"
    Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\Atom3.s="xxx"
    Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\SymmetrieSymbol1=""
    Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\SymmetrieSymbol2=""
    Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\SymmetrieSymbol3=""
    Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\Winkel=""
  EndIf

  ;Tabelle erzeugen
  
  ForEach Selected_Angles_from_CIF_Columns1and2.AngCIFStructure()
    If ListSize(Selected_Angles_from_CIF_Columns1and2.AngCIFStructure())
      Select Len(StringField(Selected_Angles_from_CIF_Columns1and2.AngCIFStructure()\Winkel,1,".")) ;rueckt Winkel schoener in die Tabelle ein
        Case 1
          Selected_Angles_from_CIF_Columns1and2.AngCIFStructure()\Winkel=Space(2)+Selected_Angles_from_CIF_Columns1and2.AngCIFStructure()\Winkel
        Case 2
          Selected_Angles_from_CIF_Columns1and2.AngCIFStructure()\Winkel=Space(1)+Selected_Angles_from_CIF_Columns1and2.AngCIFStructure()\Winkel 
      EndSelect
    EndIf
  Next
  
  ForEach Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()
    If ListSize(Selected_Angles_from_CIF_Columns3and4.AngCIFStructure())
      Select Len(StringField(Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\Winkel,1,".")) ;rueckt Winkel schoener in die Tabelle ein
        Case 1
          Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\Winkel=Space(2)+Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\Winkel
        Case 2
          Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\Winkel=Space(1)+Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\Winkel 
      EndSelect
    EndIf
  Next
  
  FirstElement(Selected_Angles_from_CIF_Columns1and2.AngCIFStructure())
  FirstElement(Selected_Angles_from_CIF_Columns3and4.AngCIFStructure())
  
  For i = 1 To  NumberOfRowsAngles.i
    AddElement(RTF_Angles_4_Column_Table.s())
    RTF_Angles_4_Column_Table.s() + #TR14 
    RTF_Angles_4_Column_Table.s() + Selected_Angles_from_CIF_Columns1and2.AngCIFStructure()\Atom1 + Selected_Angles_from_CIF_Columns1and2.AngCIFStructure()\SymmetrieSymbol1 
    RTF_Angles_4_Column_Table.s() + "-" + Selected_Angles_from_CIF_Columns1and2.AngCIFStructure()\Atom2 + Selected_Angles_from_CIF_Columns1and2.AngCIFStructure()\SymmetrieSymbol2  
    RTF_Angles_4_Column_Table.s() + "-" + Selected_Angles_from_CIF_Columns1and2.AngCIFStructure()\Atom3 + Selected_Angles_from_CIF_Columns1and2.AngCIFStructure()\SymmetrieSymbol3 
    RTF_Angles_4_Column_Table.s() +  #TR2 + Selected_Angles_from_CIF_Columns1and2.AngCIFStructure()\Winkel + #TR2 + Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\Atom1 
    RTF_Angles_4_Column_Table.s() + Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\SymmetrieSymbol1 + "-" + Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\Atom2 
    RTF_Angles_4_Column_Table.s() + Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\SymmetrieSymbol2 + "-" + Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\Atom3
    RTF_Angles_4_Column_Table.s() + Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\SymmetrieSymbol3                                
    RTF_Angles_4_Column_Table.s() + #TR2 + Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\Winkel + #TR3
    RTF_Angles_4_Column_Table.s()=RemoveString(RTF_Angles_4_Column_Table.s(),"xxx-xxx-xxx")
    NextElement(Selected_Angles_from_CIF_Columns1and2.AngCIFStructure())
    NextElement(Selected_Angles_from_CIF_Columns3and4.AngCIFStructure())
  Next
   
EndProcedure

Procedure Create_Angles_4_Column_Table_LaTeX(List Selected_Angles_from_CIF.AngCIFStructure())
  
  Define NumberOfRowsAngles.i
  Define i.i
  
  NewList Selected_Angles_from_CIF_Columns1and2.AngCIFStructure()
  NewList Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()
  
  NumberOfRowsAngles.i=Round(ListSize(Selected_Angles_from_CIF.AngCIFStructure())/2,#PB_Round_Nearest)
  
  ClearList(LaTeX_Angles_4_Column_Table.s())
  
  ForEach Selected_Angles_from_CIF.AngCIFStructure()
    Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol1=SymCode_to_SymSymbol.s(Selected_Angles_from_CIF.AngCIFStructure()\Symmetrie1)
    Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol2=SymCode_to_SymSymbol.s(Selected_Angles_from_CIF.AngCIFStructure()\Symmetrie2)
  Next
  
  CopyList(Selected_Angles_from_CIF.AngCIFStructure(),Selected_Angles_from_CIF_Columns1and2.AngCIFStructure())
  SelectElement(Selected_Angles_from_CIF_Columns1and2.AngCIFStructure(), NumberOfRowsAngles.i)
  SplitList(Selected_Angles_from_CIF_Columns1and2.AngCIFStructure(),Selected_Angles_from_CIF_Columns3and4.AngCIFStructure())  
  
  If ListSize(Selected_Angles_from_CIF_Columns1and2.AngCIFStructure()) > ListSize(Selected_Angles_from_CIF_Columns3and4.AngCIFStructure())
    LastElement(Selected_Angles_from_CIF_Columns3and4.AngCIFStructure())
    AddElement(Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()) 
    Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\Atom1.s="xxx"
    Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\Atom2.s="xxx"
    Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\Atom3.s="xxx"
    Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\SymmetrieSymbol1="xxx"
    Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\SymmetrieSymbol2="xxx"
    Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\SymmetrieSymbol3="xxx"
    Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\Winkel=""
  EndIf

  ;Tabelle erzeugen
  
  FirstElement(Selected_Angles_from_CIF_Columns1and2.AngCIFStructure())
  FirstElement(Selected_Angles_from_CIF_Columns3and4.AngCIFStructure())
  
  
  For i = 1 To  NumberOfRowsAngles.i
    AddElement(LaTeX_Angles_4_Column_Table.s())
    LaTeX_Angles_4_Column_Table.s() + Selected_Angles_from_CIF_Columns1and2.AngCIFStructure()\Atom1 + "$^{" + Selected_Angles_from_CIF_Columns1and2.AngCIFStructure()\SymmetrieSymbol1 + "}$" 
    LaTeX_Angles_4_Column_Table.s() + "--" + Selected_Angles_from_CIF_Columns1and2.AngCIFStructure()\Atom2 + "$^{" +  Selected_Angles_from_CIF_Columns1and2.AngCIFStructure()\SymmetrieSymbol2 + "}$"
    LaTeX_Angles_4_Column_Table.s() + "--" + Selected_Angles_from_CIF_Columns1and2.AngCIFStructure()\Atom3 + "$^{" + Selected_Angles_from_CIF_Columns1and2.AngCIFStructure()\SymmetrieSymbol3  + "}$"
    LaTeX_Angles_4_Column_Table.s() +  " & " + Selected_Angles_from_CIF_Columns1and2.AngCIFStructure()\Winkel + " & " + Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\Atom1 
    LaTeX_Angles_4_Column_Table.s() + "$^{" +  Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\SymmetrieSymbol1 + "}$" + "--" + Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\Atom2 
    LaTeX_Angles_4_Column_Table.s() + "$^{" +  Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\SymmetrieSymbol2 + "}$" + "--" + Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\Atom3
    LaTeX_Angles_4_Column_Table.s() + "$^{" +  Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\SymmetrieSymbol3 + "}$"                               
    LaTeX_Angles_4_Column_Table.s() +  " & " + Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\Winkel + " \\"
    LaTeX_Angles_4_Column_Table.s() = RemoveString(LaTeX_Angles_4_Column_Table.s(),"xxx$^{xxx}$--xxx$^{xxx}$--xxx$^{xxx}$")
    NextElement(Selected_Angles_from_CIF_Columns1and2.AngCIFStructure()) 
    NextElement(Selected_Angles_from_CIF_Columns3and4.AngCIFStructure())
  Next  
  
;     ForEach SymCode_to_SymSymbol.s()
;       Debug MapKey(SymCode_to_SymSymbol.s()) + ":  " + SymCode_to_SymSymbol.s()
;     Next  
;     
;     ForEach List_of_SymOps_in_Bonds.s()
;       Debug List_of_SymOps_in_Bonds.s()
;     Next
  ;
  ;   ForEach Bond_Lenghts_from_CIF.DistCIFStructure()
  ;     Debug "Alles " + Bond_Lenghts_from_CIF.DistCIFStructure()\Alles
  ;     Debug "Atom1 " + Bond_Lenghts_from_CIF.DistCIFStructure()\Atom1
  ;     Debug "Atom2 " + Bond_Lenghts_from_CIF.DistCIFStructure()\Atom2
  ;     Debug "Element1 " + Bond_Lenghts_from_CIF.DistCIFStructure()\Element1
  ;     Debug "Element2 " + Bond_Lenghts_from_CIF.DistCIFStructure()\Element2
  ;     Debug "Abstand " + Bond_Lenghts_from_CIF.DistCIFStructure()\Abstand
  ;     Debug "AbstandNum " + Bond_Lenghts_from_CIF.DistCIFStructure()\AbstandNum
  ;     Debug "EsdNum " + Bond_Lenghts_from_CIF.DistCIFStructure()\EsdNum
  ;     Debug "Sym1 " + Bond_Lenghts_from_CIF.DistCIFStructure()\Symmetrie1
  ;     Debug "Sym2 " + Bond_Lenghts_from_CIF.DistCIFStructure()\Symmetrie2
  ;     Debug "SymSymbol1 " + Bond_Lenghts_from_CIF.DistCIFStructure()\SymmetrieSymbol1
  ;     Debug "SymSymbol2 " + Bond_Lenghts_from_CIF.DistCIFStructure()\SymmetrieSymbol2
  ;   Next
  
EndProcedure

Procedure Create_Angles_4_Column_Table_Ascii(List Selected_Angles_from_CIF.AngCIFStructure(),Caption.s)
  
  Protected NumberOfRowsAngles.i
  Protected i.i
  
  Protected NewList Selected_Angles_from_CIF_Columns1and2.AngCIFStructure()
  Protected NewList Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()
  
  NumberOfRowsAngles.i=Round(ListSize(Selected_Angles_from_CIF.AngCIFStructure())/2,#PB_Round_Nearest)
  
  ClearList(Ascii_Angles_4_Column_Table.s())
  
  Caption.s=ReplaceString(Caption.s,"TAB","TB1",#PB_String_CaseSensitive,0,1)
  Caption.s=ReplaceString(Caption.s,"TAB","TB2",#PB_String_CaseSensitive,0,1)
  Caption.s=ReplaceString(Caption.s,"TAB","TB3",#PB_String_CaseSensitive,0,1)
  Caption.s=ReplaceString(Caption.s,"TB1","TAB",#PB_String_CaseSensitive,0,1)
  
  AddElement(Ascii_Angles_4_Column_Table.s())
  Ascii_Angles_4_Column_Table.s()=RemoveString(Caption.s,#CRLF$)
  
  ForEach Selected_Angles_from_CIF.AngCIFStructure()
    Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol1=SymCode_to_SymSymbol.s(Selected_Angles_from_CIF.AngCIFStructure()\Symmetrie1)
    Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol2=SymCode_to_SymSymbol.s(Selected_Angles_from_CIF.AngCIFStructure()\Symmetrie2)
  Next
  
  CopyList(Selected_Angles_from_CIF.AngCIFStructure(),Selected_Angles_from_CIF_Columns1and2.AngCIFStructure())
  SelectElement(Selected_Angles_from_CIF_Columns1and2.AngCIFStructure(), NumberOfRowsAngles.i)
  SplitList(Selected_Angles_from_CIF_Columns1and2.AngCIFStructure(),Selected_Angles_from_CIF_Columns3and4.AngCIFStructure())  
  
  If ListSize(Selected_Angles_from_CIF_Columns1and2.AngCIFStructure()) > ListSize(Selected_Angles_from_CIF_Columns3and4.AngCIFStructure())
    LastElement(Selected_Angles_from_CIF_Columns3and4.AngCIFStructure())
    AddElement(Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()) 
    Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\Atom1.s="xxx"
    Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\Atom2.s="xxx"
    Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\Atom3.s="xxx"
    Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\SymmetrieSymbol1="xxx"
    Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\SymmetrieSymbol2="xxx"
    Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\SymmetrieSymbol3="xxx"
    Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\Winkel=""
  EndIf
  
  ForEach Selected_Angles_from_CIF_Columns1and2.AngCIFStructure()
    If ListSize(Selected_Angles_from_CIF_Columns1and2.AngCIFStructure())
      Select Len(StringField(Selected_Angles_from_CIF_Columns1and2.AngCIFStructure()\Winkel,1,".")) ;rueckt Winkel schoener in die Tabelle ein
        Case 1
          Selected_Angles_from_CIF_Columns1and2.AngCIFStructure()\Winkel=Space(2)+Selected_Angles_from_CIF_Columns1and2.AngCIFStructure()\Winkel
        Case 2
          Selected_Angles_from_CIF_Columns1and2.AngCIFStructure()\Winkel=Space(1)+Selected_Angles_from_CIF_Columns1and2.AngCIFStructure()\Winkel 
      EndSelect
    EndIf
  Next
  
  ForEach Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()
    If ListSize(Selected_Angles_from_CIF_Columns3and4.AngCIFStructure())
      Select Len(StringField(Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\Winkel,1,".")) ;rueckt Winkel schoener in die Tabelle ein
        Case 1
          Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\Winkel=Space(2)+Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\Winkel
        Case 2
          Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\Winkel=Space(1)+Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\Winkel 
      EndSelect
    EndIf
  Next
  
  ;Tabelle erzeugen
  
  FirstElement(Selected_Angles_from_CIF_Columns1and2.AngCIFStructure())
  FirstElement(Selected_Angles_from_CIF_Columns3and4.AngCIFStructure())
  
  
  For i = 1 To  NumberOfRowsAngles.i
    AddElement(Ascii_Angles_4_Column_Table.s())
    Ascii_Angles_4_Column_Table.s() + Selected_Angles_from_CIF_Columns1and2.AngCIFStructure()\Atom1 + Selected_Angles_from_CIF_Columns1and2.AngCIFStructure()\SymmetrieSymbol1 
    Ascii_Angles_4_Column_Table.s() + "-" + Selected_Angles_from_CIF_Columns1and2.AngCIFStructure()\Atom2 + Selected_Angles_from_CIF_Columns1and2.AngCIFStructure()\SymmetrieSymbol2
    Ascii_Angles_4_Column_Table.s() + "-" + Selected_Angles_from_CIF_Columns1and2.AngCIFStructure()\Atom3 + Selected_Angles_from_CIF_Columns1and2.AngCIFStructure()\SymmetrieSymbol3 
    Ascii_Angles_4_Column_Table.s() + "TAB" + Selected_Angles_from_CIF_Columns1and2.AngCIFStructure()\Winkel + "TB2" + Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\Atom1 
    Ascii_Angles_4_Column_Table.s() + Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\SymmetrieSymbol1 + "-" + Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\Atom2 
    Ascii_Angles_4_Column_Table.s() + Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\SymmetrieSymbol2 + "-" + Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\Atom3
    Ascii_Angles_4_Column_Table.s() + Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\SymmetrieSymbol3                               
    Ascii_Angles_4_Column_Table.s() + "TB3" + Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\Winkel 
    Ascii_Angles_4_Column_Table.s() = RemoveString(Ascii_Angles_4_Column_Table.s(),"xxxxxx-xxxxxx-xxxxxx")
    NextElement(Selected_Angles_from_CIF_Columns1and2.AngCIFStructure()) 
    NextElement(Selected_Angles_from_CIF_Columns3and4.AngCIFStructure())
  Next  
  

  ForEach Ascii_Angles_4_Column_Table.s()
    If FindString(Ascii_Angles_4_Column_Table.s(),"TAB")
      If Len(StringField(Ascii_Angles_4_Column_Table.s(),1,"TAB")) >  Max_Char_Column.i
        Max_Char_Column.i=Len(StringField(Ascii_Angles_4_Column_Table.s(),1,"TAB"))
      EndIf
    EndIf
  Next 
  
  ;Tabelle tabulieren
  ForEach Ascii_Angles_4_Column_Table.s()
    If FindString(Ascii_Angles_4_Column_Table.s(),"TAB")
      Numer_of_Spaces_to_Insert.i = Max_Char_Column.i + 4 - Len(StringField(Ascii_Angles_4_Column_Table.s(),1,"TAB")) 
      Ascii_Angles_4_Column_Table.s()=ReplaceString(Ascii_Angles_4_Column_Table.s(),"TAB",Space(Numer_of_Spaces_to_Insert.i))
    EndIf
  Next
  
  ForEach Ascii_Angles_4_Column_Table.s()
    If FindString(Ascii_Angles_4_Column_Table.s(),"TB2")
      If Len(StringField(Ascii_Angles_4_Column_Table.s(),1,"TB2")) >  Max_Char_Column.i
        Max_Char_Column.i=Len(StringField(Ascii_Angles_4_Column_Table.s(),1,"TB2"))
      EndIf
    EndIf
  Next 
  ForEach Ascii_Angles_4_Column_Table.s()
    If FindString(Ascii_Angles_4_Column_Table.s(),"TB2")
      Numer_of_Spaces_to_Insert.i = Max_Char_Column.i + 4 - Len(StringField(Ascii_Angles_4_Column_Table.s(),1,"TB2")) 
     Ascii_Angles_4_Column_Table.s()=ReplaceString(Ascii_Angles_4_Column_Table.s(),"TB2",Space(Numer_of_Spaces_to_Insert.i))
    EndIf
  Next
  
  ForEach Ascii_Angles_4_Column_Table.s()
    If FindString(Ascii_Angles_4_Column_Table.s(),"TB3")
      If Len(StringField(Ascii_Angles_4_Column_Table.s(),1,"TB3")) >  Max_Char_Column.i
        Max_Char_Column.i=Len(StringField(Ascii_Angles_4_Column_Table.s(),1,"TB3"))
      EndIf
    EndIf
  Next 
  
  ForEach Ascii_Angles_4_Column_Table.s()
    If FindString(Ascii_Angles_4_Column_Table.s(),"TB3")
      Numer_of_Spaces_to_Insert.i = Max_Char_Column.i + 4 - Len(StringField(Ascii_Angles_4_Column_Table.s(),1,"TB3")) 
      Ascii_Angles_4_Column_Table.s()=ReplaceString(Ascii_Angles_4_Column_Table.s(),"TB3",Space(Numer_of_Spaces_to_Insert.i))
    EndIf
  Next
  
EndProcedure

Procedure Create_Angles_4_Column_Table_Markdown_Ascii(List Selected_Angles_from_CIF.AngCIFStructure(),Caption.s)

  Protected NumberOfRowsAngles.i
  Protected i.i
  Protected Markdown_Helper_String.s
  
  Protected NewList Selected_Angles_from_CIF_Columns1and2.AngCIFStructure()
  Protected NewList Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()
  
  NumberOfRowsAngles.i=Round(ListSize(Selected_Angles_from_CIF.AngCIFStructure())/2,#PB_Round_Nearest)
  
  ClearList(Markdown_Ascii_Angles_4_Column_Table.s())
  
  Markdown_Helper_String.s = LSet("-",Len(StringField(RemoveString(Caption.s,#CRLF$),1,"TAB")),"-") + "TAB" + LSet("-",Len(StringField(RemoveString(Caption.s,#CRLF$),2,"TAB")),"-") + "TAB" + LSet("-",Len(StringField(RemoveString(Caption.s,#CRLF$),3,"TAB")),"-") + "TAB" + LSet("-",Len(StringField(RemoveString(Caption.s,#CRLF$),4,"TAB")),"-")
  
  Caption.s=ReplaceString(Caption.s,"TAB","TB1",#PB_String_CaseSensitive,0,1)
  Caption.s=ReplaceString(Caption.s,"TAB","TB2",#PB_String_CaseSensitive,0,1)
  Caption.s=ReplaceString(Caption.s,"TAB","TB3",#PB_String_CaseSensitive,0,1)
  Caption.s=ReplaceString(Caption.s,"TB1","TAB",#PB_String_CaseSensitive,0,1)
  
  Markdown_Helper_String.s=ReplaceString(Markdown_Helper_String.s,"TAB","TB1",#PB_String_CaseSensitive,0,1)
  Markdown_Helper_String.s=ReplaceString(Markdown_Helper_String.s,"TAB","TB2",#PB_String_CaseSensitive,0,1)
  Markdown_Helper_String.s=ReplaceString(Markdown_Helper_String.s,"TAB","TB3",#PB_String_CaseSensitive,0,1)
  Markdown_Helper_String.s=ReplaceString(Markdown_Helper_String.s,"TB1","TAB",#PB_String_CaseSensitive,0,1)
  
  AddElement(Markdown_Ascii_Angles_4_Column_Table.s())
  Markdown_Ascii_Angles_4_Column_Table.s()=""
  
  AddElement(Markdown_Ascii_Angles_4_Column_Table.s())
  Markdown_Ascii_Angles_4_Column_Table.s()=RemoveString(Caption.s,#CRLF$)
  
  AddElement(Markdown_Ascii_Angles_4_Column_Table.s())
  Markdown_Ascii_Angles_4_Column_Table.s()=Markdown_Helper_String.s
  
  ForEach Selected_Angles_from_CIF.AngCIFStructure()
    Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol1=SymCode_to_SymSymbol.s(Selected_Angles_from_CIF.AngCIFStructure()\Symmetrie1)
    Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol2=SymCode_to_SymSymbol.s(Selected_Angles_from_CIF.AngCIFStructure()\Symmetrie2)
  Next
  
  CopyList(Selected_Angles_from_CIF.AngCIFStructure(),Selected_Angles_from_CIF_Columns1and2.AngCIFStructure())
  SelectElement(Selected_Angles_from_CIF_Columns1and2.AngCIFStructure(), NumberOfRowsAngles.i)
  SplitList(Selected_Angles_from_CIF_Columns1and2.AngCIFStructure(),Selected_Angles_from_CIF_Columns3and4.AngCIFStructure())  
  
  If ListSize(Selected_Angles_from_CIF_Columns1and2.AngCIFStructure()) > ListSize(Selected_Angles_from_CIF_Columns3and4.AngCIFStructure())
    LastElement(Selected_Angles_from_CIF_Columns3and4.AngCIFStructure())
    AddElement(Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()) 
    Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\Atom1.s="xxx"
    Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\Atom2.s="xxx"
    Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\Atom3.s="xxx"
    Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\SymmetrieSymbol1="xxx"
    Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\SymmetrieSymbol2="xxx"
    Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\SymmetrieSymbol3="xxx"
    Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\Winkel=""
  EndIf
  
  ForEach Selected_Angles_from_CIF_Columns1and2.AngCIFStructure()
    If ListSize(Selected_Angles_from_CIF_Columns1and2.AngCIFStructure())
      Select Len(StringField(Selected_Angles_from_CIF_Columns1and2.AngCIFStructure()\Winkel,1,".")) ;rueckt Winkel schoener in die Tabelle ein
        Case 1
          Selected_Angles_from_CIF_Columns1and2.AngCIFStructure()\Winkel=Space(2)+Selected_Angles_from_CIF_Columns1and2.AngCIFStructure()\Winkel
        Case 2
          Selected_Angles_from_CIF_Columns1and2.AngCIFStructure()\Winkel=Space(1)+Selected_Angles_from_CIF_Columns1and2.AngCIFStructure()\Winkel 
      EndSelect
    EndIf
  Next
  
  ForEach Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()
    If ListSize(Selected_Angles_from_CIF_Columns3and4.AngCIFStructure())
      Select Len(StringField(Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\Winkel,1,".")) ;rueckt Winkel schoener in die Tabelle ein
        Case 1
          Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\Winkel=Space(2)+Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\Winkel
        Case 2
          Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\Winkel=Space(1)+Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\Winkel 
      EndSelect
    EndIf
  Next
  
  ;Tabelle erzeugen
  
  FirstElement(Selected_Angles_from_CIF_Columns1and2.AngCIFStructure())
  FirstElement(Selected_Angles_from_CIF_Columns3and4.AngCIFStructure())
  
  
  For i = 1 To  NumberOfRowsAngles.i
    AddElement(Markdown_Ascii_Angles_4_Column_Table.s())
    Markdown_Ascii_Angles_4_Column_Table.s() + Selected_Angles_from_CIF_Columns1and2.AngCIFStructure()\Atom1; + Selected_Angles_from_CIF_Columns1and2.AngCIFStructure()\SymmetrieSymbol1 
    If Selected_Angles_from_CIF_Columns1and2.AngCIFStructure()\SymmetrieSymbol1 <> ""
      Markdown_Ascii_Angles_4_Column_Table.s() + "^" + Selected_Angles_from_CIF_Columns1and2.AngCIFStructure()\SymmetrieSymbol1 + "^"
    EndIf
    Markdown_Ascii_Angles_4_Column_Table.s() + "-" + Selected_Angles_from_CIF_Columns1and2.AngCIFStructure()\Atom2 
    If Selected_Angles_from_CIF_Columns1and2.AngCIFStructure()\SymmetrieSymbol2 <> ""
      Markdown_Ascii_Angles_4_Column_Table.s() + "^" + Selected_Angles_from_CIF_Columns1and2.AngCIFStructure()\SymmetrieSymbol2 + "^"
    EndIf
    Markdown_Ascii_Angles_4_Column_Table.s() + "-" + Selected_Angles_from_CIF_Columns1and2.AngCIFStructure()\Atom3
    If Selected_Angles_from_CIF_Columns1and2.AngCIFStructure()\SymmetrieSymbol3 <> ""
      Markdown_Ascii_Angles_4_Column_Table.s() + "^" + Selected_Angles_from_CIF_Columns1and2.AngCIFStructure()\SymmetrieSymbol3 + "^"
    EndIf
    Markdown_Ascii_Angles_4_Column_Table.s() + "TAB" + Selected_Angles_from_CIF_Columns1and2.AngCIFStructure()\Winkel + "TB2" + Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\Atom1 
    If Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\SymmetrieSymbol1 <> ""
      Markdown_Ascii_Angles_4_Column_Table.s() + "^" + Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\SymmetrieSymbol1 + "^"
    EndIf
    Markdown_Ascii_Angles_4_Column_Table.s() + "-" + Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\Atom2
    If Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\SymmetrieSymbol2 <> ""
      Markdown_Ascii_Angles_4_Column_Table.s() + "^" + Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\SymmetrieSymbol2 + "^"
    EndIf
    Markdown_Ascii_Angles_4_Column_Table.s() + "-" + Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\Atom3
    If Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\SymmetrieSymbol3 <> ""
      Markdown_Ascii_Angles_4_Column_Table.s() + "^" + Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\SymmetrieSymbol3 + "^"
    EndIf
    Markdown_Ascii_Angles_4_Column_Table.s() + "TB3" + Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\Winkel 
    ;Markdown_Ascii_Angles_4_Column_Table.s() + "-" + Selected_Angles_from_CIF_Columns1and2.AngCIFStructure()\Atom2 + Selected_Angles_from_CIF_Columns1and2.AngCIFStructure()\SymmetrieSymbol2
    ;Markdown_Ascii_Angles_4_Column_Table.s() + "-" + Selected_Angles_from_CIF_Columns1and2.AngCIFStructure()\Atom3 + Selected_Angles_from_CIF_Columns1and2.AngCIFStructure()\SymmetrieSymbol3 
;     Markdown_Ascii_Angles_4_Column_Table.s() + "TAB" + Selected_Angles_from_CIF_Columns1and2.AngCIFStructure()\Winkel + "TB2" + Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\Atom1 
;     Markdown_Ascii_Angles_4_Column_Table.s() + Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\SymmetrieSymbol1 + "-" + Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\Atom2 
;     Markdown_Ascii_Angles_4_Column_Table.s() + Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\SymmetrieSymbol2 + "-" + Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\Atom3
;     Markdown_Ascii_Angles_4_Column_Table.s() + Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\SymmetrieSymbol3                               
;     Markdown_Ascii_Angles_4_Column_Table.s() + "TB3" + Selected_Angles_from_CIF_Columns3and4.AngCIFStructure()\Winkel 
    Markdown_Ascii_Angles_4_Column_Table.s() = RemoveString(Markdown_Ascii_Angles_4_Column_Table.s(),"xxx^xxx^-xxx^xxx^-xxx^xxx^")
    NextElement(Selected_Angles_from_CIF_Columns1and2.AngCIFStructure()) 
    NextElement(Selected_Angles_from_CIF_Columns3and4.AngCIFStructure())
  Next  
  

  ForEach Markdown_Ascii_Angles_4_Column_Table.s()
    If FindString(Markdown_Ascii_Angles_4_Column_Table.s(),"TAB")
      If Len(StringField(Markdown_Ascii_Angles_4_Column_Table.s(),1,"TAB")) >  Max_Char_Column.i
        Max_Char_Column.i=Len(StringField(Markdown_Ascii_Angles_4_Column_Table.s(),1,"TAB"))
      EndIf
    EndIf
  Next 
  
  ;Tabelle tabulieren
  ForEach Markdown_Ascii_Angles_4_Column_Table.s()
    If FindString(Markdown_Ascii_Angles_4_Column_Table.s(),"TAB")
      Numer_of_Spaces_to_Insert.i = Max_Char_Column.i + 4 - Len(StringField(Markdown_Ascii_Angles_4_Column_Table.s(),1,"TAB")) 
      Markdown_Ascii_Angles_4_Column_Table.s()=ReplaceString(Markdown_Ascii_Angles_4_Column_Table.s(),"TAB",Space(Numer_of_Spaces_to_Insert.i-1) + "|" +Space(3))
    EndIf
  Next
  
  ForEach Markdown_Ascii_Angles_4_Column_Table.s()
    If FindString(Markdown_Ascii_Angles_4_Column_Table.s(),"TB2")
      If Len(StringField(Markdown_Ascii_Angles_4_Column_Table.s(),1,"TB2")) >  Max_Char_Column.i
        Max_Char_Column.i=Len(StringField(Markdown_Ascii_Angles_4_Column_Table.s(),1,"TB2"))
      EndIf
    EndIf
  Next 
  ForEach Markdown_Ascii_Angles_4_Column_Table.s()
    If FindString(Markdown_Ascii_Angles_4_Column_Table.s(),"TB2")
      Numer_of_Spaces_to_Insert.i = Max_Char_Column.i + 4 - Len(StringField(Markdown_Ascii_Angles_4_Column_Table.s(),1,"TB2")) 
     Markdown_Ascii_Angles_4_Column_Table.s()=ReplaceString(Markdown_Ascii_Angles_4_Column_Table.s(),"TB2",Space(Numer_of_Spaces_to_Insert.i-1) + "|" +Space(3))
    EndIf
  Next
  
  ForEach Markdown_Ascii_Angles_4_Column_Table.s()
    If FindString(Markdown_Ascii_Angles_4_Column_Table.s(),"TB3")
      If Len(StringField(Markdown_Ascii_Angles_4_Column_Table.s(),1,"TB3")) >  Max_Char_Column.i
        Max_Char_Column.i=Len(StringField(Markdown_Ascii_Angles_4_Column_Table.s(),1,"TB3"))
      EndIf
    EndIf
  Next 
  
  ForEach Markdown_Ascii_Angles_4_Column_Table.s()
    If FindString(Markdown_Ascii_Angles_4_Column_Table.s(),"TB3")
      Numer_of_Spaces_to_Insert.i = Max_Char_Column.i + 4 - Len(StringField(Markdown_Ascii_Angles_4_Column_Table.s(),1,"TB3")) 
      Markdown_Ascii_Angles_4_Column_Table.s()=ReplaceString(Markdown_Ascii_Angles_4_Column_Table.s(),"TB3",Space(Numer_of_Spaces_to_Insert.i-1) + "|" +Space(3))
    EndIf
  Next
  
  ForEach Markdown_Ascii_Angles_4_Column_Table.s()
    If FindString(Markdown_Ascii_Angles_4_Column_Table.s(),"--")
      Markdown_Ascii_Angles_4_Column_Table.s()=ReplaceString(Markdown_Ascii_Angles_4_Column_Table.s()," ","-")
      Break
    EndIf
  Next
  
  LastElement(Markdown_Ascii_Angles_4_Column_Table.s())
  AddElement(Markdown_Ascii_Angles_4_Column_Table.s())
  Markdown_Ascii_Angles_4_Column_Table.s()=""
  
EndProcedure

Procedure.s Create_Figure_Caption_RTF(List Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),List Selected_Angles_from_CIF.AngCIFStructure())
  
;   Define SymopSymbol.s
;   Define SymCodeSatz.s 
;   Define SymOpNummer_in_CIF.i
;   Define SymOpCode_in_CIF.s
;   Define CurrentSymOp.s
  
  ;#LeerzeileRTF="{\pard\plain \f0\fs24 \par}"
    
  ForEach Selected_Bond_Lenghts_from_CIF.DistCIFStructure()
    Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\SymmetrieSymbol1=SymCode_to_SymSymbol.s(Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\Symmetrie1)
    Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\SymmetrieSymbol2=SymCode_to_SymSymbol.s(Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\Symmetrie2)
  Next
  
  ForEach Selected_Angles_from_CIF.AngCIFStructure()
    Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol1=SymCode_to_SymSymbol.s(Selected_Angles_from_CIF.AngCIFStructure()\Symmetrie1)
    Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol2=SymCode_to_SymSymbol.s(Selected_Angles_from_CIF.AngCIFStructure()\Symmetrie2)
    Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol3=SymCode_to_SymSymbol.s(Selected_Angles_from_CIF.AngCIFStructure()\Symmetrie3)
  Next
  
  RTF_Figure_Caption.s="{\pard \f0\fs24 " 
  
  ForEach Selected_Bond_Lenghts_from_CIF.DistCIFStructure()
    If ListSize(Selected_Bond_Lenghts_from_CIF.DistCIFStructure())
      RTF_Figure_Caption.s = RTF_Figure_Caption.s + Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\Atom1 + Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\SymmetrieSymbol1 + "-" + Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\Atom2 + Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\SymmetrieSymbol2 + " " + Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\Abstand + ", "
    EndIf
  Next
  
  RTF_Figure_Caption.s=Trim(RTF_Figure_Caption.s)
  RTF_Figure_Caption.s=RTrim(RTF_Figure_Caption.s,",")
  RTF_Figure_Caption.s=RTF_Figure_Caption.s + "; "
  
  ForEach Selected_Angles_from_CIF.AngCIFStructure()
    If ListSize(Selected_Angles_from_CIF.AngCIFStructure())
      RTF_Figure_Caption.s = RTF_Figure_Caption.s + Selected_Angles_from_CIF.AngCIFStructure()\Atom1 + Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol1 + "-" + Selected_Angles_from_CIF.AngCIFStructure()\Atom2 + Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol2 + "-" + Selected_Angles_from_CIF.AngCIFStructure()\Atom3 + Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol3 + " " + Selected_Angles_from_CIF.AngCIFStructure()\Winkel + ", "
    EndIf
  Next
  
  RTF_Figure_Caption.s=Trim(RTF_Figure_Caption.s)
  RTF_Figure_Caption.s=RTrim(RTF_Figure_Caption.s,",")
  RTF_Figure_Caption.s= RTF_Figure_Caption.s + ". " + "}"
  
  ProcedureReturn RTF_Figure_Caption.s

EndProcedure

Procedure.s Create_Figure_Caption_LaTeX(List Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),List Selected_Angles_from_CIF.AngCIFStructure())
  
  ForEach Selected_Bond_Lenghts_from_CIF.DistCIFStructure()
    Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\SymmetrieSymbol1=SymCode_to_SymSymbol.s(Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\Symmetrie1)
    Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\SymmetrieSymbol2=SymCode_to_SymSymbol.s(Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\Symmetrie2)
  Next
  
  ForEach Selected_Angles_from_CIF.AngCIFStructure()
    Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol1=SymCode_to_SymSymbol.s(Selected_Angles_from_CIF.AngCIFStructure()\Symmetrie1)
    Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol2=SymCode_to_SymSymbol.s(Selected_Angles_from_CIF.AngCIFStructure()\Symmetrie2)
    Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol3=SymCode_to_SymSymbol.s(Selected_Angles_from_CIF.AngCIFStructure()\Symmetrie3)
  Next
  
  
  ForEach Selected_Bond_Lenghts_from_CIF.DistCIFStructure()
    If ListSize(Selected_Bond_Lenghts_from_CIF.DistCIFStructure())
      LaTeX_Figure_Caption.s = LaTeX_Figure_Caption.s + Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\Atom1 + "$^{" + Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\SymmetrieSymbol1 + "}$" + "--" + Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\Atom2 + "$^{" + Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\SymmetrieSymbol2 + "}$" + " " + Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\Abstand + ", "
    EndIf
  Next
  
  LaTeX_Figure_Caption.s = Trim(LaTeX_Figure_Caption.s)
  LaTeX_Figure_Caption.s = RTrim(LaTeX_Figure_Caption.s,",")
  LaTeX_Figure_Caption.s = LaTeX_Figure_Caption.s + "; "
  
  ForEach Selected_Angles_from_CIF.AngCIFStructure()
    If ListSize(Selected_Angles_from_CIF.AngCIFStructure())
      LaTeX_Figure_Caption.s = LaTeX_Figure_Caption.s + Selected_Angles_from_CIF.AngCIFStructure()\Atom1 + "$^{" + Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol1 + "}$" + "--" + Selected_Angles_from_CIF.AngCIFStructure()\Atom2 + "$^{" +  Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol2 + "}$" + "--" + Selected_Angles_from_CIF.AngCIFStructure()\Atom3 + "$^{" + Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol3 + "}$" + " " + Selected_Angles_from_CIF.AngCIFStructure()\Winkel + ", "
    EndIf
  Next
  
  LaTeX_Figure_Caption.s = Trim(LaTeX_Figure_Caption.s)
  LaTeX_Figure_Caption.s = RTrim(LaTeX_Figure_Caption.s,",")
  LaTeX_Figure_Caption.s = LaTeX_Figure_Caption.s + ". "
  
  ProcedureReturn LaTeX_Figure_Caption.s
  
EndProcedure

Procedure.s Create_Figure_Caption_Ascii(List Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),List Selected_Angles_from_CIF.AngCIFStructure())
  
  ForEach Selected_Bond_Lenghts_from_CIF.DistCIFStructure()
    Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\SymmetrieSymbol1=SymCode_to_SymSymbol.s(Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\Symmetrie1)
    Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\SymmetrieSymbol2=SymCode_to_SymSymbol.s(Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\Symmetrie2)
  Next
  
  ForEach Selected_Angles_from_CIF.AngCIFStructure()
    Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol1=SymCode_to_SymSymbol.s(Selected_Angles_from_CIF.AngCIFStructure()\Symmetrie1)
    Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol2=SymCode_to_SymSymbol.s(Selected_Angles_from_CIF.AngCIFStructure()\Symmetrie2)
    Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol3=SymCode_to_SymSymbol.s(Selected_Angles_from_CIF.AngCIFStructure()\Symmetrie3)
  Next
  
  
  ForEach Selected_Bond_Lenghts_from_CIF.DistCIFStructure()
    If ListSize(Selected_Bond_Lenghts_from_CIF.DistCIFStructure())
      Ascii_Figure_Caption.s = Ascii_Figure_Caption.s + Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\Atom1 + Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\SymmetrieSymbol1 + "-" + Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\Atom2 + Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\SymmetrieSymbol2 + " " + Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\Abstand + ", "
    EndIf
  Next
  
  Ascii_Figure_Caption.s = Trim(Ascii_Figure_Caption.s)
  Ascii_Figure_Caption.s = RTrim(Ascii_Figure_Caption.s,",")
  Ascii_Figure_Caption.s = Ascii_Figure_Caption.s + "; "
  
  ForEach Selected_Angles_from_CIF.AngCIFStructure()
    If ListSize(Selected_Angles_from_CIF.AngCIFStructure())
      Ascii_Figure_Caption.s = Ascii_Figure_Caption.s + Selected_Angles_from_CIF.AngCIFStructure()\Atom1 + Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol1 + "-" + Selected_Angles_from_CIF.AngCIFStructure()\Atom2 +  Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol2 + "-" + Selected_Angles_from_CIF.AngCIFStructure()\Atom3 + Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol3 + " " + Selected_Angles_from_CIF.AngCIFStructure()\Winkel + ", "
    EndIf
  Next
  
  Ascii_Figure_Caption.s = Trim(Ascii_Figure_Caption.s)
  Ascii_Figure_Caption.s = RTrim(Ascii_Figure_Caption.s,",")
  Ascii_Figure_Caption.s = Ascii_Figure_Caption.s + ". "
  
  ProcedureReturn Ascii_Figure_Caption.s
  
EndProcedure

Procedure.s Create_Figure_Caption_Markdown_Ascii(List Selected_Bond_Lenghts_from_CIF.DistCIFStructure(),List Selected_Angles_from_CIF.AngCIFStructure())
  
  ForEach Selected_Bond_Lenghts_from_CIF.DistCIFStructure()
    Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\SymmetrieSymbol1=SymCode_to_SymSymbol.s(Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\Symmetrie1)
    Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\SymmetrieSymbol2=SymCode_to_SymSymbol.s(Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\Symmetrie2)
  Next
  
  ForEach Selected_Angles_from_CIF.AngCIFStructure()
    Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol1=SymCode_to_SymSymbol.s(Selected_Angles_from_CIF.AngCIFStructure()\Symmetrie1)
    Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol2=SymCode_to_SymSymbol.s(Selected_Angles_from_CIF.AngCIFStructure()\Symmetrie2)
    Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol3=SymCode_to_SymSymbol.s(Selected_Angles_from_CIF.AngCIFStructure()\Symmetrie3)
  Next
  
  
  ForEach Selected_Bond_Lenghts_from_CIF.DistCIFStructure()
    If ListSize(Selected_Bond_Lenghts_from_CIF.DistCIFStructure())
      Markdown_Ascii_Figure_Caption.s = Markdown_Ascii_Figure_Caption.s + Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\Atom1 
      If Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\SymmetrieSymbol1 <> ""
        Markdown_Ascii_Figure_Caption.s = Markdown_Ascii_Figure_Caption.s + "^" + Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\SymmetrieSymbol1 + "^"
      EndIf
      Markdown_Ascii_Figure_Caption.s = Markdown_Ascii_Figure_Caption.s + "-" + Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\Atom2
      If Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\SymmetrieSymbol2 <> ""
        Markdown_Ascii_Figure_Caption.s = Markdown_Ascii_Figure_Caption.s + "^" + Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\SymmetrieSymbol2 + "^"
      EndIf
      Markdown_Ascii_Figure_Caption.s = Markdown_Ascii_Figure_Caption.s + " " + Selected_Bond_Lenghts_from_CIF.DistCIFStructure()\Abstand + ", "
    EndIf
  Next
  
  Markdown_Ascii_Figure_Caption.s = Trim(Markdown_Ascii_Figure_Caption.s)
  Markdown_Ascii_Figure_Caption.s = RTrim(Markdown_Ascii_Figure_Caption.s,",")
  Markdown_Ascii_Figure_Caption.s = Markdown_Ascii_Figure_Caption.s + "; "
  
  ForEach Selected_Angles_from_CIF.AngCIFStructure()
    If ListSize(Selected_Angles_from_CIF.AngCIFStructure())
      Markdown_Ascii_Figure_Caption.s = Markdown_Ascii_Figure_Caption.s + Selected_Angles_from_CIF.AngCIFStructure()\Atom1 
      If Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol1 <> ""
        Markdown_Ascii_Figure_Caption.s = Markdown_Ascii_Figure_Caption.s + "^" + Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol1 + "^"
      EndIf
      Markdown_Ascii_Figure_Caption.s = Markdown_Ascii_Figure_Caption.s + "-" + Selected_Angles_from_CIF.AngCIFStructure()\Atom2
      If Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol2 <> ""
        Markdown_Ascii_Figure_Caption.s = Markdown_Ascii_Figure_Caption.s + "^" + Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol2 + "^"
      EndIf
      Markdown_Ascii_Figure_Caption.s = Markdown_Ascii_Figure_Caption.s + "-" + Selected_Angles_from_CIF.AngCIFStructure()\Atom3
      If Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol3 <> ""
        Markdown_Ascii_Figure_Caption.s = Markdown_Ascii_Figure_Caption.s + "^" + Selected_Angles_from_CIF.AngCIFStructure()\SymmetrieSymbol3 + "^"
      EndIf
      Markdown_Ascii_Figure_Caption.s = Markdown_Ascii_Figure_Caption.s + " " + Selected_Angles_from_CIF.AngCIFStructure()\Winkel + ", "
    EndIf
  Next
  
  Markdown_Ascii_Figure_Caption.s = Trim(Markdown_Ascii_Figure_Caption.s)
  Markdown_Ascii_Figure_Caption.s = RTrim(Markdown_Ascii_Figure_Caption.s,",")
  Markdown_Ascii_Figure_Caption.s = Markdown_Ascii_Figure_Caption.s + ". "
  
  ProcedureReturn Markdown_Ascii_Figure_Caption.s
  
EndProcedure


Procedure.s HKL_entry_RTF()
  
  Protected h_min.s
  Protected h_max.s
  Protected k_min.s
  Protected k_max.s
  Protected l_min.s
  Protected l_max.s
  Protected Signh.s
  Protected Signk.s
  Protected Signl.s
  Protected hklfline.s
            
  h_min.s=CifItem("_diffrn_reflns_limit_h_min")
  h_max.s=CifItem("_diffrn_reflns_limit_h_max")
  k_min.s=CifItem("_diffrn_reflns_limit_k_min")
  k_max.s=CifItem("_diffrn_reflns_limit_k_max")
  l_min.s=CifItem("_diffrn_reflns_limit_l_min")
  l_max.s=CifItem("_diffrn_reflns_limit_l_max")
  
  If ReplaceString(h_min.s,"-","")=ReplaceString(h_max.s,"-","")
    h_min.s= Chr(177)+ReplaceString(h_min.s,"-","")
    h_max.s=""
    Signh.s=""
  Else
    Signh.s=" - "
  EndIf
  
  If ReplaceString(k_min.s,"-","")=ReplaceString(k_max.s,"-","")
    k_min.s= Chr(177)+ReplaceString(k_min.s,"-","")
    k_max.s=""
    Signk.s=""
  Else
    Signk.s=" - "
  EndIf
  
  If ReplaceString(l_min.s,"-","")=ReplaceString(l_max.s,"-","")
    l_min.s= Chr(177)+ReplaceString(l_min.s,"-","")
    l_max.s=""
    Signl.s=""
  Else
    Signl.s=" - "
  EndIf
  
  hklfline.s= h_min.s + Signh.s + h_max.s + ", " + k_min.s + Signk.s + k_max.s  + ", " + l_min.s + Signl.s + l_max.s
  
  ProcedureReturn hklfline.s
EndProcedure

Procedure.s HKL_entry_LaTeX()
  
  Protected h_min.s
  Protected h_max.s
  Protected k_min.s
  Protected k_max.s
  Protected l_min.s
  Protected l_max.s
;   Protected Signh.s
;   Protected Signk.s
;   Protected Signl.s
  Protected hklfline.s
            
  h_min.s=CifItem("_diffrn_reflns_limit_h_min")
  h_max.s=CifItem("_diffrn_reflns_limit_h_max")
  k_min.s=CifItem("_diffrn_reflns_limit_k_min")
  k_max.s=CifItem("_diffrn_reflns_limit_k_max")
  l_min.s=CifItem("_diffrn_reflns_limit_l_min")
  l_max.s=CifItem("_diffrn_reflns_limit_l_max")
  
  hklfline.s + "$" + h_min.s + "\leq h \leq" + h_max.s + "$" + " \\" +  #CRLF$
  hklfline.s + " & " + "$" + k_min.s + "\leq k \leq" + k_max.s + "$" + " \\" +  #CRLF$
  hklfline.s + " & " + "$" + l_min.s + "\leq l \leq" + l_max.s + "$" 
  
  ProcedureReturn hklfline.s
  
EndProcedure

Procedure.s HKL_entry_Ascii()
  
  Protected h_min.s
  Protected h_max.s
  Protected k_min.s
  Protected k_max.s
  Protected l_min.s
  Protected l_max.s
  Protected Signh.s
  Protected Signk.s
  Protected Signl.s
  Protected hklfline.s
            
  h_min.s=CifItem("_diffrn_reflns_limit_h_min")
  h_max.s=CifItem("_diffrn_reflns_limit_h_max")
  k_min.s=CifItem("_diffrn_reflns_limit_k_min")
  k_max.s=CifItem("_diffrn_reflns_limit_k_max")
  l_min.s=CifItem("_diffrn_reflns_limit_l_min")
  l_max.s=CifItem("_diffrn_reflns_limit_l_max")
  
  If ReplaceString(h_min.s,"-","")=ReplaceString(h_max.s,"-","")
    h_min.s= Chr(177)+ReplaceString(h_min.s,"-","")
    h_max.s=""
    Signh.s=""
  Else
    Signh.s=" to "
  EndIf
  
  If ReplaceString(k_min.s,"-","")=ReplaceString(k_max.s,"-","")
    k_min.s= Chr(177)+ReplaceString(k_min.s,"-","")
    k_max.s=""
    Signk.s=""
  Else
    Signk.s=" to "
  EndIf
  
  If ReplaceString(l_min.s,"-","")=ReplaceString(l_max.s,"-","")
    l_min.s= Chr(177)+ReplaceString(l_min.s,"-","")
    l_max.s=""
    Signl.s=""
  Else
    Signl.s=" to "
  EndIf
  
  hklfline.s= h_min.s + Signh.s + h_max.s + ", " + k_min.s + Signk.s + k_max.s  + ", " + l_min.s + Signl.s + l_max.s
  
  ProcedureReturn hklfline.s
EndProcedure

Procedure.s Fill_SPG_Dict_RTF()
  SPG_Dict_RTF("P1")="{\i P}1"
  SPG_Dict_RTF("P-1")="{\i P}-1"
  SPG_Dict_RTF("P2")="{\i P}2"
  SPG_Dict_RTF("P21")="{\i P}2{\sub 1}"
  SPG_Dict_RTF("C2")="{\i C}2"
  SPG_Dict_RTF("Pm")="{\i P}{\i m}"
  SPG_Dict_RTF("Pc")="{\i P}{\i c}"
  SPG_Dict_RTF("Cm")="{\i C}{\i m}"
  SPG_Dict_RTF("Cc")="{\i C}{\i c}"
  SPG_Dict_RTF("P2/m")="{\i P}2/{\i m}"
  SPG_Dict_RTF("P21/m")="{\i P}2{\sub 1}/{\i m}"
  SPG_Dict_RTF("C2/m")="{\i C}2/{\i m}"
  SPG_Dict_RTF("P2/c")="{\i P}2/{\i c}"
  SPG_Dict_RTF("P21/c")="{\i P}2{\sub 1}/{\i c}"
  SPG_Dict_RTF("P21/n")="{\i P}2{\sub 1}/{\i n}"
  SPG_Dict_RTF("P21/a")="{\i P}2{\sub 1}/{\i a}"
  SPG_Dict_RTF("C2/c")="{\i C}2/{\i c}"
  SPG_Dict_RTF("P222")="{\i P}222"
  SPG_Dict_RTF("P2221")="{\i P}222{\sub 1}"
  SPG_Dict_RTF("P21212")="{\i P}2{\sub 1}2{\sub 1}2"
  SPG_Dict_RTF("P212121")="{\i P}2{\sub 1}2{\sub 1}2{\sub 1}"
  SPG_Dict_RTF("C2221")="{\i C}222{\sub 1}"
  SPG_Dict_RTF("C222")="{\i C}222"
  SPG_Dict_RTF("F222")="{\i F}222"
  SPG_Dict_RTF("I222")="{\i I}222"
  SPG_Dict_RTF("I212121")="{\i I}2{\sub 1}2{\sub 1}2{\sub 1}"
  SPG_Dict_RTF("Pmm2")="{\i P}{\i m}{\i m}2"
  SPG_Dict_RTF("Pmc21")="{\i P}{\i m}{\i c}2{\sub 1}"
  SPG_Dict_RTF("Pcc2")="{\i P}{\i c}{\i c}2"
  SPG_Dict_RTF("Pma2")="{\i P}{\i m}{\i a}2"
  SPG_Dict_RTF("Pca21")="{\i P}{\i c}{\i a}2{\sub 1}"
  SPG_Dict_RTF("Pnc2")="{\i P}{\i n}{\i c}2"
  SPG_Dict_RTF("Pmn21")="{\i P}{\i m}{\i n}2{\sub 1}"
  SPG_Dict_RTF("Pba2")="{\i P}{\i b}{\i a}2"
  SPG_Dict_RTF("Pna21")="{\i P}{\i n}{\i a}2{\sub 1}"
  SPG_Dict_RTF("Pnn2")="{\i P}{\i n}{\i n}2"
  SPG_Dict_RTF("Cmm2")="{\i C}{\i m}{\i m}2"
  SPG_Dict_RTF("Cmc21")="{\i C}{\i m}{\i c}2{\sub 1}"
  SPG_Dict_RTF("Ccc2")="{\i C}{\i c}{\i c}2"
  SPG_Dict_RTF("Amm2")="{\i A}{\i m}{\i m}2"
  SPG_Dict_RTF("Abm2")="{\i A}{\i b}{\i m}2"
  SPG_Dict_RTF("Ama2")="{\i A}{\i m}{\i a}2"
  SPG_Dict_RTF("Aba2")="{\i A}{\i b}{\i a}2"
  SPG_Dict_RTF("Fmm2")="{\i F}{\i m}{\i m}2"
  SPG_Dict_RTF("Fdd2")="{\i F}{\i d}{\i d}2"
  SPG_Dict_RTF("Imm2")="{\i I}{\i m}{\i m}2"
  SPG_Dict_RTF("Iba2")="{\i I}{\i b}{\i a}2"
  SPG_Dict_RTF("Ima2")="{\i I}{\i m}{\i a}2"
  SPG_Dict_RTF("Pmmm")="{\i P}{\i m}{\i m}{\i m}"
  SPG_Dict_RTF("Pnnn")="{\i P}{\i n}{\i n}{\i n}"
  SPG_Dict_RTF("Pccm")="{\i P}{\i c}{\i c}{\i m}"
  SPG_Dict_RTF("Pban")="{\i P}{\i b}{\i a}{\i n}"
  SPG_Dict_RTF("Pmma")="{\i P}{\i m}{\i m}{\i a}"
  SPG_Dict_RTF("Pnna")="{\i P}{\i n}{\i n}{\i a}"
  SPG_Dict_RTF("Pmna")="{\i P}{\i m}{\i n}{\i a}"
  SPG_Dict_RTF("Pcca")="{\i P}{\i c}{\i c}{\i a}"
  SPG_Dict_RTF("Pbam")="{\i P}{\i b}{\i a}{\i m}"
  SPG_Dict_RTF("Pccn")="{\i P}{\i c}{\i c}{\i n}"
  SPG_Dict_RTF("Pbcm")="{\i P}{\i b}{\i c}{\i m}"
  SPG_Dict_RTF("Pnnm")="{\i P}{\i n}{\i n}{\i m}"
  SPG_Dict_RTF("Pmmn")="{\i P}{\i m}{\i m}{\i n}"
  SPG_Dict_RTF("Pbcn")="{\i P}{\i b}{\i c}{\i n}"
  SPG_Dict_RTF("Pbca")="{\i P}{\i b}{\i c}{\i a}"
  SPG_Dict_RTF("Pnma")="{\i P}{\i n}{\i m}{\i a}"
  SPG_Dict_RTF("Cmcm")="{\i C}{\i m}{\i c}{\i m}"
  SPG_Dict_RTF("Cmca")="{\i C}{\i m}{\i c}{\i a}"
  SPG_Dict_RTF("Cmmm")="{\i C}{\i m}{\i m}{\i m}"
  SPG_Dict_RTF("Cccm")="{\i C}{\i c}{\i c}{\i m}"
  SPG_Dict_RTF("Cmma")="{\i C}{\i m}{\i m}{\i a}"
  SPG_Dict_RTF("Ccca")="{\i C}{\i c}{\i c}{\i a}"
  SPG_Dict_RTF("Fmmm")="{\i F}{\i m}{\i m}{\i m}"
  SPG_Dict_RTF("Fddd")="{\i F}{\i d}{\i d}{\i d}"
  SPG_Dict_RTF("Immm")="{\i I}{\i m}{\i m}{\i m}"
  SPG_Dict_RTF("Ibam")="{\i I}{\i b}{\i a}{\i m}"
  SPG_Dict_RTF("Ibca")="{\i I}{\i b}{\i c}{\i a}"
  SPG_Dict_RTF("Imma")="{\i I}{\i m}{\i m}{\i a}"
  SPG_Dict_RTF("P4")="{\i P}4"
  SPG_Dict_RTF("P41")="{\i P}4{\sub 1}"
  SPG_Dict_RTF("P42")="{\i P}4{\sub 2}"
  SPG_Dict_RTF("P43")="{\i P}4{\sub 3}"
  SPG_Dict_RTF("I4")="{\i I}4"
  SPG_Dict_RTF("I41")="{\i I}4{\sub 1}"
  SPG_Dict_RTF("P-4")="{\i P}-4"
  SPG_Dict_RTF("I-4")="{\i I}-4"
  SPG_Dict_RTF("P4/m")="{\i P}4/{\i m}"
  SPG_Dict_RTF("P42/m")="{\i P}4{\sub 2}/{\i m}"
  SPG_Dict_RTF("P4/n")="{\i P}4/{\i n}"
  SPG_Dict_RTF("P42/n")="{\i P}4{\sub 2}/{\i n}"
  SPG_Dict_RTF("I4/m")="{\i I}4/{\i m}"
  SPG_Dict_RTF("I41/a")="{\i I}4{\sub 1}/{\i a}"
  SPG_Dict_RTF("P422")="{\i P}422"
  SPG_Dict_RTF("P4212")="{\i P}42{\sub 1}2"
  SPG_Dict_RTF("P4122")="{\i P}4{\sub 1}22"
  SPG_Dict_RTF("P41212")="{\i P}4{\sub 1}2{\sub 1}2"
  SPG_Dict_RTF("P4222")="{\i P}4{\sub 2}22"
  SPG_Dict_RTF("P42212")="{\i P}4{\sub 2}2{\sub 2}2"
  SPG_Dict_RTF("P4322")="{\i P}4{\sub 3}22"
  SPG_Dict_RTF("P43212")="{\i P}4{\sub 3}2{\sub 1}2"
  SPG_Dict_RTF("I422")="{\i I}422"
  SPG_Dict_RTF("I4122")="{\i I}4{\sub 1}22"
  SPG_Dict_RTF("P4mm")="{\i P}4{\i m}{\i m}"
  SPG_Dict_RTF("P4bm")="{\i P}4{\i b}{\i m}"
  SPG_Dict_RTF("P42cm")="{\i P}4{\sub 2}{\i c}{\i m}"
  SPG_Dict_RTF("P42nm")="{\i P}4{\sub 2}{\i n}{\i m}"
  SPG_Dict_RTF("P4cc")="{\i P}4{\i c}{\i c}"
  SPG_Dict_RTF("P4nc")="{\i P}4{\i n}{\i c}"
  SPG_Dict_RTF("P42mc")="{\i P}4{\sub 2}{\i m}{\i c}"
  SPG_Dict_RTF("P42bc")="{\i P}4{\sub 2}{\i b}{\i c}"
  SPG_Dict_RTF("I4mm")="{\i I}4{\i m}{\i m}"
  SPG_Dict_RTF("I4cm")="{\i I}4{\i c}{\i m}"
  SPG_Dict_RTF("I41md")="{\i I}4{\sub 1}{\i m}{\i d}"
  SPG_Dict_RTF("I41cd")="{\i I}4{\sub 1}{\i c}{\i d}"
  SPG_Dict_RTF("P-42m")="{\i P}-42{\i m}"
  SPG_Dict_RTF("P-42c")="{\i P}-42{\i c}"
  SPG_Dict_RTF("P-421m")="{\i P}-42{\sub 1}{\i m}"
  SPG_Dict_RTF("P-421c")="{\i P}-42{\sub 1}{\i c}"
  SPG_Dict_RTF("P-4m2")="{\i P}-4{\i m}2"
  SPG_Dict_RTF("P-4c2")="{\i P}-4{\i c}2"
  SPG_Dict_RTF("P-4b2")="{\i P}-4{\i b}2"
  SPG_Dict_RTF("P-4n2")="{\i P}-4{\i n}2"
  SPG_Dict_RTF("I-4m2")="{\i I}-4{\i m}2"
  SPG_Dict_RTF("I-4c2")="{\i I}-4{\i c}2"
  SPG_Dict_RTF("I-42m")="{\i I}-42{\i m}"
  SPG_Dict_RTF("I-42d")="{\i I}-42{\i d}"
  SPG_Dict_RTF("P4/mmm")="{\i P}4/{\i m}{\i m}{\i m}"
  SPG_Dict_RTF("P4/mcc")="{\i P}4/{\i m}{\i c}{\i c}"
  SPG_Dict_RTF("P4/nbm")="{\i P}4/{\i n}{\i b}{\i m}"
  SPG_Dict_RTF("P4/nnc")="{\i P}4/{\i n}{\i n}{\i c}"
  SPG_Dict_RTF("P4/mbm")="{\i P}4/{\i m}{\i b}{\i m}"
  SPG_Dict_RTF("P4/mnc")="{\i P}4/{\i m}{\i n}{\i c}"
  SPG_Dict_RTF("P4/nmm")="{\i P}4/{\i n}{\i m}{\i m}"
  SPG_Dict_RTF("P4/ncc")="{\i P}4/{\i n}{\i c}{\i c}"
  SPG_Dict_RTF("P42/mmc")="{\i P}4{\sub 2}/{\i m}{\i m}{\i c}"
  SPG_Dict_RTF("P42/mcm")="{\i P}4{\sub 2}/{\i m}{\i c}{\i m}"
  SPG_Dict_RTF("P42/nbc")="{\i P}4{\sub 2}/{\i n}{\i b}{\i c}"
  SPG_Dict_RTF("P42/nnm")="{\i P}4{\sub 2}/{\i n}{\i n}{\i m}"
  SPG_Dict_RTF("P42/mbc")="{\i P}4{\sub 2}/{\i m}{\i b}{\i c}"
  SPG_Dict_RTF("P42/mnm")="{\i P}4{\sub 2}/{\i m}{\i n}{\i m}"
  SPG_Dict_RTF("P42/nmc")="{\i P}4{\sub 2}/{\i n}{\i m}{\i c}"
  SPG_Dict_RTF("P42/ncm")="{\i P}4{\sub 2}/{\i n}{\i c}{\i m}"
  SPG_Dict_RTF("I4/mmm")="{\i I}4/{\i m}{\i m}{\i m}"
  SPG_Dict_RTF("I4/mcm")="{\i I}4/{\i m}{\i c}{\i m}"
  SPG_Dict_RTF("I41/amd")="{\i I}4{\sub 1}/{\i a}{\i m}{\i d}"
  SPG_Dict_RTF("I41/acd")="{\i I}4{\sub 1}/{\i a}{\i c}{\i d}"
  SPG_Dict_RTF("P3")="{\i P}3"
  SPG_Dict_RTF("P31")="{\i P}3{\sub 1}"
  SPG_Dict_RTF("P32")="{\i P}3{\sub 2}"
  SPG_Dict_RTF("R3")="{\i R}3"
  SPG_Dict_RTF("P-3")="{\i P}-3"
  SPG_Dict_RTF("R-3")="{\i R}-3"
  SPG_Dict_RTF("P312")="{\i P}312"
  SPG_Dict_RTF("P321")="{\i P}321"
  SPG_Dict_RTF("P3112")="{\i P}3{\sub 1}12"
  SPG_Dict_RTF("P3121")="{\i P}3{\sub 1}21"
  SPG_Dict_RTF("P3212")="{\i P}3{\sub 2}12"
  SPG_Dict_RTF("P3221")="{\i P}3{\sub 2}21"
  SPG_Dict_RTF("R32")="{\i R}32"
  SPG_Dict_RTF("P3m1")="{\i P}3{\i m}1"
  SPG_Dict_RTF("P31m")="{\i P}31{\i m}"
  SPG_Dict_RTF("P3c1")="{\i P}3{\i c}1"
  SPG_Dict_RTF("P31c")="{\i P}31{\i c}"
  SPG_Dict_RTF("R3m")="{\i R}3{\i m}"
  SPG_Dict_RTF("R3c")="{\i R}3{\i c}"
  SPG_Dict_RTF("P-31m")="{\i P}-31{\i m}"
  SPG_Dict_RTF("P-31c")="{\i P}-31{\i c}"
  SPG_Dict_RTF("P-3m1")="{\i P}-3{\i m}1"
  SPG_Dict_RTF("P-3c1")="{\i P}-3{\i c}1"
  SPG_Dict_RTF("R-3m")="{\i R}-3{\i m}"
  SPG_Dict_RTF("R-3c")="{\i R}-3{\i c}"
  SPG_Dict_RTF("P6")="{\i P}6"
  SPG_Dict_RTF("P61")="{\i P}6{\sub 1}"
  SPG_Dict_RTF("P65")="{\i P}6{\sub 5}"
  SPG_Dict_RTF("P62")="{\i P}6{\sub 2}"
  SPG_Dict_RTF("P64")="{\i P}6{\sub 4}"
  SPG_Dict_RTF("P63")="{\i P}6{\sub 3}"
  SPG_Dict_RTF("P-6")="{\i P}-6"
  SPG_Dict_RTF("P6/m")="{\i P}6/{\i m}"
  SPG_Dict_RTF("P63/m")="{\i P}6{\sub 3}/{\i m}"
  SPG_Dict_RTF("P622")="{\i P}622"
  SPG_Dict_RTF("P6122")="{\i P}6{\sub 1}22"
  SPG_Dict_RTF("P6522")="{\i P}6{\sub 5}22"
  SPG_Dict_RTF("P6222")="{\i P}6{\sub 2}22"
  SPG_Dict_RTF("P6422")="{\i P}6{\sub 4}22"
  SPG_Dict_RTF("P6322")="{\i P}6{\sub 3}22"
  SPG_Dict_RTF("P6mm")="{\i P}6{\i m}{\i m}"
  SPG_Dict_RTF("P6cc")="{\i P}6{\i c}{\i c}"
  SPG_Dict_RTF("P63cm")="{\i P}6{\sub 3}{\i c}{\i m}"
  SPG_Dict_RTF("P63mc")="{\i P}6{\sub 3}{\i m}{\i c}"
  SPG_Dict_RTF("P-6m2")="{\i P}-6{\i m}2"
  SPG_Dict_RTF("P-6c2")="{\i P}-6{\i c}2"
  SPG_Dict_RTF("P-62m")="{\i P}-62{\i m}"
  SPG_Dict_RTF("P-62c")="{\i P}-62{\i c}"
  SPG_Dict_RTF("P6/mmm")="{\i P}6/{\i m}{\i m}{\i m}"
  SPG_Dict_RTF("P6/mcc")="{\i P}6/{\i m}{\i c}{\i c}"
  SPG_Dict_RTF("P63/mcm")="{\i P}6{\sub 3}/{\i m}{\i c}{\i m}"
  SPG_Dict_RTF("P63/mmc")="{\i P}6{\sub 3}/{\i m}{\i m}{\i c}"
  SPG_Dict_RTF("P23")="{\i P}23"
  SPG_Dict_RTF("F23")="{\i F}23"
  SPG_Dict_RTF("I23")="{\i I}23"
  SPG_Dict_RTF("P213")="{\i P}2{\sub 1}3"
  SPG_Dict_RTF("I213")="{\i I}2{\sub 1}3"
  SPG_Dict_RTF("Pm-3")="{\i P}{\i m}-3"
  SPG_Dict_RTF("Pn-3")="{\i P}{\i n}-3"
  SPG_Dict_RTF("Fm-3")="{\i F}{\i m}-3"
  SPG_Dict_RTF("Fd-3")="{\i F}{\i d}-3"
  SPG_Dict_RTF("Im-3")="{\i I}{\i m}-3"
  SPG_Dict_RTF("Pa-3")="{\i P}{\i a}-3"
  SPG_Dict_RTF("Ia-3")="{\i I}{\i a}-3"
  SPG_Dict_RTF("P432")="{\i P}432"
  SPG_Dict_RTF("P4232")="{\i P}4{\sub 2}32"
  SPG_Dict_RTF("F432")="{\i F}432"
  SPG_Dict_RTF("F4132")="{\i F}4{\sub 1}32"
  SPG_Dict_RTF("I432")="{\i I}432"
  SPG_Dict_RTF("P4332")="{\i P}4{\sub 3}32"
  SPG_Dict_RTF("P4132")="{\i P}4{\sub 1}32"
  SPG_Dict_RTF("I4132")="{\i I}4{\sub 1}32"
  SPG_Dict_RTF("P-43m")="{\i P}-43{\i m}"
  SPG_Dict_RTF("F-43m")="{\i F}-43{\i m}"
  SPG_Dict_RTF("I-43m")="{\i I}-43{\i m}"
  SPG_Dict_RTF("P-43n")="{\i P}-43{\i n}"
  SPG_Dict_RTF("F-43c")="{\i F}-43{\i c}"
  SPG_Dict_RTF("I-43d")="{\i I}-43{\i d}"
  SPG_Dict_RTF("Pm-3m")="{\i P}{\i m}-3{\i m}"
  SPG_Dict_RTF("Pn-3n")="{\i P}{\i n}-3{\i n}"
  SPG_Dict_RTF("Pm-3n")="{\i P}{\i m}-3{\i n}"
  SPG_Dict_RTF("Pn-3m")="{\i P}{\i n}-3{\i m}"
  SPG_Dict_RTF("Fm-3m")="{\i F}{\i m}-3{\i m}"
  SPG_Dict_RTF("Fm-3c")="{\i F}{\i m}-3{\i c}"
  SPG_Dict_RTF("Fd-3m")="{\i F}{\i d}-3{\i m}"
  SPG_Dict_RTF("Fd-3c")="{\i F}{\i d}-3{\i c}"
  SPG_Dict_RTF("Im-3m")="{\i I}{\i m}-3{\i m}"
  SPG_Dict_RTF("Ia-3d")="{\i I}{\i a}-3{\i d}"
EndProcedure

Procedure.s Fill_SPG_Dict_Latex()
  SPG_Dict_Latex("P1")="P1"
  SPG_Dict_Latex("P-1")="P\bar{1}"
  SPG_Dict_Latex("P2")="P2"
  SPG_Dict_Latex("P21")="P2_1"
  SPG_Dict_Latex("C2")="C2"
  SPG_Dict_Latex("Pm")="Pm"
  SPG_Dict_Latex("Pc")="Pc"
  SPG_Dict_Latex("Cm")="Cm"
  SPG_Dict_Latex("Cc")="Cc"
  SPG_Dict_Latex("P2/m")="P2/m"
  SPG_Dict_Latex("P21/m")="P2_1/m"
  SPG_Dict_Latex("C2/m")="C2/m"
  SPG_Dict_Latex("P2/c")="P2/c"
  SPG_Dict_Latex("P21/c")="P2_1/c"
  SPG_Dict_Latex("P21/n")="P2_1/n"
  SPG_Dict_Latex("P21/a")="P2_1/a"
  SPG_Dict_Latex("C2/c")="C2/c"
  SPG_Dict_Latex("P222")="P222"
  SPG_Dict_Latex("P2221")="P222_1"
  SPG_Dict_Latex("P21212")="P2_12_12"
  SPG_Dict_Latex("P212121")="P2_12_12_1"
  SPG_Dict_Latex("C2221")="C222_1"
  SPG_Dict_Latex("C222")="C222"
  SPG_Dict_Latex("F222")="F222"
  SPG_Dict_Latex("I222")="I222"
  SPG_Dict_Latex("I212121")="I2_12_12_1"
  SPG_Dict_Latex("Pmm2")="Pmm2"
  SPG_Dict_Latex("Pmc21")="Pmc2_1"
  SPG_Dict_Latex("Pcc2")="Pcc2"
  SPG_Dict_Latex("Pma2")="Pma2"
  SPG_Dict_Latex("Pca21")="Pca2_1"
  SPG_Dict_Latex("Pnc2")="Pnc2"
  SPG_Dict_Latex("Pmn21")="Pmn2_1"
  SPG_Dict_Latex("Pba2")="Pba2"
  SPG_Dict_Latex("Pna21")="Pna2_1"
  SPG_Dict_Latex("Pnn2")="Pnn2"
  SPG_Dict_Latex("Cmm2")="Cmm2"
  SPG_Dict_Latex("Cmc21")="Cmc2_1"
  SPG_Dict_Latex("Ccc2")="Ccc2"
  SPG_Dict_Latex("Amm2")="Amm2"
  SPG_Dict_Latex("Abm2")="Abm2"
  SPG_Dict_Latex("Ama2")="Ama2"
  SPG_Dict_Latex("Aba2")="Aba2"
  SPG_Dict_Latex("Fmm2")="Fmm2"
  SPG_Dict_Latex("Fdd2")="Fdd2"
  SPG_Dict_Latex("Imm2")="Imm2"
  SPG_Dict_Latex("Iba2")="Iba2"
  SPG_Dict_Latex("Ima2")="Ima2"
  SPG_Dict_Latex("Pmmm")="Pmmm"
  SPG_Dict_Latex("Pnnn")="Pnnn"
  SPG_Dict_Latex("Pccm")="Pccm"
  SPG_Dict_Latex("Pban")="Pban"
  SPG_Dict_Latex("Pmma")="Pmma"
  SPG_Dict_Latex("Pnna")="Pnna"
  SPG_Dict_Latex("Pmna")="Pmna"
  SPG_Dict_Latex("Pcca")="Pcca"
  SPG_Dict_Latex("Pbam")="Pbam"
  SPG_Dict_Latex("Pccn")="Pccn"
  SPG_Dict_Latex("Pbcm")="Pbcm"
  SPG_Dict_Latex("Pnnm")="Pnnm"
  SPG_Dict_Latex("Pmmn")="Pmmn"
  SPG_Dict_Latex("Pbcn")="Pbcn"
  SPG_Dict_Latex("Pbca")="Pbca"
  SPG_Dict_Latex("Pnma")="Pnma"
  SPG_Dict_Latex("Cmcm")="Cmcm"
  SPG_Dict_Latex("Cmca")="Cmca"
  SPG_Dict_Latex("Cmmm")="Cmmm"
  SPG_Dict_Latex("Cccm")="Cccm"
  SPG_Dict_Latex("Cmma")="Cmma"
  SPG_Dict_Latex("Ccca")="Ccca"
  SPG_Dict_Latex("Fmmm")="Fmmm"
  SPG_Dict_Latex("Fddd")="Fddd"
  SPG_Dict_Latex("Immm")="Immm"
  SPG_Dict_Latex("Ibam")="Ibam"
  SPG_Dict_Latex("Ibca")="Ibca"
  SPG_Dict_Latex("Imma")="Imma"
  SPG_Dict_Latex("P4")="P4"
  SPG_Dict_Latex("P41")="P4_1"
  SPG_Dict_Latex("P42")="P4_2"
  SPG_Dict_Latex("P43")="P4_3"
  SPG_Dict_Latex("I4")="I4"
  SPG_Dict_Latex("I41")="I4_1"
  SPG_Dict_Latex("P-4")="P\bar{4}"
  SPG_Dict_Latex("I-4")="I\bar{4}"
  SPG_Dict_Latex("P4/m")="P4/m"
  SPG_Dict_Latex("P42/m")="P4_2/m"
  SPG_Dict_Latex("P4/n")="P4/n"
  SPG_Dict_Latex("P42/n")="P4_2/n"
  SPG_Dict_Latex("I4/m")="I4/m"
  SPG_Dict_Latex("I41/a")="I4_1/a"
  SPG_Dict_Latex("P422")="P422"
  SPG_Dict_Latex("P4212")="P42_12"
  SPG_Dict_Latex("P4122")="P4_122"
  SPG_Dict_Latex("P41212")="P4_12_12"
  SPG_Dict_Latex("P4222")="P4_222"
  SPG_Dict_Latex("P42212")="P4_22_12"
  SPG_Dict_Latex("P4322")="P4_322"
  SPG_Dict_Latex("P43212")="P4_32_12"
  SPG_Dict_Latex("I422")="I422"
  SPG_Dict_Latex("I4122")="I4_122"
  SPG_Dict_Latex("P4mm")="P4mm"
  SPG_Dict_Latex("P4bm")="P4bm"
  SPG_Dict_Latex("P42cm")="P4_2cm"
  SPG_Dict_Latex("P42nm")="P4_2nm"
  SPG_Dict_Latex("P4cc")="P4cc"
  SPG_Dict_Latex("P4nc")="P4nc"
  SPG_Dict_Latex("P42mc")="P4_2mc"
  SPG_Dict_Latex("P42bc")="P4_2bc"
  SPG_Dict_Latex("I4mm")="I4mm"
  SPG_Dict_Latex("I4cm")="I4cm"
  SPG_Dict_Latex("I41md")="I4_1md"
  SPG_Dict_Latex("I41cd")="I4_1cd"
  SPG_Dict_Latex("P-42m")="P\bar{4}2m"
  SPG_Dict_Latex("P-42c")="P\bar{4}2c"
  SPG_Dict_Latex("P-421m")="P\bar{4}2_1m"
  SPG_Dict_Latex("P-421c")="P\bar{4}2_1c"
  SPG_Dict_Latex("P-4m2")="P\bar{4}m2"
  SPG_Dict_Latex("P-4c2")="P\bar{4}c2"
  SPG_Dict_Latex("P-4b2")="P\bar{4}b2"
  SPG_Dict_Latex("P-4n2")="P\bar{4}n2"
  SPG_Dict_Latex("I-4m2")="I\bar{4}m2"
  SPG_Dict_Latex("I-4c2")="I\bar{4}c2"
  SPG_Dict_Latex("I-42m")="I\bar{4}2m"
  SPG_Dict_Latex("I-42d")="I\bar{4}2d"
  SPG_Dict_Latex("P4/mmm")="P4/mmm"
  SPG_Dict_Latex("P4/mcc")="P4/mcc"
  SPG_Dict_Latex("P4/nbm")="P4/nbm"
  SPG_Dict_Latex("P4/nnc")="P4/nnc"
  SPG_Dict_Latex("P4/mbm")="P4/mbm"
  SPG_Dict_Latex("P4/mnc")="P4/mnc"
  SPG_Dict_Latex("P4/nmm")="P4/nmm"
  SPG_Dict_Latex("P4/ncc")="P4/ncc"
  SPG_Dict_Latex("P42/mmc")="P4_2/mmc"
  SPG_Dict_Latex("P42/mcm")="P4_2/mcm"
  SPG_Dict_Latex("P42/nbc")="P4_2/nbc"
  SPG_Dict_Latex("P42/nnm")="P4_2/nnm"
  SPG_Dict_Latex("P42/mbc")="P4_2/mbc"
  SPG_Dict_Latex("P42/mnm")="P4_2/mnm"
  SPG_Dict_Latex("P42/nmc")="P4_2/nmc"
  SPG_Dict_Latex("P42/ncm")="P4_2/ncm"
  SPG_Dict_Latex("I4/mmm")="I4/mmm"
  SPG_Dict_Latex("I4/mcm")="I4/mcm"
  SPG_Dict_Latex("I41/amd")="I4_1/amd"
  SPG_Dict_Latex("I41/acd")="I4_1/acd"
  SPG_Dict_Latex("P3")="P3"
  SPG_Dict_Latex("P31")="P3_1"
  SPG_Dict_Latex("P32")="P3_2"
  SPG_Dict_Latex("R3")="R3"
  SPG_Dict_Latex("P-3")="P\bar{3}"
  SPG_Dict_Latex("R-3")="R\bar{3}"
  SPG_Dict_Latex("P312")="P312"
  SPG_Dict_Latex("P321")="P321"
  SPG_Dict_Latex("P3112")="P3_112"
  SPG_Dict_Latex("P3121")="P3_121"
  SPG_Dict_Latex("P3212")="P3_212"
  SPG_Dict_Latex("P3221")="P3_221"
  SPG_Dict_Latex("R32")="R32"
  SPG_Dict_Latex("P3m1")="P3m1"
  SPG_Dict_Latex("P31m")="P31m"
  SPG_Dict_Latex("P3c1")="P3c1"
  SPG_Dict_Latex("P31c")="P31c"
  SPG_Dict_Latex("R3m")="R3m"
  SPG_Dict_Latex("R3c")="R3c"
  SPG_Dict_Latex("P-31m")="P\bar{3}1m"
  SPG_Dict_Latex("P-31c")="P\bar{3}1c"
  SPG_Dict_Latex("P-3m1")="P\bar{3}m1"
  SPG_Dict_Latex("P-3c1")="P\bar{3}c1"
  SPG_Dict_Latex("R-3m")="R\bar{3}m"
  SPG_Dict_Latex("R-3c")="R\bar{3}c"
  SPG_Dict_Latex("P6")="P6"
  SPG_Dict_Latex("P61")="P6_1"
  SPG_Dict_Latex("P65")="P6_5"
  SPG_Dict_Latex("P62")="P6_2"
  SPG_Dict_Latex("P64")="P6_4"
  SPG_Dict_Latex("P63")="P6_3"
  SPG_Dict_Latex("P-6")="P\bar{6}"
  SPG_Dict_Latex("P6/m")="P6/m"
  SPG_Dict_Latex("P63/m")="P6_3/m"
  SPG_Dict_Latex("P622")="P622"
  SPG_Dict_Latex("P6122")="P6_122"
  SPG_Dict_Latex("P6522")="P6_522"
  SPG_Dict_Latex("P6222")="P6_222"
  SPG_Dict_Latex("P6422")="P6_422"
  SPG_Dict_Latex("P6322")="P6_322"
  SPG_Dict_Latex("P6mm")="P6mm"
  SPG_Dict_Latex("P6cc")="P6cc"
  SPG_Dict_Latex("P63cm")="P6_3cm"
  SPG_Dict_Latex("P63mc")="P6_3mc"
  SPG_Dict_Latex("P-6m2")="P\bar{6}m2"
  SPG_Dict_Latex("P-6c2")="P\bar{6}c2"
  SPG_Dict_Latex("P-62m")="P\bar{6}2m"
  SPG_Dict_Latex("P-62c")="P\bar{6}2c"
  SPG_Dict_Latex("P6/mmm")="P6/mmm"
  SPG_Dict_Latex("P6/mcc")="P6/mcc"
  SPG_Dict_Latex("P63/mcm")="P6_3/mcm"
  SPG_Dict_Latex("P63/mmc")="P6_3/mmc"
  SPG_Dict_Latex("P23")="P23"
  SPG_Dict_Latex("F23")="F23"
  SPG_Dict_Latex("I23")="I23"
  SPG_Dict_Latex("P213")="P2_13"
  SPG_Dict_Latex("I213")="I2_13"
  SPG_Dict_Latex("Pm-3")="Pm\bar{3}"
  SPG_Dict_Latex("Pn-3")="Pn\bar{3}"
  SPG_Dict_Latex("Fm-3")="Fm\bar{3}"
  SPG_Dict_Latex("Fd-3")="Fd\bar{3}"
  SPG_Dict_Latex("Im-3")="Im\bar{3}"
  SPG_Dict_Latex("Pa-3")="Pa\bar{3}"
  SPG_Dict_Latex("Ia-3")="Ia\bar{3}"
  SPG_Dict_Latex("P432")="P432"
  SPG_Dict_Latex("P4232")="P4_232"
  SPG_Dict_Latex("F432")="F432"
  SPG_Dict_Latex("F4132")="F4_132"
  SPG_Dict_Latex("I432")="I432"
  SPG_Dict_Latex("P4332")="P4_332"
  SPG_Dict_Latex("P4132")="P4_132"
  SPG_Dict_Latex("I4132")="I4_132"
  SPG_Dict_Latex("P-43m")="P\bar{4}3m"
  SPG_Dict_Latex("F-43m")="F\bar{4}3m"
  SPG_Dict_Latex("I-43m")="I\bar{4}3m"
  SPG_Dict_Latex("P-43n")="P\bar{4}3n"
  SPG_Dict_Latex("F-43c")="F\bar{4}3c"
  SPG_Dict_Latex("I-43d")="I\bar{4}3d"
  SPG_Dict_Latex("Pm-3m")="Pm\bar{3}m"
  SPG_Dict_Latex("Pn-3n")="Pn\bar{3}n"
  SPG_Dict_Latex("Pm-3n")="Pm\bar{3}n"
  SPG_Dict_Latex("Pn-3m")="Pn\bar{3}m"
  SPG_Dict_Latex("Fm-3m")="Fm\bar{3}m"
  SPG_Dict_Latex("Fm-3c")="Fm\bar{3}c"
  SPG_Dict_Latex("Fd-3m")="Fd\bar{3}m"
  SPG_Dict_Latex("Fd-3c")="Fd\bar{3}c"
  SPG_Dict_Latex("Im-3m")="Im\bar{3}m"
  SPG_Dict_Latex("Ia-3d")="Ia\bar{3}d"
EndProcedure

Procedure.s Fill_SPG_Dict_Markdown_Ascii()
  SPG_Dict_Markdown_Ascii("P1")="*P*1"
  SPG_Dict_Markdown_Ascii("P-1")="*P*-1"
  SPG_Dict_Markdown_Ascii("P2")="*P*2"
  SPG_Dict_Markdown_Ascii("P21")="*P*2~1~"
  SPG_Dict_Markdown_Ascii("C2")="*C*2"
  SPG_Dict_Markdown_Ascii("Pm")="*Pm*"
  SPG_Dict_Markdown_Ascii("Pc")="*Pc*"
  SPG_Dict_Markdown_Ascii("Cm")="*Cm*"
  SPG_Dict_Markdown_Ascii("Cc")="*Cc*"
  SPG_Dict_Markdown_Ascii("P2/m")="*P*2/*m*"
  SPG_Dict_Markdown_Ascii("P21/m")="*P*2~1~/*m*"
  SPG_Dict_Markdown_Ascii("C2/m")="*C*2/*m*"
  SPG_Dict_Markdown_Ascii("P2/c")="*P*2/*c*"
  SPG_Dict_Markdown_Ascii("P21/c")="*P*2~1~/*c*"
  SPG_Dict_Markdown_Ascii("P21/n")="*P*2~1~/*n*"
  SPG_Dict_Markdown_Ascii("P21/a")="*P*2~1~/*a*"
  SPG_Dict_Markdown_Ascii("C2/c")="*C*2/*c*"
  SPG_Dict_Markdown_Ascii("P222")="*P*222"
  SPG_Dict_Markdown_Ascii("P2221")="*P*222~1~"
  SPG_Dict_Markdown_Ascii("P21212")="*P*2~1~2~1~2"
  SPG_Dict_Markdown_Ascii("P212121")="*P*2~1~2~1~2~1~"
  SPG_Dict_Markdown_Ascii("C2221")="*C*222~1~"
  SPG_Dict_Markdown_Ascii("C222")="*C*222"
  SPG_Dict_Markdown_Ascii("F222")="*F*222"
  SPG_Dict_Markdown_Ascii("I222")="*I*222"
  SPG_Dict_Markdown_Ascii("I212121")="*I*2~1~2~1~2~1~"
  SPG_Dict_Markdown_Ascii("Pmm2")="*Pmm*2"
  SPG_Dict_Markdown_Ascii("Pmc21")="*Pmc*2~1~"
  SPG_Dict_Markdown_Ascii("Pcc2")="*Pcc*2"
  SPG_Dict_Markdown_Ascii("Pma2")="*Pma*2"
  SPG_Dict_Markdown_Ascii("Pca21")="*Pca*2~1~"
  SPG_Dict_Markdown_Ascii("Pnc2")="*Pnc*2"
  SPG_Dict_Markdown_Ascii("Pmn21")="*Pmn*2~1~"
  SPG_Dict_Markdown_Ascii("Pba2")="*Pba*2"
  SPG_Dict_Markdown_Ascii("Pna21")="*Pna*2~1~"
  SPG_Dict_Markdown_Ascii("Pnn2")="*Pnn*2"
  SPG_Dict_Markdown_Ascii("Cmm2")="*Cmm*2"
  SPG_Dict_Markdown_Ascii("Cmc21")="*Cmc*2~1~"
  SPG_Dict_Markdown_Ascii("Ccc2")="*Ccc*2"
  SPG_Dict_Markdown_Ascii("Amm2")="*Amm*2"
  SPG_Dict_Markdown_Ascii("Abm2")="*Abm*2"
  SPG_Dict_Markdown_Ascii("Ama2")="*Ama*2"
  SPG_Dict_Markdown_Ascii("Aba2")="*Aba*2"
  SPG_Dict_Markdown_Ascii("Fmm2")="*Fmm*2"
  SPG_Dict_Markdown_Ascii("Fdd2")="*Fdd*2"
  SPG_Dict_Markdown_Ascii("Imm2")="*Imm*2"
  SPG_Dict_Markdown_Ascii("Iba2")="*Iba*2"
  SPG_Dict_Markdown_Ascii("Ima2")="*Ima*2"
  SPG_Dict_Markdown_Ascii("Pmmm")="*Pmmm*"
  SPG_Dict_Markdown_Ascii("Pnnn")="*Pnnn*"
  SPG_Dict_Markdown_Ascii("Pccm")="*Pccm*"
  SPG_Dict_Markdown_Ascii("Pban")="*Pban*"
  SPG_Dict_Markdown_Ascii("Pmma")="*Pmma*"
  SPG_Dict_Markdown_Ascii("Pnna")="*Pnna*"
  SPG_Dict_Markdown_Ascii("Pmna")="*Pmna*"
  SPG_Dict_Markdown_Ascii("Pcca")="*Pcca*"
  SPG_Dict_Markdown_Ascii("Pbam")="*Pbam*"
  SPG_Dict_Markdown_Ascii("Pccn")="*Pccn*"
  SPG_Dict_Markdown_Ascii("Pbcm")="*Pbcm*"
  SPG_Dict_Markdown_Ascii("Pnnm")="*Pnnm*"
  SPG_Dict_Markdown_Ascii("Pmmn")="*Pmmn*"
  SPG_Dict_Markdown_Ascii("Pbcn")="*Pbcn*"
  SPG_Dict_Markdown_Ascii("Pbca")="*Pbca*"
  SPG_Dict_Markdown_Ascii("Pnma")="*Pnma*"
  SPG_Dict_Markdown_Ascii("Cmcm")="*Cmcm*"
  SPG_Dict_Markdown_Ascii("Cmca")="*Cmca*"
  SPG_Dict_Markdown_Ascii("Cmmm")="*Cmmm*"
  SPG_Dict_Markdown_Ascii("Cccm")="*Cccm*"
  SPG_Dict_Markdown_Ascii("Cmma")="*Cmma*"
  SPG_Dict_Markdown_Ascii("Ccca")="*Ccca*"
  SPG_Dict_Markdown_Ascii("Fmmm")="*Fmmm*"
  SPG_Dict_Markdown_Ascii("Fddd")="*Fddd*"
  SPG_Dict_Markdown_Ascii("Immm")="*Immm*"
  SPG_Dict_Markdown_Ascii("Ibam")="*Ibam*"
  SPG_Dict_Markdown_Ascii("Ibca")="*Ibca*"
  SPG_Dict_Markdown_Ascii("Imma")="*Imma*"
  SPG_Dict_Markdown_Ascii("P4")="*P*4"
  SPG_Dict_Markdown_Ascii("P41")="*P*4~1~"
  SPG_Dict_Markdown_Ascii("P42")="*P*4~2~"
  SPG_Dict_Markdown_Ascii("P43")="*P*4~3~"
  SPG_Dict_Markdown_Ascii("I4")="*I*4"
  SPG_Dict_Markdown_Ascii("I41")="*I*4~1~"
  SPG_Dict_Markdown_Ascii("P-4")="*P*-4"
  SPG_Dict_Markdown_Ascii("I-4")="*I*-4"
  SPG_Dict_Markdown_Ascii("P4/m")="*P*4/*m*"
  SPG_Dict_Markdown_Ascii("P42/m")="*P*4~2~/*m*"
  SPG_Dict_Markdown_Ascii("P4/n")="*P*4/*n*"
  SPG_Dict_Markdown_Ascii("P42/n")="*P*4~2~/*n*"
  SPG_Dict_Markdown_Ascii("I4/m")="*I*4/*m*"
  SPG_Dict_Markdown_Ascii("I41/a")="*I*4~1~/*a*"
  SPG_Dict_Markdown_Ascii("P422")="*P*422"
  SPG_Dict_Markdown_Ascii("P4212")="*P*42~1~2"
  SPG_Dict_Markdown_Ascii("P4122")="*P*4~1~22"
  SPG_Dict_Markdown_Ascii("P41212")="*P*4~1~2~1~2"
  SPG_Dict_Markdown_Ascii("P4222")="*P*4~2~22"
  SPG_Dict_Markdown_Ascii("P42212")="*P*4~2~2~2~2"
  SPG_Dict_Markdown_Ascii("P4322")="*P*4~3~22"
  SPG_Dict_Markdown_Ascii("P43212")="*P*4~3~2~1~2"
  SPG_Dict_Markdown_Ascii("I422")="*I*422"
  SPG_Dict_Markdown_Ascii("I4122")="*I*4~1~22"
  SPG_Dict_Markdown_Ascii("P4mm")="*P*4*mm*"
  SPG_Dict_Markdown_Ascii("P4bm")="*P*4*bm*"
  SPG_Dict_Markdown_Ascii("P42cm")="*P*4~2~*cm*"
  SPG_Dict_Markdown_Ascii("P42nm")="*P*4~2~*nm*"
  SPG_Dict_Markdown_Ascii("P4cc")="*P*4*cc*"
  SPG_Dict_Markdown_Ascii("P4nc")="*P*4*nc*"
  SPG_Dict_Markdown_Ascii("P42mc")="*P*4~2~*mc*"
  SPG_Dict_Markdown_Ascii("P42bc")="*P*4~2~*bc*"
  SPG_Dict_Markdown_Ascii("I4mm")="*I*4*mm*"
  SPG_Dict_Markdown_Ascii("I4cm")="*I*4*cm*"
  SPG_Dict_Markdown_Ascii("I41md")="*I*4~1~*md*"
  SPG_Dict_Markdown_Ascii("I41cd")="*I*4~1~*cd*"
  SPG_Dict_Markdown_Ascii("P-42m")="*P*-42*m*"
  SPG_Dict_Markdown_Ascii("P-42c")="*P*-42*c*"
  SPG_Dict_Markdown_Ascii("P-421m")="*P*-42~1~*m*"
  SPG_Dict_Markdown_Ascii("P-421c")="*P*-42~1~*c*"
  SPG_Dict_Markdown_Ascii("P-4m2")="*P*-4*m*2"
  SPG_Dict_Markdown_Ascii("P-4c2")="*P*-4*c*2"
  SPG_Dict_Markdown_Ascii("P-4b2")="*P*-4*b*2"
  SPG_Dict_Markdown_Ascii("P-4n2")="*P*-4*n*2"
  SPG_Dict_Markdown_Ascii("I-4m2")="*I*-4*m*2"
  SPG_Dict_Markdown_Ascii("I-4c2")="*I*-4*c*2"
  SPG_Dict_Markdown_Ascii("I-42m")="*I*-42*m*"
  SPG_Dict_Markdown_Ascii("I-42d")="*I*-42*d*"
  SPG_Dict_Markdown_Ascii("P4/mmm")="*P*4/*mmm*"
  SPG_Dict_Markdown_Ascii("P4/mcc")="*P*4/*mcc*"
  SPG_Dict_Markdown_Ascii("P4/nbm")="*P*4/*nbm*"
  SPG_Dict_Markdown_Ascii("P4/nnc")="*P*4/*nnc*"
  SPG_Dict_Markdown_Ascii("P4/mbm")="*P*4/*mbm*"
  SPG_Dict_Markdown_Ascii("P4/mnc")="*P*4/*mnc*"
  SPG_Dict_Markdown_Ascii("P4/nmm")="*P*4/*nmm*"
  SPG_Dict_Markdown_Ascii("P4/ncc")="*P*4/*ncc*"
  SPG_Dict_Markdown_Ascii("P42/mmc")="*P*4~2~/*mmc*"
  SPG_Dict_Markdown_Ascii("P42/mcm")="*P*4~2~/*mcm*"
  SPG_Dict_Markdown_Ascii("P42/nbc")="*P*4~2~/*nbc*"
  SPG_Dict_Markdown_Ascii("P42/nnm")="*P*4~2~/*nnm*"
  SPG_Dict_Markdown_Ascii("P42/mbc")="*P*4~2~/*mbc*"
  SPG_Dict_Markdown_Ascii("P42/mnm")="*P*4~2~/*mnm*"
  SPG_Dict_Markdown_Ascii("P42/nmc")="*P*4~2~/*nmc*"
  SPG_Dict_Markdown_Ascii("P42/ncm")="*P*4~2~/*ncm*"
  SPG_Dict_Markdown_Ascii("I4/mmm")="*I*4/*mmm*"
  SPG_Dict_Markdown_Ascii("I4/mcm")="*I*4/*mcm*"
  SPG_Dict_Markdown_Ascii("I41/amd")="*I*4~1~/*amd*"
  SPG_Dict_Markdown_Ascii("I41/acd")="*I*4~1~/*acd*"
  SPG_Dict_Markdown_Ascii("P3")="*P*3"
  SPG_Dict_Markdown_Ascii("P31")="*P*3~1~"
  SPG_Dict_Markdown_Ascii("P32")="*P*3~2~"
  SPG_Dict_Markdown_Ascii("R3")="*R*3"
  SPG_Dict_Markdown_Ascii("P-3")="*P*-3"
  SPG_Dict_Markdown_Ascii("R-3")="*R*-3"
  SPG_Dict_Markdown_Ascii("P312")="*P*312"
  SPG_Dict_Markdown_Ascii("P321")="*P*321"
  SPG_Dict_Markdown_Ascii("P3112")="*P*3~1~12"
  SPG_Dict_Markdown_Ascii("P3121")="*P*3~1~21"
  SPG_Dict_Markdown_Ascii("P3212")="*P*3~2~12"
  SPG_Dict_Markdown_Ascii("P3221")="*P*3~2~21"
  SPG_Dict_Markdown_Ascii("R32")="*R*32"
  SPG_Dict_Markdown_Ascii("P3m1")="*P*3*m*1"
  SPG_Dict_Markdown_Ascii("P31m")="*P*31*m*"
  SPG_Dict_Markdown_Ascii("P3c1")="*P*3*c*1"
  SPG_Dict_Markdown_Ascii("P31c")="*P*31*c*"
  SPG_Dict_Markdown_Ascii("R3m")="*R*3*m*"
  SPG_Dict_Markdown_Ascii("R3c")="*R*3*c*"
  SPG_Dict_Markdown_Ascii("P-31m")="*P*-31*m*"
  SPG_Dict_Markdown_Ascii("P-31c")="*P*-31*c*"
  SPG_Dict_Markdown_Ascii("P-3m1")="*P*-3*m*1"
  SPG_Dict_Markdown_Ascii("P-3c1")="*P*-3*c*1"
  SPG_Dict_Markdown_Ascii("R-3m")="*R*-3*m*"
  SPG_Dict_Markdown_Ascii("R-3c")="*R*-3*c*"
  SPG_Dict_Markdown_Ascii("P6")="*P*6"
  SPG_Dict_Markdown_Ascii("P61")="*P*6~1~"
  SPG_Dict_Markdown_Ascii("P65")="*P*6~5~"
  SPG_Dict_Markdown_Ascii("P62")="*P*6~2~"
  SPG_Dict_Markdown_Ascii("P64")="*P*6~4~"
  SPG_Dict_Markdown_Ascii("P63")="*P*6~3~"
  SPG_Dict_Markdown_Ascii("P-6")="*P*-6"
  SPG_Dict_Markdown_Ascii("P6/m")="*P*6/*m*"
  SPG_Dict_Markdown_Ascii("P63/m")="*P*6~3~/*m*"
  SPG_Dict_Markdown_Ascii("P622")="*P*622"
  SPG_Dict_Markdown_Ascii("P6122")="*P*6~1~22"
  SPG_Dict_Markdown_Ascii("P6522")="*P*6~5~22"
  SPG_Dict_Markdown_Ascii("P6222")="*P*6~2~22"
  SPG_Dict_Markdown_Ascii("P6422")="*P*6~4~22"
  SPG_Dict_Markdown_Ascii("P6322")="*P*6~3~22"
  SPG_Dict_Markdown_Ascii("P6mm")="*P*6*mm*"
  SPG_Dict_Markdown_Ascii("P6cc")="*P*6*cc*"
  SPG_Dict_Markdown_Ascii("P63cm")="*P*6~3~*cm*"
  SPG_Dict_Markdown_Ascii("P63mc")="*P*6~3~*mc*"
  SPG_Dict_Markdown_Ascii("P-6m2")="*P*-6*m*2"
  SPG_Dict_Markdown_Ascii("P-6c2")="*P*-6*c*2"
  SPG_Dict_Markdown_Ascii("P-62m")="*P*-62*m*"
  SPG_Dict_Markdown_Ascii("P-62c")="*P*-62*c*"
  SPG_Dict_Markdown_Ascii("P6/mmm")="*P*6/*mmm*"
  SPG_Dict_Markdown_Ascii("P6/mcc")="*P*6/*mcc*"
  SPG_Dict_Markdown_Ascii("P63/mcm")="*P*6~3~/*mcm*"
  SPG_Dict_Markdown_Ascii("P63/mmc")="*P*6~3~/*mmc*"
  SPG_Dict_Markdown_Ascii("P23")="*P*23"
  SPG_Dict_Markdown_Ascii("F23")="*F*23"
  SPG_Dict_Markdown_Ascii("I23")="*I*23"
  SPG_Dict_Markdown_Ascii("P213")="*P*2~1~3"
  SPG_Dict_Markdown_Ascii("I213")="*I*2~1~3"
  SPG_Dict_Markdown_Ascii("Pm-3")="*Pm*-3"
  SPG_Dict_Markdown_Ascii("Pn-3")="*Pn*-3"
  SPG_Dict_Markdown_Ascii("Fm-3")="*Fm*-3"
  SPG_Dict_Markdown_Ascii("Fd-3")="*Fd*-3"
  SPG_Dict_Markdown_Ascii("Im-3")="*Im*-3"
  SPG_Dict_Markdown_Ascii("Pa-3")="*Pa*-3"
  SPG_Dict_Markdown_Ascii("Ia-3")="*Ia*-3"
  SPG_Dict_Markdown_Ascii("P432")="*P*432"
  SPG_Dict_Markdown_Ascii("P4232")="*P*4~2~32"
  SPG_Dict_Markdown_Ascii("F432")="*F*432"
  SPG_Dict_Markdown_Ascii("F4132")="*F*4~1~32"
  SPG_Dict_Markdown_Ascii("I432")="*I*432"
  SPG_Dict_Markdown_Ascii("P4332")="*P*4~3~32"
  SPG_Dict_Markdown_Ascii("P4132")="*P*4~1~32"
  SPG_Dict_Markdown_Ascii("I4132")="*I*4~1~32"
  SPG_Dict_Markdown_Ascii("P-43m")="*P*-43*m*"
  SPG_Dict_Markdown_Ascii("F-43m")="*F*-43*m*"
  SPG_Dict_Markdown_Ascii("I-43m")="*I*-43*m*"
  SPG_Dict_Markdown_Ascii("P-43n")="*P*-43*n*"
  SPG_Dict_Markdown_Ascii("F-43c")="*F*-43*c*"
  SPG_Dict_Markdown_Ascii("I-43d")="*I*-43*d*"
  SPG_Dict_Markdown_Ascii("Pm-3m")="*Pm*-3*m*"
  SPG_Dict_Markdown_Ascii("Pn-3n")="*Pn*-3*n*"
  SPG_Dict_Markdown_Ascii("Pm-3n")="*Pm*-3*n*"
  SPG_Dict_Markdown_Ascii("Pn-3m")="*Pn*-3*m*"
  SPG_Dict_Markdown_Ascii("Fm-3m")="*Fm*-3*m*"
  SPG_Dict_Markdown_Ascii("Fm-3c")="*Fm*-3*c*"
  SPG_Dict_Markdown_Ascii("Fd-3m")="*Fd*-3*m*"
  SPG_Dict_Markdown_Ascii("Fd-3c")="*Fd*-3*c*"
  SPG_Dict_Markdown_Ascii("Im-3m")="*Im*-3*m*"
  SPG_Dict_Markdown_Ascii("Ia-3d")="*Ia*-3*d*"
EndProcedure

Procedure.s Fill_Greek_Dict_Latex()
  Greek_Dict_Latex("G{a}")="$\alpha$"
  Greek_Dict_Latex("G{b}")="$\beta$"
  Greek_Dict_Latex("G{g}")="$\gamma$"
  Greek_Dict_Latex("G{r}")="$\rho$"
  Greek_Dict_Latex("G{m}")="$\mu$"
  Greek_Dict_Latex("G{s}")="$\sigma$"
  Greek_Dict_Latex("G{q}")="$\theta$"
EndProcedure



DataSection
  AllElements:
  Data.s "Ac", "Ag", "Al", "Am", "Ar", "As", "At", "Au", "B", "Ba", "Be", "Bh", "Bi", "Bk", "Br", "C", "Ca", "Cd", "Ce", "Cf", "Cl", "Cm", "Cn", "Co", "Cr", "Cs", "Cu", "D", "Db", "Ds", "Dy", "Er", "Es", "Eu", "F", "Fe", "Fl", "Fm", "Fr", "Ga", "Gd", "Ge", "H", "He", "Hf", "Hg", "Ho", "Hs", "I", "In", "Ir", "K", "Kr", "La", "Li", "Lr", "Lu", "Lv", "Md", "Mg", "Mn", "Mo", "Mt", "N", "Na", "Nb", "Nd", "Ne", "Ni", "No", "Np", "O", "Os", "P", "Pa", "Pb", "Pd", "Pm", "Po", "Pr", "Pt", "Pu", "Ra", "Rb", "Re", "Rf", "Rg", "Rh", "Rn", "Ru", "S", "Sb", "Sc", "Se", "Sg", "Si", "Sm", "Sn", "Sr", "Ta", "Tb", "Tc", "Te", "Th", "Ti", "Tl", "Tm", "U", "Uuo", "Uup", "Uus", "Uut", "V", "W", "Xe", "Y", "Yb", "Zn", "Zr", "END"
EndDataSection

DataSection   
  SymSymbols:
  Data.s "'", "''", "'''", "(IV)", "(V)", "(VI)", "(VII)","(VIII)", "(IX)" ,"(X)", "(XI)", "(XII)", "(XIII)", "(XIV)", "(XV)", "(XVI)", "(XVII)", "(XVIII)", "(XIX)", "(XX)"
  Data.s "(21)", "(22)", "(23)", "(24)", "(25)", "(26)", "(27)", "(28)", "(29)", "(30)", "(31)", "(32)", "(33)", "(34)", "(35)", "(36)", "(37)", "(38)", "(39)", "(40)"
  Data.s "(41)", "(42)", "(43)", "(44)", "(45)", "(46)", "(47)", "(48)", "(49)", "(50)", "(51)", "(52)", "(53)", "(54)", "(55)", "(56)", "(57)", "(58)", "(59)", "(60)"
  Data.s "(61)", "(62)", "(63)", "(64)", "(65)", "(66)", "(67)", "(68)", "(69)", "(70)", "(71)", "(72)", "(73)", "(74)", "(75)", "(76)", "(77)", "(78)", "(79)", "(80)"
  Data.s "(81)", "(82)", "(83)", "(84)", "(85)", "(86)", "(87)", "(88)", "(89)", "(80)", "(81)", "(82)", "(83)", "(84)", "(85)", "(86)", "(87)", "(88)", "(89)", "(90)"
  Data.s "(91)", "(92)", "(93)", "(94)", "(95)", "(96)", "(97)", "(98)", "(99)"
  Data.s "(100)", "(101)", "(102)", "(103)", "(104)", "(105)", "(106)", "(107)", "(108)", "(109)", "(110)"
  Data.s "(111)", "(112)", "(113)", "(114)", "(115)", "(116)", "(117)", "(118)", "(119)", "(120)", "(121)", "(122)", "(123)", "(124)", "(125)", "(126)", "(127)", "(128)", "(129)", "(130)"
  Data.s "(131)", "(132)", "(133)", "(134)", "(135)", "(136)", "(137)", "(138)", "(139)", "(140)", "(141)", "(142)", "(143)", "(144)", "(145)", "(146)", "(147)", "(148)", "(149)", "(150)"
  Data.s "(151)", "(152)", "(153)", "(154)", "(155)", "(156)", "(157)", "(158)", "(159)", "(160)", "(161)", "(162)", "(163)", "(164)", "(165)", "(166)", "(167)", "(168)", "(169)", "(170)"
  Data.s "(171)", "(172)", "(173)", "(174)", "(175)", "(176)", "(177)", "(178)", "(179)", "(180)", "(181)", "(182)", "(183)", "(144)", "(185)", "(186)", "(187)", "(188)", "(189)", "(190)"
  Data.s "(191)", "(192)", "(193)", "(194)", "(195)", "(196)", "(197)", "(198)", "(199)", "(200)"
  Data.s "(200)", "(201)", "(202)", "(203)", "(204)", "(205)", "(206)", "(207)", "(208)", "(209)", "(210)"
  Data.s "(211)", "(212)", "(213)", "(214)", "(215)", "(216)", "(217)", "(218)", "(219)", "(220)", "(221)", "(222)", "(223)", "(224)", "(225)", "(226)", "(227)", "(228)", "(229)", "(230)"
  Data.s "(231)", "(232)", "(233)", "(234)", "(235)", "(236)", "(237)", "(238)", "(239)", "(240)", "(241)", "(242)", "(243)", "(244)", "(245)", "(246)", "(247)", "(248)", "(249)", "(250)"
  Data.s "(251)", "(252)", "(253)", "(254)", "(255)", "(256)", "(257)", "(258)", "(259)", "(260)", "(261)", "(262)", "(263)", "(264)", "(265)", "(266)", "(267)", "(268)", "(269)", "(270)"
  Data.s "(271)", "(272)", "(273)", "(274)", "(275)", "(276)", "(277)", "(278)", "(279)", "(280)", "(281)", "(282)", "(283)", "(244)", "(285)", "(286)", "(287)", "(288)", "(289)", "(290)"
  Data.s "(291)", "(292)", "(293)", "(294)", "(295)", "(296)", "(297)", "(298)", "(299)", "(300)"
  Data.s "(300)", "(301)", "(302)", "(203)", "(204)", "(205)", "(206)", "(207)", "(208)", "(209)", "(210)"
  Data.s "(311)", "(312)", "(313)", "(314)", "(315)", "(316)", "(317)", "(318)", "(319)", "(320)", "(321)", "(322)", "(323)", "(324)", "(325)", "(326)", "(327)", "(328)", "(329)", "(330)"
  Data.s "(331)", "(332)", "(333)", "(334)", "(335)", "(336)", "(337)", "(338)", "(339)", "(340)", "(341)", "(342)", "(343)", "(344)", "(345)", "(346)", "(347)", "(348)", "(349)", "(350)"
  Data.s "(351)", "(352)", "(353)", "(354)", "(355)", "(356)", "(357)", "(358)", "(359)", "(360)", "(361)", "(362)", "(363)", "(364)", "(365)", "(366)", "(367)", "(368)", "(369)", "(370)"
  Data.s "(371)", "(372)", "(373)", "(374)", "(375)", "(376)", "(377)", "(378)", "(379)", "(380)", "(381)", "(382)", "(383)", "(344)", "(385)", "(386)", "(387)", "(388)", "(389)", "(390)"
  Data.s "(391)", "(392)", "(393)", "(394)", "(395)", "(396)", "(397)", "(398)", "(399)", "(400)"
  Data.s "(500)", "(501)", "(502)", "(503)", "(504)", "(505)", "(506)", "(507)", "(508)", "(509)", "(510)"
  Data.s "(511)", "(512)", "(513)", "(514)", "(515)", "(516)", "(517)", "(518)", "(519)", "(520)", "(521)", "(522)", "(523)", "(524)", "(525)", "(526)", "(527)", "(528)", "(529)", "(530)"
  Data.s "(531)", "(532)", "(533)", "(534)", "(535)", "(536)", "(537)", "(538)", "(539)", "(540)", "(541)", "(542)", "(543)", "(544)", "(545)", "(546)", "(547)", "(548)", "(549)", "(550)"
  Data.s "(551)", "(552)", "(553)", "(554)", "(555)", "(556)", "(557)", "(558)", "(559)", "(560)", "(561)", "(562)", "(563)", "(564)", "(565)", "(566)", "(567)", "(568)", "(569)", "(570)"
  Data.s "(571)", "(572)", "(573)", "(574)", "(575)", "(576)", "(577)", "(578)", "(579)", "(580)", "(581)", "(582)", "(583)", "(544)", "(585)", "(586)", "(587)", "(588)", "(589)", "(590)"
  Data.s "(591)", "(592)", "(593)", "(594)", "(595)", "(596)", "(597)", "(598)", "(599)", "(600)"
  Data.s "(600)", "(601)", "(602)", "(603)", "(604)", "(605)", "(606)", "(607)", "(608)", "(609)", "(610)"
  Data.s "(611)", "(612)", "(613)", "(614)", "(615)", "(616)", "(617)", "(618)", "(619)", "(620)", "(621)", "(622)", "(623)", "(624)", "(625)", "(626)", "(627)", "(628)", "(629)", "(630)"
  Data.s "(631)", "(632)", "(633)", "(634)", "(635)", "(636)", "(637)", "(638)", "(639)", "(640)", "(641)", "(642)", "(643)", "(644)", "(645)", "(646)", "(647)", "(648)", "(649)", "(650)"
  Data.s "(651)", "(652)", "(653)", "(654)", "(655)", "(656)", "(657)", "(658)", "(659)", "(660)", "(661)", "(662)", "(663)", "(664)", "(665)", "(666)", "(667)", "(668)", "(669)", "(670)"
  Data.s "(671)", "(672)", "(673)", "(674)", "(675)", "(676)", "(677)", "(678)", "(679)", "(580)", "(681)", "(682)", "(683)", "(644)", "(685)", "(686)", "(687)", "(688)", "(689)", "(690)"
  Data.s "(691)", "(692)", "(693)", "(694)", "(695)", "(696)", "(697)", "(698)", "(699)", "(700)"
  Data.s "(701)", "(701)", "(702)", "(703)", "(704)", "(705)", "(706)", "(707)", "(708)", "(709)", "(710)"
  Data.s "(711)", "(712)", "(713)", "(714)", "(715)", "(716)", "(717)", "(718)", "(719)", "(720)", "(721)", "(722)", "(723)", "(724)", "(725)", "(726)", "(727)", "(728)", "(729)", "(730)"
  Data.s "(731)", "(732)", "(733)", "(734)", "(735)", "(736)", "(737)", "(738)", "(739)", "(740)", "(741)", "(742)", "(743)", "(744)", "(745)", "(746)", "(747)", "(748)", "(749)", "(750)"
  Data.s "(751)", "(752)", "(753)", "(754)", "(755)", "(756)", "(757)", "(758)", "(759)", "(760)", "(761)", "(762)", "(763)", "(764)", "(765)", "(766)", "(767)", "(768)", "(769)", "(770)"
  Data.s "(771)", "(772)", "(773)", "(774)", "(775)", "(776)", "(777)", "(778)", "(779)", "(780)", "(781)", "(782)", "(783)", "(744)", "(785)", "(786)", "(787)", "(788)", "(789)", "(790)"
  Data.s "(791)", "(792)", "(793)", "(794)", "(795)", "(796)", "(797)", "(798)", "(799)", "(800)"
  Data.s "(801)", "(801)", "(802)", "(803)", "(804)", "(805)", "(806)", "(807)", "(808)", "(809)", "(810)"
  Data.s "(811)", "(812)", "(813)", "(814)", "(815)", "(816)", "(817)", "(818)", "(819)", "(820)", "(821)", "(822)", "(823)", "(824)", "(825)", "(826)", "(827)", "(828)", "(829)", "(830)"
  Data.s "(831)", "(832)", "(833)", "(834)", "(835)", "(836)", "(837)", "(838)", "(839)", "(840)", "(841)", "(842)", "(843)", "(844)", "(845)", "(846)", "(847)", "(848)", "(849)", "(850)"
  Data.s "(851)", "(852)", "(853)", "(854)", "(855)", "(856)", "(857)", "(858)", "(859)", "(860)", "(861)", "(862)", "(863)", "(864)", "(865)", "(866)", "(867)", "(868)", "(869)", "(870)"
  Data.s "(871)", "(872)", "(873)", "(874)", "(875)", "(876)", "(877)", "(878)", "(879)", "(880)", "(881)", "(882)", "(883)", "(844)", "(885)", "(886)", "(887)", "(888)", "(889)", "(890)"
  Data.s "(891)", "(892)", "(893)", "(894)", "(895)", "(896)", "(897)", "(898)", "(899)", "(900)"
  Data.s "(901)", "(901)", "(902)", "(903)", "(904)", "(905)", "(906)", "(907)", "(908)", "(909)", "(910)"
  Data.s "(911)", "(912)", "(913)", "(914)", "(915)", "(916)", "(917)", "(918)", "(919)", "(920)", "(921)", "(922)", "(923)", "(924)", "(925)", "(926)", "(927)", "(928)", "(929)", "(930)"
  Data.s "(931)", "(932)", "(933)", "(934)", "(935)", "(936)", "(937)", "(938)", "(939)", "(940)", "(941)", "(942)", "(943)", "(944)", "(945)", "(946)", "(947)", "(948)", "(949)", "(950)"
  Data.s "(951)", "(952)", "(953)", "(954)", "(955)", "(956)", "(957)", "(958)", "(959)", "(960)", "(961)", "(962)", "(963)", "(964)", "(965)", "(966)", "(967)", "(968)", "(969)", "(970)"
  Data.s "(971)", "(972)", "(973)", "(974)", "(975)", "(976)", "(977)", "(978)", "(979)", "(980)", "(981)", "(982)", "(983)", "(944)", "(985)", "(986)", "(987)", "(988)", "(989)", "(990)"
  Data.s "(991)", "(992)", "(993)", "(994)", "(995)", "(996)", "(997)", "(998)", "(999)", "(WTF)"
  Data.s "(WTF)", "(WTF)", "(WTF)", "(WTF)", "(WTF)", "(WTF)", "(WTF)", "(WTF)", "(WTF)", "(WTF)", "(WTF)"
  Data.s "(STOP)", "(STOP)", "(STOP)", "(STOP)", "(STOP)", "(STOP)", "(STOP)", "(STOP)", "(STOP)", "(STOP)", "(STOP)"
EndDataSection

DataSection
  Default_Profile:
  IncludeBinary "default.clprofile"
  Data.b 0 
EndDataSection

DataSection
  Ltable_Profile:
  IncludeBinary "ltable.clprofile"
  Data.b 0 
EndDataSection

DataSection
  Help_Text:
  IncludeBinary "help.txt"
  Data.b 0 
EndDataSection

DataSection
  License_Text:
  IncludeBinary "license.txt"
  Data.b 0 
EndDataSection
