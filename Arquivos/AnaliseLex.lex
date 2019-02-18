import java_cup.runtime.Symbol;

%%
%cup
%public
%class Lexer
%line
%column
%type java_cup.runtime.Symbol


Zint = Zint
Rfloat = Rfloat
Txt = Txt
compIg = compIg
Att = Att
add = add
subt = subt
mult = mult
div = div
exp = exp
efvLoop = efvLoop
deu = deu
deuN = deuN
cf = cf
Whitespace = [ \t]
Cadeia_de_Caracteres = [\"][A-Za-z0-9]+[\"]
Id = [a-zA-Z_][a-zA-Z0-9_]*
inteiro = [0-9]+
flutuante = [0-9]+[.]?[0-9]*
NextLine = [\r]?[\n]

%%

<YYINITIAL> {
	{deu}								{ return new Symbol(Sym.deu); }
	{Txt}								{ return new Symbol(Sym.Txt); }
	{deuN}								{ return new Symbol(Sym.deuN); }
	{efvLoop}							{ return new Symbol(Sym.efvLoop);}
	{compIg}							{ return new Symbol(Sym.compIg);}
	{Att}								{ return new Symbol(Sym.Att);}
	"<"									{ return new Symbol(Sym.Maior);}
	">"									{ return new Symbol(Sym.Menor); }
	"{"									{ return new Symbol(Sym.AbreChaves);}
	"}"									{ return new Symbol(Sym.FechaChaves);}
	"["									{ return new Symbol(Sym.AbreCochetes);}
	"]"									{ return new Symbol(Sym.FechaCochetes);}
	"("									{ return new Symbol(Sym.AbreParentese);}
	")"									{ return new Symbol(Sym.FechaParentese);}
	{Cadeia_de_Caracteres}				{ return new Symbol(Sym.Cadeia_de_Caracteres);}
	{inteiro}							{ return new Symbol(Sym.inteiro);}
	{flutuante}							{ return new Symbol(Sym.flutuante);}
	{Zint}								{ return new Symbol(Sym.Zint);}
	{Rfloat}							{ return new Symbol(Sym.Rfloat);}
    {cf} 								{ return new Symbol(Sym.cf);}
	{add}								{ return new Symbol(Sym.add);}
	{subt}								{ return new Symbol(Sym.subt);}
	{mult}								{ return new Symbol(Sym.mult);}
	{div}								{ return new Symbol(Sym.div);}
	{exp}								{ return new Symbol(Sym.exp);}
	{Id} 			    				{ return new Symbol(Sym.Id);}
	{Whitespace}	    				{ }
    {NextLine}         					{ }
	[^]                            { throw new RuntimeException("Illegal character \""+yytext()+
                                                              "\" at line "+yyline+", column "+yycolumn); }
}
	



<<EOF>> { return new Symbol(Sym.EOF); }

 