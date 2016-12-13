EnableExplicit

;#############################
;##     Value-Interface     ##
;#############################
;##   (c) Nicolas Goeddel   ##
;##  written in PureBasic   ##
;#############################
;---------------
;Hints:
;- Complex > Real > Rational (o = Add, Sub, Mul, Div, Pow)
;  - (Rational o Real)    -> Real
;  - (Rational o Complex) -> Complex
;  - (Real o Complex)     -> Complex

#Value_Errors = #True

;Declare Value_New(type.l, *Value = 0)

Enumeration
  #Value_Undefined
  #Value_Rational
  #Value_Real
  #Value_Complex
EndEnumeration

Interface Value
  Free()
  Value()
  NewFromType()
  Copy()
  Str.s(nbDecimals.l = -1)
  Val(string.s)
  Flip(*v)
  Set(*v)
  Get(*v)
  Add(*v)
  Sub(*v)
  Mul(*v)
  Div(*v)
  Pow(*v)
  Null()
  Neg()
  SetNull()
  SetOne()
  Invert()
  Convert(type.l, nbDecimals.l = 10)
  Sqr()
EndInterface

Structure Value_Rat
  a.q
  b.q
EndStructure
Structure Value_Real
  r.d
EndStructure
Structure Value_Complex
  r.d
  i.d
EndStructure

Structure Value_S
  *VTable
  *f.Value
  ;type.l           ;No type-definition, because the VTable types it too
  StructureUnion
    value.l         ;The Value()-Method pointers to this
    rat.Value_Rat
    real.Value_Real
    complex.Value_Complex
  EndStructureUnion
EndStructure

Procedure Value_ggT(*x.Value_Rat) ;Steinscher Algorithmus
  Protected k.l = 0, t.q, a.q = *x\a, b.q = *x\b
  If *x\a = 0
    *x\b = 1
    ProcedureReturn
  EndIf
  If *x\b < 0
    *x\a = -*x\a
    *x\b = -*x\b
  EndIf
  a = *x\a
  If a < 0 : a = -a : EndIf
  b = *x\b
  While Not (a & 1 Or b & 1)
    a >> 1
    b >> 1
    k + 1
  Wend
  If a & 1 : t = -b : Else : t = a : EndIf
  While t
    While Not t & 1
      t >> 1
    Wend
    ;If t > 0 : a = t : Else : b = -t : EndIf
    ;t = a - b
    If t > 0 : a = t : t - b : Else : b = -t : t + a : EndIf
  Wend
  a << k
  *x\a / a
  *x\b / a
EndProcedure
Macro Exp(x) ;exponentialfunktion
  Pow(2.71828182845905, x)
EndMacro

;- Undefined
Procedure Value_Undefined_Copy(*x.Value_S)
  ProcedureReturn *x\f\NewFromType()
EndProcedure

Procedure.s Value_Undefined_Str(*x.Value_S, nbDecimals.l)
  ProcedureReturn "undefined"
EndProcedure

Procedure Value_Undefined_Val(*x.Value_S, String.s)

  Protected s1.s, s2.s, m.l
  s1 = StringField(String, 1, "/")
  s2 = StringField(String, 2, "/")
 
  If s2
    *x\VTable = ?Value_VTable_Rational
    *x\rat\a = Val(s1)
    *x\rat\b = Val(s2)
    Value_ggT(*x\rat)
  Else
    If Not FindString(s1, ".", 1) And Not FindString(s1, "i", 1)
      *x\VTable = ?Value_VTable_Rational
      *x\rat\a = Val(s1)
      *x\rat\b = 1
      Value_ggT(*x\rat)
    Else
      If Not FindString(s1, "i", 1)
        *x\VTable = ?Value_VTable_Real
        *x\real\r = ValD(s1)
      Else
        m = FindString(s1, "-", 2)
        If m
          s2 = Mid(s1, m, Len(s1))
          s1 = Left(s1, m - 1)
        Else
          m = FindString(s1, "+", 2)
          s2 = Mid(s1, m, Len(s1))
          s1 = Left(s1, m - 1)
        EndIf
        If FindString(s1, "i", 1) : Swap s1, s2 : EndIf
        *x\VTable = ?Value_VTable_Complex
        *x\complex\r = ValD(s1)
        *x\complex\i = ValD(s2)
      EndIf
    EndIf
  EndIf
 
  ProcedureReturn *x
