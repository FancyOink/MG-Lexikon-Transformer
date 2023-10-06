% file: load.pl
% origin author : J. Kuhn
% origin date: Oktober 2023
% purpose: loads files

:- op(500, xfy, ::). % infix predicate for lexical items
:- op(500, fx, =). % for selection features
:- set_prolog_flag(encoding,utf8).
% Name of Lexicon to be used

%lexName('grammars/numbers'). % englische Zahlen
%lexName('grammars/ZahlenSprache'). % deutsche Zahlen (alt)
%lexName('grammars/Zahlen'). % deutsche Zahlen (neu)
%lexName('grammars/albanisch'). % albanische Zahlen
%lexName('grammars/czech'). % tschechische Zahlen
%lexName('grammars/portuguese_portugal'). % portugisiesche Zahlen
%lexName('grammars/shona'). % shona Zahlen
%lexName('grammars/calo'). % calo ZahlenSprache
lexName('grammars/georgian'). %georgische Zahlen


:- ['extermination',	% transfromation Algorithm 'Epsilon Extermination V2'
	'lexPainter'].		% writes transformed Lexicon into a new file

:- lexName(Name),[Name]. % load lexicon	