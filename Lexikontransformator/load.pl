% file: load.pl
% origin author : J. Kuhn
% origin date: Oktober 2023
% purpose: loads files

:- op(500, xfy, ::). % infix predicate for lexical items
:- op(500, fx, =). % for selection features

%lexName('grammars/numbers'). % Name of Lexicon to be used
lexName('grammars/ZahlenSprache').

:- ['extermination',	% transfromation Algorithm 'Epsilon Extermination V2'
	'lexPainter'].		% writes transformed Lexicon into a new file

:- lexName(Name),[Name]. % load lexicon	