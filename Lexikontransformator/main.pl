% file: main.pl
% origin author : J. Kuhn
% origin date: Oktober 2023
% purpose: top executable for MG lexikon transformer

:-['load'].


mainDebug.	% comment this line, if debugMode should be off
mainDebug :- false.



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% exterminate(-([Eta-Li],[Epsilon-Li]))
%
% transforms the lexicon and removes epsilon-LI
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lexTransform() :-	
	exterminate((Li,Eps)),
	(mainDebug -> write("Eta-Li: "),writeln(Li),length(Li,LLi),write("Eps-Li: "),writeln(Eps),length(Eps,LEps),write("#Eta-Li: "),write(LLi),write(" Eps-Li: "),writeln(LEps);true),
	append(Li,Eps,InLI),
	lexPainter(InLI),
	(mainDebug -> write("Finished transforming");true).
	