EndProcedure

Procedure Value_Undefined_Flip(*x.Value_S, *v.Value_S)
    Protected  rat.Value_Rat
 
  Select *v\VTable
    Case ?Value_VTable_Undefined
      ;do nothing
    Case ?Value_VTable_Rational
      *x\rat\a = *v\rat\a
      *x\rat\b = *v\rat\b
      Swap *x\VTable, *v\VTable
    Case ?Value_VTable_Real
      *x\real\r = *v\real\r
      Swap *x\VTable, *v\VTable
    Case ?Value_VTable_Complex
      *x\complex\r = *v\complex\r
      *x\complex\i = *v\complex\i
      Swap *x\VTable, *v\VTable
    EndSelect
  ProcedureReturn *x
EndProcedure

Procedure Value_Undefined_Add(*x.Value_S, *v.Value_S)
  ProcedureReturn *x\f\Set(*v)
EndProcedure

Procedure Value_Undefined_Sub(*x.Value_S, *v.Value_S)
  *x\f\Set(*v)
  ProcedureReturn *x\f\Neg()
EndProcedure

Procedure Value_Undefined_DoNothing(*x.Value_S)
  ProcedureReturn *x
EndProcedure

;- Rational
Procedure Value_Rational_Convert(*x.Value_S, type.l, dummy.l = 0)
  Protected v.Value_Rat
 
  If type = #Value_Rational
    ProcedureReturn *x
  EndIf
 
  v\a = *x\rat\a
  v\b = *x\rat\b
 
  Select type
    Case #Value_Real
      *x\VTable = ?Value_VTable_Real
      *x\real\r = v\a / v\b
    Case #Value_Complex
      *x\VTable = ?Value_VTable_Complex
      *x\complex\r = v\a / v\b
      *x\complex\i = 0.0
  EndSelect
 
  ProcedureReturn *x
EndProcedure

Procedure Value_Rational_Copy(*x.Value_S)
  Protected *Value.Value_S = *x\f\NewFromType()
 
  CompilerIf #Value_Errors
  If Not *Value : ProcedureReturn #False : EndIf
  CompilerEndIf
 
  *Value\rat\a = *x\rat\a
  *Value\rat\b = *x\rat\b
 
  ProcedureReturn *Value
EndProcedure

Procedure.s Value_Rational_Str(*x.Value_S, dummy.l)
  If *x\rat\b = 1
    ProcedureReturn Str(*x\rat\a)
  Else
    ProcedureReturn Str(*x\rat\a) + "/" + Str(*x\rat\b)
  EndIf
EndProcedure

Procedure Value_Rational_Val(*x.Value_S, string.s)
  *x\rat\a = Val(string)
  If FindString(string, "/", 1)
    *x\rat\b = Val(StringField(string, 2, "/"))
  Else
    *x\rat\b = 1
  EndIf
  Value_ggT(*x\rat)
 
  ProcedureReturn *x
EndProcedure

Procedure Value_Rational_Flip(*x.Value_S, *v.Value_S)
  Protected  rat.Value_Rat
 
  Select *v\VTable
    Case ?Value_VTable_Rational
      Swap *x\rat\a, *v\rat\a
      Swap *x\rat\b, *v\rat\b
    Case ?Value_VTable_Undefined
      *v\rat\a = *x\rat\a
      *v\rat\b = *x\rat\b
      Swap *x\VTable, *v\VTable
    Case ?Value_VTable_Real
      rat\a = *x\rat\a
      rat\b = *x\rat\b
      *x\real\r = *v\real\r
      *v\rat\a = rat\a
      *v\rat\b = rat\b
      Swap *x\VTable, *v\VTable
    Case ?Value_VTable_Complex
      rat\a = *x\rat\a
      rat\b = *x\rat\b
      *x\complex\r = *v\complex\r
      *x\complex\i = *v\complex\i
      *v\rat\a = rat\a
      *v\rat\b = rat\b
      Swap *x\VTable, *v\VTable
  EndSelect
 
  ProcedureReturn *x
EndProcedure

Procedure Value_Rational_Get(*x.Value_S, *v.Value_S) ;*x\Set(*v) = *v\Get(*x), if *x\type = *v\type
  Select *v\VTable
    Case ?Value_VTable_Rational
      *v\rat\a = *x\rat\a
      *v\rat\b = *x\rat\b
    Case ?Value_VTable_Real
      *v\real\r = *x\rat\a / *x\rat\b
    Case ?Value_VTable_Complex
      *v\complex\r = *x\rat\a / *x\rat\b
      *v\complex\i = 0.0
  EndSelect
 
  ProcedureReturn *x
