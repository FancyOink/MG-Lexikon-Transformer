:- module(lexPainter, [lexPainter/1]).
% file: painter.pl
% origin author : J. Kuhn
% origin date: Oktober 2023
% purpose: writes a Lexicon into a .pl-file

%paintDebug.		% comment this line, if debugMode should be off
paintDebug :- false.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% lexPainter(+[Li],+Startcategory(C))
%
% top function of the modul
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lexPainter(LIs) :-
	lexName(Name),
	atom_concat(Name,'_trans.pl',NewLexName),
	open(NewLexName, write, Stream),
	writeBegin(Stream,Stream2),
	writeLex(Stream2,LIs,Stream3),
	writeEnd(Stream3).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% writeBegin(+Stream,-Stream)
%
% writes the start of the new Lexicon
% including the startCategory (copied from the source lexicon)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
writeBegin(Stream,Stream) :-
	startCategory(C),
	format(Stream, "startCategory(~w(_)).~n",[C]).
	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% writeEnd(+Stream)
%
% writes the end of the new Lexicon
% currently only closes the stream
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
writeEnd(Stream) :-
		close(Stream).
		
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% writeLex(+Stream,+[LI],-Stream)
%
% writes LI into the new Lexicon
% also Filters out marked Epsilon-Li
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%		
writeLex(Stream,[],Stream) :- paintDebug -> writeln("finished list");true.
writeLex(Stream,[epsLi(_,dot)|LIs],Stream) :-
	(paintDebug -> writeln("Found marked Epsilon-LI.");true),
	writeLex(Stream,LIs,Stream).
writeLex(StreamIn,[epsLi(Fs,clean)|LIs],StreamOut) :-
	(paintDebug ->writeln("Found clean Epsilon-LI.") ;true),
	format(StreamIn,"[] :: ~w.~n",[Fs]),
	writeLex(StreamIn,LIs,StreamOut).
writeLex(StreamIn,[li(Exp,Fs,_)|LIs],StreamOut) :-
	(paintDebug ->write("Copy LI:"), write(Exp),write(" :: "),writeln(Fs) ;true),
	format(StreamIn,"~w :: ~w.~n",[Exp,Fs]),
	writeLex(StreamIn,LIs,StreamOut).
writeLex(Stream,LIs,Stream):- paintDebug -> write("Something went wrong!\nThe List is: "),writeln(LIs);true.
	