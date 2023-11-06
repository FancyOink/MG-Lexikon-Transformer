# MG-Lexikon-Transformer
Transforms MG-lexokons. Currently only removes epsilon-LI as much as possible.
The grammars folder contains lexicons for numerical grammars in 261 languages and dialects taken from https://github.com/ikmMaierBTUCS/Numeral-Decomposer-1.1.git
The grammars_old folder contains older versions of the numeral grammars and the transformed.

To transform a grammar in the grammar folder uncomment the respective lexName('grammars/...') in load.pl and execute the main.pl. Inside the console execute the lexTransform()-function.