EndProcedure

Procedure Value_Rational_Add(*x.Value_S, *v.Value_S)
  Select *v\VTable
    Case ?Value_VTable_Rational
      *x\rat\a * *v\rat\b + *x\rat\b * *v\rat\a
      *x\rat\b * *v\rat\b
      Value_ggT(*x\rat)
    Case ?Value_VTable_Real
      *x\f\Convert(#Value_Real)
      *x\f\Add(*v)
    Case ?Value_VTable_Complex
      *x\f\Convert(#Value_Complex)
      *x\f\Add(*v)
  EndSelect
 
  ProcedureReturn *x
EndProcedure

Procedure Value_Rational_Sub(*x.Value_S, *v.Value_S)
  Select *v\VTable
    Case ?Value_VTable_Rational
      *x\rat\a * *v\rat\b - *x\rat\b * *v\rat\a
      *x\rat\b * *v\rat\b
      Value_ggT(*x\rat)
    Case ?Value_VTable_Real
      *x\f\Convert(#Value_Real)
      *x\f\Sub(*v)
    Case ?Value_VTable_Complex
      *x\f\Convert(#Value_Complex)
      *x\f\Sub(*v)
  EndSelect
 
  ProcedureReturn *x
EndProcedure

Procedure Value_Rational_Mul(*x.Value_S, *v.Value_S)
  Select *v\VTable
    Case ?Value_VTable_Rational
      *x\rat\a * *v\rat\a
      *x\rat\b * *v\rat\b
      Value_ggT(*x\rat)
    Case ?Value_VTable_Real
      *x\f\Convert(#Value_Real)
      *x\f\Mul(*v)
    Case ?Value_VTable_Complex
      *x\f\Convert(#Value_Complex)
      *x\f\Div(*v)
  EndSelect
 
  ProcedureReturn *x
EndProcedure

Procedure Value_Rational_Div(*x.Value_S, *v.Value_S)
  Select *v\VTable
    Case ?Value_VTable_Rational
      *x\rat\a * *v\rat\b
      *x\rat\b * *v\rat\a
      Value_ggT(*x\rat)
    Case ?Value_VTable_Real
      *x\f\Convert(#Value_Real)
      *x\f\Sub(*v)
    Case ?Value_VTable_Complex
      *x\f\Convert(#Value_Complex)
      *x\f\Sub(*v)
  EndSelect
 
  ProcedureReturn *x
EndProcedure

Procedure Value_Rational_Pow(*x.Value_S, *v.Value_S)
  Select *v\VTable
    Case ?Value_VTable_Rational
      If *v\rat\b = 1
        *x\rat\a = Pow(*x\rat\a, *v\rat\a)
        *x\rat\b = Pow(*x\rat\b, *v\rat\a)
      Else
        *x\f\Convert(#Value_Real)
        *x\f\Pow(*v)
      EndIf
    Case ?Value_VTable_Real
      *x\f\Convert(#Value_Real)
      *x\f\Pow(*v)
    Case ?Value_VTable_Complex
      *x\f\Convert(#Value_Complex)
      *x\f\Pow(*v)
  EndSelect
 
  ProcedureReturn *x
EndProcedure

Procedure Value_Rational_Null(*x.Value_S)
  If *x\rat\a = 0
    ProcedureReturn #True
  EndIf
  ProcedureReturn #False
EndProcedure

Procedure Value_Rational_Neg(*x.Value_S)
  *x\rat\a = -*x\rat\a
  ProcedureReturn *x
EndProcedure

Procedure Value_Rational_SetNull(*x.Value_S)
  *x\rat\a = 0
  *x\rat\b = 1
  ProcedureReturn *x
EndProcedure

Procedure Value_Rational_SetOne(*x.Value_S)
  *x\rat\a = 1
  *x\rat\b = 1
  ProcedureReturn *x
EndProcedure

Procedure Value_Rational_Invert(*x.Value_S)
  Swap *x\rat\a, *x\rat\b
  ProcedureReturn *x
EndProcedure

Procedure Value_Rational_Sqr(*x.Value_S)
  Protected i.d
 
  If *x\rat\a > 0
    *x\VTable = ?Value_VTable_Real
    i = *x\rat\a / *x\rat\b
    *x\real\r = Sqr(i)
  ElseIf *x\rat\a < 0
    *x\VTable = ?Value_VTable_Complex
    i = -*x\rat\a / *x\rat\b
    *x\complex\r = 0.0
    *x\complex\i = Sqr(i)
  EndIf
 
  ProcedureReturn *x
EndProcedure

;- Real
Procedure Value_Real_Copy(*x.Value_S)
  Protected *Value.Value_S = *x\f\NewFromType()
 
  CompilerIf #Value_Errors
  If Not *Value : ProcedureReturn #False : EndIf
  CompilerEndIf
 
  *Value\real\r = *x\real\r
 
  ProcedureReturn *Value
EndProcedure

Procedure.s Value_Real_Str(*x.Value_S, nbDecimals.l)
  If nbDecimals = -1
    ProcedureReturn StrD(*x\real\r)
  Else
    ProcedureReturn StrD(*x\real\r, nbDecimals)
  EndIf
EndProcedure

Procedure Value_Real_Val(*x.Value_S, string.s)
  *x\real\r = ValD(string)
  ProcedureReturn *x
EndProcedure

Procedure Value_Real_Flip(*x.Value_S, *v.Value_S)
  Protected real.Value_Real
 
  Select *v\VTable
    Case ?Value_VTable_Real
      Swap *x\real\r, *v\real\r
    Case ?Value_VTable_Undefined
      *v\real\r = *x\real\r
      Swap *x\VTable, *v\VTable
    Case ?Value_VTable_Rational
      real\r = *x\real\r
      *x\rat\a = *v\rat\a
      *x\rat\b = *v\rat\b
      *v\real\r = real\r
      Swap *x\VTable, *v\VTable
    Case ?Value_VTable_Complex
      real\r = *x\real\r
      *x\complex\r = *v\complex\r
      *x\complex\i = *v\complex\i
      *v\real\r = real\r
      Swap *x\VTable, *v\VTable
  EndSelect
 
  ProcedureReturn *x
EndProcedure

Procedure Value_Real_Get(*x.Value_S, *v.Value_S) ;*x\Set(*v) = *v\Get(*x), if *x\type = *v\type
  Select *v\VTable
    Case ?Value_VTable_Real
      *v\real\r = *x\real\r
    Case ?Value_VTable_Complex
      *v\complex\r = *x\real\r
      *v\complex\i = 0.0
    Case ?Value_VTable_Rational
      ProcedureReturn -1
  EndSelect
 
  ProcedureReturn *x
EndProcedure

Procedure Value_Real_Add(*x.Value_S, *v.Value_S)
  Select *v\VTable
    Case ?Value_VTable_Real
      *x\real\r + *v\real\r
    Case ?Value_VTable_Rational
      *x\real\r + (*v\rat\a / *v\rat\b)
    Case ?Value_VTable_Complex
      *x\f\Convert(#Value_Complex)
      *x\f\Add(*v)
  EndSelect
 
  ProcedureReturn *x
EndProcedure

Procedure Value_Real_Sub(*x.Value_S, *v.Value_S)
  Select *v\VTable
    Case ?Value_VTable_Real
      *x\real\r - *v\real\r
    Case ?Value_VTable_Rational
      *x\real\r - (*v\rat\a / *v\rat\b)
    Case ?Value_VTable_Complex
      *x\f\Convert(#Value_Complex)
      *x\f\Sub(*v)
  EndSelect
 
  ProcedureReturn *x
EndProcedure

Procedure Value_Real_Mul(*x.Value_S, *v.Value_S)
  Select *v\VTable
    Case ?Value_VTable_Real
      *x\real\r * *v\real\r
    Case ?Value_VTable_Rational
      *x\real\r * *v\rat\a / *v\rat\b
    Case ?Value_VTable_Complex
      *x\f\Convert(#Value_Complex)
      *x\f\Mul(*v)
  EndSelect
 
  ProcedureReturn *x
EndProcedure

Procedure Value_Real_Div(*x.Value_S, *v.Value_S)
  Select *v\VTable
    Case ?Value_VTable_Real
      *x\real\r / *v\real\r
    Case ?Value_VTable_Rational
      *x\real\r * (*v\rat\b / *v\rat\a)
    Case ?Value_VTable_Complex
      *x\f\Convert(#Value_Complex)
      *x\f\Div(*v)
  EndSelect
 
  ProcedureReturn *x
EndProcedure

Procedure Value_Real_Pow(*x.Value_S, *v.Value_S)
  Select *v\VTable
    Case ?Value_VTable_Real
      *x\real\r = Pow(*x\real\r, *v\real\r)
    Case ?Value_VTable_Rational
      *x\real\r = Pow(*x\real\r, *v\rat\a / *v\rat\b)
    Case ?Value_VTable_Complex
      *x\f\Convert(#Value_Complex)
      *x\f\Pow(*v)
  EndSelect
 
  ProcedureReturn *x
EndProcedure

Procedure Value_Real_Null(*x.Value_S)
  If *x\real\r = 0.0
    ProcedureReturn #True
  EndIf
 
  ProcedureReturn #False
EndProcedure

Procedure Value_Real_Neg(*x.Value_S)
  *x\real\r * -1
 
  ProcedureReturn *x
EndProcedure

Procedure Value_Real_SetNull(*x.Value_S)
  *x\real\r = 0.0
  ProcedureReturn *x
EndProcedure

Procedure Value_Real_SetOne(*x.Value_S)
  *x\real\r = 1.0
  ProcedureReturn *x
EndProcedure

Procedure Value_Real_Invert(*x.Value_S)
  *x\real\r = 1 / *x\real\r
  ProcedureReturn *x
EndProcedure

Procedure Value_Real_Convert(*x.Value_S, type.l, nbDecimals.l)
  Protected v.Value_Real, mul.d = Pow(10, nbDecimals)
 
  If type = #Value_Real
    ProcedureReturn *x
  EndIf
 
  v\r = *x\real\r
 
  Select type
    Case #Value_Rational
      *x\VTable = ?Value_VTable_Rational
      *x\rat\a = IntQ(v\r * mul)
      *x\rat\b = IntQ(mul)
      Value_ggT(*x\rat)
    Case #Value_Complex
      *x\VTable = ?Value_VTable_Complex
      *x\complex\r = v\r
      *x\complex\i = 0.0
  EndSelect
 
  ProcedureReturn *x
EndProcedure

Procedure Value_Real_Sqr(*x.Value_S)
  Protected i.d
 
  If *x\real\r >= 0
    *x\real\r = Sqr(*x\real\r)
  Else
    i = -*x\real\r
    *x\VTable = ?Value_VTable_Complex
    *x\complex\r = 0.0
    *x\complex\i = Sqr(i)
  EndIf
 
  ProcedureReturn *x
EndProcedure

;- Complex
Procedure Value_Complex_Copy(*x.Value_S)
  Protected *Value.Value_S = *x\f\NewFromType()
 
  CompilerIf #Value_Errors
  If Not *Value : ProcedureReturn #False : EndIf
  CompilerEndIf
 
  *Value\complex\r = *x\complex\r
  *Value\complex\i = *x\complex\i
 
  ProcedureReturn *Value
EndProcedure

Procedure.s Value_Complex_Str(*x.Value_S, nbDecimals.l)
  Protected s.s
 
  If nbDecimals = -1
    s = StrD(*x\complex\r)
    If *x\complex\i >= 0.0 : s + "+" : EndIf
    ProcedureReturn s + StrD(*x\complex\i) + "i"
  Else
    s = StrD(*x\complex\r, nbDecimals)
    If *x\complex\i >= 0.0 : s + "+" : EndIf
    ProcedureReturn s + StrD(*x\complex\i, nbDecimals) + "i"
  EndIf
EndProcedure

Procedure Value_Complex_Val(*x.Value_S, string.s)
  *x\complex\r = ValD(string)
  If FindString(string, "-", 2)
    *x\complex\i = -ValD(StringField(Mid(string, 2, Len(string)), 2, "-"))
  Else
    *x\complex\i = ValD(StringField(string, 2, "+"))
  EndIf
  ProcedureReturn *x
EndProcedure

Procedure Value_Complex_Flip(*x.Value_S, *v.Value_S)
  Protected complex.Value_Complex
 
  Select *v\VTable
    Case ?Value_VTable_Complex
      Swap *x\complex\r, *v\complex\r
      Swap *x\complex\i, *v\complex\i
    Case ?Value_VTable_Undefined
      *v\complex\r = *x\complex\r
      *v\complex\i = *x\complex\i
      Swap *x\VTable, *v\VTable
    Case ?Value_VTable_Rational
      complex\r = *x\complex\r
      complex\i = *x\complex\i
      *x\rat\a = *v\rat\a
      *x\rat\b = *v\rat\b
      *v\complex\r = complex\r
      *v\complex\i = complex\i
      Swap *x\VTable, *v\VTable
    Case ?Value_VTable_Real
      complex\r = *x\complex\r
      complex\i = *x\complex\i
      *x\real\r = *v\real\r
      *v\complex\r = complex\r
      *v\complex\i = complex\i
      Swap *x\VTable, *v\VTable
  EndSelect
 
  ProcedureReturn *x
EndProcedure

Procedure Value_Complex_Get(*x.Value_S, *v.Value_S)
  Select *v\VTable
    Case ?Value_VTable_Complex
      *v\complex\r = *x\complex\r
      *v\complex\i = *x\complex\i
    Default
      ProcedureReturn -1
  EndSelect
  ProcedureReturn *x
EndProcedure

Procedure Value_Complex_Add(*x.Value_S, *v.Value_S)
  Select *v\VTable
    Case ?Value_VTable_Complex
      *x\complex\r + *v\complex\r
      *x\complex\i + *v\complex\i
    Case ?Value_VTable_Rational
      *x\complex\r + (*v\rat\a / *v\rat\b)
    Case ?Value_VTable_Real
      *x\complex\r + *v\real\r
  EndSelect
  ProcedureReturn *x
EndProcedure

Procedure Value_Complex_Sub(*x.Value_S, *v.Value_S)
  Select *v\VTable
    Case ?Value_VTable_Complex
      *x\complex\r - *v\complex\r
      *x\complex\i - *v\complex\i
    Case ?Value_VTable_Rational
      *x\complex\r - (*v\rat\a / *v\rat\b)
    Case ?Value_VTable_Real
      *x\complex\r - *v\real\r
  EndSelect
 
  ProcedureReturn *x
EndProcedure

Procedure Value_Complex_Mul(*x.Value_S, *v.Value_S)
  Protected d.d
 
  Select *v\VTable
    Case ?Value_VTable_Complex
      d = *x\complex\r * *v\complex\r - *x\complex\i * *v\complex\i
      *x\complex\i * *v\complex\r + *x\complex\r * *v\complex\i
      *x\complex\r = d
    Case ?Value_VTable_Rational
      d = *v\rat\a / *v\rat\b
      *x\complex\r * d
      *x\complex\i * d
    Case ?Value_VTable_Real
      *x\complex\r * *v\real\r
      *x\complex\i * *v\real\r
  EndSelect
 
  ProcedureReturn *x
EndProcedure

Procedure Value_Complex_Div(*x.Value_S, *v.Value_S)
  Protected z.d, d.d
 
  Select *v\VTable
    Case ?Value_VTable_Complex
      z = 1 / (*v\complex\r * *v\complex\r + *v\complex\i * *v\complex\i)
      d = (*x\complex\r * *v\complex\r + *x\complex\i * *v\complex\i) * z
      *x\complex\i = (*x\complex\i * *v\complex\r - *x\complex\r * *v\complex\i) * z
      *x\complex\r = d
    Case ?Value_VTable_Rational
      d = *v\rat\b / *v\rat\a
      *x\complex\r * d
      *x\complex\i * d
    Case ?Value_VTable_Real
      *x\complex\r / *v\real\r
      *x\complex\i / *v\real\r
  EndSelect
 
  ProcedureReturn *x
EndProcedure

Procedure Value_Complex_Pow(*x.Value_S, *v.Value_S)
  Protected complex.Value_Complex, log.Value_Complex, prod.Value_Complex
 
  Select *v\VTable
    Case ?Value_VTable_Complex
      complex\r = *v\complex\r
      complex\i = *v\complex\i
    Case ?Value_VTable_Rational
      complex\r = *v\rat\a / *v\rat\b
      complex\i = 0.0
    Case ?Value_VTable_Real
      complex\r = *v\real\r
      complex\i = 0.0
    Default
      ProcedureReturn
  EndSelect
 
  log\r = Log(*x\complex\r * *x\complex\r + *x\complex\i * *x\complex\i) * 0.5
  log\i = ATan(*x\complex\i / *x\complex\r)
  prod\r = complex\r * log\r - complex\i * log\i
  prod\i = complex\r * log\i + complex\i * log\r
  prod\r = Exp(prod\r)
  If *x\complex\r >= 0.0
    *x\complex\r = prod\r * Cos(prod\i)
    *x\complex\i = prod\r * Sin(prod\i)
  Else
    *x\complex\r = -prod\r * Sin(prod\i)
    *x\complex\i = prod\r * Cos(prod\i)
  EndIf
 
  ProcedureReturn *x
EndProcedure

Procedure Value_Complex_Null(*x.Value_S)
  If *x\complex\r = 0.0 And *x\complex\i = 0.0
    ProcedureReturn #True
  EndIf
 
  ProcedureReturn #False
EndProcedure

Procedure Value_Complex_Neg(*x.Value_S)
  *x\complex\r * -1
  *x\complex\i * -1
  ProcedureReturn *x
EndProcedure

Procedure Value_Complex_SetNull(*x.Value_S)
  *x\complex\r = 0.0
  *x\complex\i = 0.0
  ProcedureReturn *x
EndProcedure

Procedure Value_Complex_SetOne(*x.Value_S)
  *x\complex\r = 1.0
  *x\complex\i = 0.0
  ProcedureReturn *x
EndProcedure

Procedure Value_Complex_Invert(*x.Value_S)
  Protected z.d
 
  z = 1 / (*x\complex\r * *x\complex\r + *x\complex\i * *x\complex\i)
  *x\complex\i * -z
  *x\complex\r * z
  ProcedureReturn *x
EndProcedure

Procedure Value_Complex_Convert(*x.Value_S, type.l, nbDecimals.l)
  Protected v.Value_Complex, mul.d = Pow(10, nbDecimals)
 
  If type = #Value_Complex
    ProcedureReturn *x
  EndIf
 
  v\r = *x\complex\r
  v\i = *x\complex\i
 
  Select type
    Case #Value_Rational
      *x\VTable = ?Value_VTable_Rational
      *x\rat\a = IntQ(v\r * mul)
      *x\rat\b = IntQ(mul)
      Value_ggT(*x\rat)
    Case #Value_Real
      *x\VTable = ?Value_VTable_Complex
      *x\real\r = v\r
  EndSelect
 
  ProcedureReturn *x
EndProcedure

Procedure Value_Complex_Sqr(*x.Value_S)
  Protected complex.Value_Complex, log.Value_Complex, prod.Value_Complex
 
  complex\r = 0.5
  complex\i = 0.0
 
  log\r = Log(*x\complex\r * *x\complex\r + *x\complex\i * *x\complex\i) * 0.5
  log\i = ATan(*x\complex\i / *x\complex\r)
  prod\r = complex\r * log\r - complex\i * log\i
  prod\i = complex\r * log\i + complex\i * log\r
  prod\r = Exp(prod\r)
  If *x\complex\r >= 0.0
    *x\complex\r = prod\r * Cos(prod\i)
    *x\complex\i = prod\r * Sin(prod\i)
  Else
    *x\complex\r = -prod\r * Sin(prod\i)
    *x\complex\i = prod\r * Cos(prod\i)
  EndIf
 
  ProcedureReturn *x
EndProcedure

;- Main
Procedure Value_Free(*x.Value_S)
  FreeMemory(*x)
EndProcedure

Procedure Value_Value(*x.Value_S)
  ProcedureReturn @*x\value
EndProcedure

Procedure Value_NewFromType(*x.Value_S)
  Protected *Value.Value_S, *v.Value
 
  *Value = AllocateMemory(SizeOf(Value_S))
  CompilerIf #Value_Errors
  If Not *Value : ProcedureReturn #False : EndIf
  CompilerEndIf
 
  *v = *Value
  *Value\VTable = *x\VTable
  *Value\f = *Value
  If *x\VTable <> ?Value_VTable_Undefined
    *v\SetNull()
  EndIf
 
  ProcedureReturn *Value
EndProcedure

Procedure Value_Set(*x.Value_S, *v.Value_S)
  *x\VTable = *v\VTable
  Select *v\VTable
    Case ?Value_VTable_Undefined
      ;do nothing
    Case ?Value_VTable_Rational
      *x\rat\a = *v\rat\a
      *x\rat\b = *v\rat\b
    Case ?Value_VTable_Real
      *x\real\r = *v\real\r
    Case ?Value_VTable_Complex
      *x\complex\r = *v\complex\r
      *x\complex\i = *v\complex\i
  EndSelect
  ProcedureReturn *x
EndProcedure

CompilerIf #PB_Compiler_Processor = #PB_Processor_x64
  Macro CreateVTable(type)
    DataSection
      Value_VTable_#type#:
      Data.i @Value_Free(), @Value_Value(), @Value_NewFromType()
      Data.i @Value_#type#_Copy(), @Value_#type#_Str(), @Value_#type#_Val(), @Value_#type#_Flip(), @Value_Set(), @Value_#type#_Get()
      Data.i @Value_#type#_Add(), @Value_#type#_Sub(), @Value_#type#_Mul(), @Value_#type#_Div(), @Value_#type#_Pow(), @Value_#type#_Null()
      Data.i @Value_#type#_Neg(), @Value_#type#_SetNull(), @Value_#type#_SetOne(), @Value_#type#_Invert(), @Value_#type#_Convert()
      Data.i @Value_#type#_Sqr()
    EndDataSection 
  EndMacro
  CreateVTable(Rational)
  CreateVTable(Real)
  CreateVTable(Complex)
  DataSection
    Value_VTable_Undefined:
    Data.i @Value_Free(), @Value_Value(), @Value_NewFromType()
    Data.i @Value_Undefined_Copy(), @Value_Undefined_Str(), @Value_Undefined_Val(), 0, @Value_Set(), 0
    Data.i @Value_Undefined_Add(), @Value_Undefined_Sub(), 0, 0, 0, @Value_Undefined_DoNothing()
    Data.i @Value_Undefined_DoNothing(), @Value_Undefined_DoNothing(), @Value_Undefined_DoNothing(), @Value_Undefined_DoNothing(), @Value_Undefined_DoNothing()
    Data.i 0
  EndDataSection
CompilerElse
  Macro CreateVTable(type)
    DataSection
      Value_VTable_#type#:
      Data.l @Value_Free(), @Value_Value(), @Value_NewFromType()
      Data.l @Value_#type#_Copy(), @Value_#type#_Str(), @Value_#type#_Val(), @Value_#type#_Flip(), @Value_Set(), @Value_#type#_Get()
      Data.l @Value_#type#_Add(), @Value_#type#_Sub(), @Value_#type#_Mul(), @Value_#type#_Div(), @Value_#type#_Pow(), @Value_#type#_Null()
      Data.l @Value_#type#_Neg(), @Value_#type#_SetNull(), @Value_#type#_SetOne(), @Value_#type#_Invert(), @Value_#type#_Convert()
      Data.l @Value_#type#_Sqr()
    EndDataSection 
  EndMacro
  CreateVTable(Rational)
  CreateVTable(Real)
  CreateVTable(Complex)
  DataSection
    Value_VTable_Undefined:
    Data.l @Value_Free(), @Value_Value(), @Value_NewFromType()
    Data.l @Value_Undefined_Copy(), @Value_Undefined_Str(), @Value_Undefined_Val(), 0, @Value_Set(), 0
    Data.l @Value_Undefined_Add(), @Value_Undefined_Sub(), 0, 0, 0, @Value_Undefined_DoNothing()
    Data.l @Value_Undefined_DoNothing(), @Value_Undefined_DoNothing(), @Value_Undefined_DoNothing(), @Value_Undefined_DoNothing(), @Value_Undefined_DoNothing()
    Data.l 0
  EndDataSection
CompilerEndIf

Procedure Value_New(type.l = #Value_Undefined, *Value.Value_S = 0)
  Protected *v.Value
 
 
  If Not *Value
    *Value = AllocateMemory(SizeOf(Value_S))
    If Not *Value : ProcedureReturn #False : EndIf
  EndIf
 
  *v = *Value
 
  Select type
    Case #Value_Undefined
      *Value\VTable = ?Value_VTable_Undefined
    Case #Value_Rational
      *Value\VTable = ?Value_VTable_Rational
      *v\SetNull()
    Case #Value_Real
      *Value\VTable = ?Value_VTable_Real
      *v\SetNull()
    Case #Value_Complex
      *Value\VTable = ?Value_VTable_Complex
      *v\SetNull()
  EndSelect
 
  *Value\f = *v
 
  ProcedureReturn *Value
EndProcedure
DisableExplicit
