" VIM Syntax file for tintin++ scripts
" TODO
" Make #script more robust
" Add proper support for #chat
" Add proper support for #map
" Finish support for #buffer get
" Make Better use of Clusters
" More Robust #script support
" Test vs various code styles
" Add bad syntax highlights to ttError

if version < 600
	syntax clear
elseif exists("b:current_syntax")
	finish
endif

" Sets the '#' character as a valid keyword character
setlocal iskeyword+=#
" tintin++ keywords are case insensitive
syntax case ignore
" tintin++ Commands {{{
" Kill: #kill #killall {{{
syntax keyword ttCmd #kill
			\ nextgroup=ttListNameKill
			\ skipwhite skipempty

syntax keyword ttCmd #killall
			\ nextgroup=ttListName
			\ skipwhite skipempty
" }}}
" Debugging: #ignore #debug #message {{{
syntax keyword ttCmdDebug #ignore #debug #message
			\ nextgroup=ttListName,ttListNameBlock
			\ skipwhite skipempty
" }}}
" Useless For Scripting: #grep #help #greeting #info {{{
syntax keyword ttCmdUseless #grep #help #greeting #info
" }}}
" Misc tintin commands: #cr #bell #send #split #system #config #pathdir {{{
syntax keyword ttCmd #cr #bell

syntax keyword ttCmd #send
			\ nextgroup=ttValueBlock
			\ skipwhite skipempty

syntax keyword ttCmd #split
			\ nextgroup=ttSplitValueBlock
			\ skipwhite skipempty

syntax keyword ttCmd #system
			\ nextgroup=ttShellCmd
			\ skipwhite skipempty

syntax keyword ttCmd #config
			\ nextgroup=ttConfigBlock
			\ skipwhite skipempty

syntax keyword ttCmd #pathdir
" }}}
" End/Suspend: #end #suspend #zap {{{
syntax keyword ttCmd #end #suspend

syntax keyword ttCmd #zap
			\ nextgroup=ttSessionName
			\ skipwhite skipempty
" }}}
" Session Related: #all #gts #snoop #session #run {{{
syntax keyword ttCmd #all #gts
syntax match   ttCmd "\c#{gts}"

syntax keyword ttCmd #snoop
			\ nextgroup=ttSessionName
			\ skipwhite skipempty

syntax keyword ttCmd #ses[sion]
			\ nextgroup=ttSessionNameBlock,ttSessionName
			\ skipwhite skipempty

syntax keyword ttCmd #run
			\ nextgroup=ttRunSessionNameBlock,ttRunSessionName
			\ skipwhite skipempty
" }}}
" Looping Commands #while #loop #forall #foreach #parse #break #continue {{{
syntax keyword ttCmdLoop #break #continue

syntax keyword ttCmdLoop #while
			\ nextgroup=ttExpressionBlock
			\ skipwhite skipempty

syntax keyword ttCmdLoop #forall
			\ nextgroup=ttForAllBlock
			\ skipwhite skipempty

syntax keyword ttCmdLoop #foreach
			\ nextgroup=ttForEachBlock
			\ skipwhite skipempty

syntax keyword ttCmdLoop #loop
			\ nextgroup=ttLoopLowerBlock
			\ skipwhite skipempty

syntax keyword ttCmdLoop #parse
			\ nextgroup=ttParseValueBlock
			\ skipwhite skipempty
" }}}
" Triggers On Game Output #act #high #sub #event {{{
syntax keyword ttCmdTrigger #act[ion] #gag
			\ nextgroup=ttPatternBlock
			\ skipwhite skipempty

syntax keyword ttCmdTrigger #high[light]
			\ nextgroup=ttPatternBlockHigh
			\ skipwhite skipempty

syntax keyword ttCmdTrigger #sub[stitute] #prompt
			\ nextgroup=ttPatternBlockSub
			\ skipwhite skipempty

syntax keyword ttCmdTrigger #event
			\ nextgroup=ttEventBlock
			\ skipwhite skipempty
" }}}
" Input Related: #alias #tab #macro #history #cursor #buffer {{{
syntax keyword ttCmdInput #alias
			\ nextgroup=ttPatternBlock
			\ skipwhite skipempty

syntax keyword ttCmdInput #tab
			\ nextgroup=ttValueBlock
			\ skipwhite skipempty

syntax keyword ttCmdInput #macro
			\ nextgroup=ttKeyBlock
			\ skipwhite skipempty

syntax keyword ttCmdInput #hist[ory]
			\ nextgroup=ttHistSub1,ttHistSub2,ttHistSub3
			\ skipwhite skipempty

syntax keyword ttCmdInput #cursor
			\ nextgroup=ttCursorBlock
			\ skipwhite skipempty

syntax keyword ttCmdInput #buffer
			\ nextgroup=ttBufferSub1,ttBufferSub2,ttBufferSub3
			\ skipwhite skipempty
" }}}
" Switch/Case: #switch #case #default {{{
syntax keyword ttCmdSwitch #switch #case
			\ nextgroup=ttExpressionBlock
			\ skipwhite skipempty

syntax keyword ttCmdSwitch #default
"}}}
" If/ElseIf/Else Branching: #if #elseif #else {{{
syntax keyword ttCmdBranch #if #elseif
			\ nextgroup=ttExpressionBlock
			\ skipwhite skipempty

syntax keyword ttCmdBranch #else
" }}}
" File Related: #read #write #scan #textin {{{
syntax keyword ttCmd #read #write #scan #textin
			\ nextgroup=ttFileNameBlock,ttFileName
			\ skipwhite skipempty
" }}}
" Variable Assignment: #var #format #math #regex #repalce #list {{{
syntax keyword ttCmdVar #var[iable]
			\ nextgroup=ttVarVarBlock,ttVarVar
			\ skipwhite skipempty

syntax keyword ttCmdVar #format
			\ nextgroup=ttFormatVarBlock,ttFormatVar
			\ skipwhite skipempty

syntax keyword ttCmdVar #math
			\ nextgroup=ttMathVarBlock,ttMathVar
			\ skipwhite skipempty

syntax keyword ttCmdVar #regex
			\ nextgroup=ttRegexVarBlock,ttRegexVar
			\ skipwhite skipempty

syntax keyword ttCmdVar #replace
			\ nextgroup=ttReplaceVarBlock,ttReplaceVar
			\ skipwhite skipempty

syntax keyword ttCmdVar #list
			\ nextgroup=ttListVarBlock,ttListVar
			\ skipwhite skipempty
" }}}
" Functions: #function #return {{{
syntax keyword ttCmd #func[tion]
			\ nextgroup=ttFunctionNameBlock
			\ skipwhite skipempty

syntax keyword ttCmd #return
			\ nextgroup=ttValueBlock
			\ skipwhite skipempty	
" }}}
" Time Realted: #tick #delay {{{
syntax keyword ttCmdTime #tick[er] #delay
			\ nextgroup=ttTimeNameBlock
			\ skipwhite skipempty	
" }}}
" Class: #class {{{ 
syntax keyword ttCmd #class
			\ nextgroup=ttClassNameBlock,ttClassName
			\ skipwhite skipempty
" }}}
" Local Echos: #echo #showme {{{
syntax keyword ttCmd #showme
			\ nextgroup=ttValueBlock
			\ skipwhite skipempty

syntax keyword ttCmd #echo
			\ nextgroup=ttEchoBlock
			\ skipwhite skipempty
" }}}
" Path: #path {{{ 
syntax keyword ttCmd #path
			\ nextgroup=ttPathSub1,ttPathSub2,ttPathSub3
			\ skipwhite skipempty
" }}}
" Log: #log {{{ 
syntax keyword ttCmd #log
			\ nextgroup=ttLogSub
			\ skipwhite skipempty
" }}}
" Line: #line {{{ 
syntax keyword ttCmd #line
			\ nextgroup=ttLineSub1,ttLineSub2,ttLineSub3,ttLineSub4
			\ skipwhite skipempty
" }}}
" UnCommands: #un* {{{
syntax keyword ttCmdUn #unvar[iable] #untick[er] #undelay #unact[ion] #unevent #unfunc[tion]
			\ #unhigh[light] #unmacro #unprompt #unsub[sisitue] #untab #ungag #unalias
			\ nextgroup=ttUnBlock,ttUn
			\ skipwhite

" }}}
" Repeat Command: #{number} {{{
syntax match ttCmdRep "#\d\+"
syntax match ttCmdRep "#{\d\+}"
" }}}
" #script is handled in a special way {{{
syntax region ttCmdScriptBlock start=/#script\>/ skip=/}\_s\+{\|$/ end=/}$\|};$/
			\ contains=ttCmdScript,ttShellCmd,ttScriptVarName,ttCmdSep
			\ keepend

syntax keyword ttCmdScript #script
			\ contained

" }}}

syntax keyword ttCmd #map
syntax keyword ttCmd #chat
" }}}
syntax case match

" Cluster ttCmd* into ttCmds {{{
syntax cluster ttCmds contains=
			\ ttCmd,
			\ ttCmdBranch,
			\ ttCmdDebug,
			\ ttCmdInput,
			\ ttCmdLoop,
			\ ttCmdRep,
			\ ttCmdSwitch,
			\ ttCmdTime,
			\ ttCmdTrigger,
			\ ttCmdUseless,
			\ ttCmdVar,
			\ ttCmdUn,
			\ ttCmdScript,
" }}}

" Blocks {{{
" General Blocks:
" Pattern Match Blocks {{{
syntax region ttPatternBlock
			\ matchgroup=ttBracesMatch start=/{/ end=/}/
			\ contained
	
syntax region ttPatternBlockHigh
			\ matchgroup=ttBracesMatch start=/{/ end=/}/
			\ contained skipwhite skipempty
			\ nextgroup=ttHighColorBlock

syntax region ttPatternBlockSub
			\ matchgroup=ttBracesMatch start=/{/ end=/}/
			\ contained skipwhite skipempty
			\ nextgroup=ttFormatBlock
" }}}
" Format Block {{{
syntax region ttFormatBlock
			\ matchgroup=ttBracesFormat start=/{/ end=/}/
			\ contained

syntax region ttReplaceFormatBlock
			\ matchgroup=ttBracesFormat start=/{/ end=/}/
			\ contained
" }}}
" Value Blocks {{{
syntax region ttValueBlock
			\ matchgroup=ttBracesValue start=/{/ end=/}/
			\ contained
			\ contains=ttValueBlock

syntax region ttSplitValueBlock
			\ matchgroup=ttBracesValue start=/{/ end=/}/
			\ contained skipwhite skipempty
			\ nextgroup=ttValueBlock

syntax region ttParseValueBlock
			\ matchgroup=ttBracesValue start=/{/ end=/}/
			\ contained skipwhite skipempty
			\ nextgroup=ttLoopVarBlock

" }}}
" Expression Block {{{
syntax region ttExpressionBlock
			\ matchgroup=ttBracesExpression start=/{/ end=/}/
			\ contained
" }}}
" File Name Block {{{
syntax region ttFileNameBlock
			\ matchgroup=ttBraces start=/{/ end=/}/
			\ contained

syntax region ttFileName
			\ start=/\w/ skip=/\\\s/ end=/\( \|$\)/
			\ contained
			\ contains=ttCmdSep
" }}}
" Key Block {{{
syntax region ttKeyBlock
			\ matchgroup=ttBraces start=/{/ end=/}/
			\ contained
" }}}
" Shell Command Block {{{
syntax region ttShellCmd
			\ matchgroup=ttBraces start=/{/ end=/}/
			\ contained
			\ contains=ttShellCmd
" }}}
" Blocks For Specefic Commands:
" ListName Blocks {{{
syntax match ttListName "\c\%[{]\(act\%[ions]\|alias\%[es]\|class\%[es]\|config\%[urations]\|delay\%[s]\|event\%[s]\|func\%[tions]\|gag\[%s]\|high\%[lights]\|hist\%[ories]\|macro\%[s]\|path\%[s]\|pathdirs\|prompt\%[s]\|sub\%[stitutions]\|tab\%[s]\|tabcycle\|ticker\%[s]\|var\%[iables]\)\%[}]"
			\ contained
			\ contains=ttSubBrace

syntax match ttListNameKill "\c\%[{]\(act\%[ions]\|alias\%[es]\|class\%[es]\|config\%[urations]\|delay\%[s]\|event\%[s]\|func\%[tions]\|gag\[%s]\|high\%[lights]\|hist\%[ories]\|macro\%[s]\|path\%[s]\|pathdirs\|prompt\%[s]\|sub\%[stitutions]\|tab\%[s]\|tabcycle\|ticker\%[s]\|var\%[iables]\)\%[}]"
			\ contains=ttSubBrace
			\ contained
			\ skipwhite skipempty
			\ nextgroup=ttPatternBlock
" }}}
" ForAll/ForEach LoopLower/LoopUpper {{{
syntax region ttForAllBlock
			\ matchgroup=ttBraces start=/{/ end=/}/
			\ contained
			\ contains=ttValueBlock

syntax region ttForEachBlock
			\ matchgroup=ttBraces start=/{/ end=/}/
			\ contained
			\ contains=ttValueBlock
			\ skipwhite skipempty
			\ nextgroup=ttLoopVarBlock

syntax region ttLoopVarBlock
			\ matchgroup=ttBraces start=/{/ end=/}/
			\ contained

syntax region ttLoopLowerBlock
			\ matchgroup=ttBraces start=/{/ end=/}/
			\ contained
			\ skipwhite skipempty
			\ nextgroup=ttLoopUpperBlock

syntax region ttLoopUpperBlock
			\ matchgroup=ttBraces start=/{/ end=/}/
			\ contained
			\ skipwhite skipempty
			\ nextgroup=ttLoopVarBlock
" }}}
" Highlight Color Block {{{
syntax region ttHighColorBlock
			\ matchgroup=ttBraces start=/{/ end=/}/
			\ contained
" }}}
" Functions Name Block {{{
syntax region ttFunctionNameBlock
			\ matchgroup=ttBraces start=/{/ end=/}/
			\ contained
" }}}
" Variable Name Block {{{
syntax region ttVarVarBlock
			\ matchgroup=ttBraces start=/{/ end=/}/
			\ contained
			\ contains=ttVarIndex
			\ skipwhite
			\ nextgroup=ttValueBlock

syntax match ttVarVar "[\[\]0-9A-Za-z_]\+"
			\ contained
			\ contains=ttVarIndex
			\ skipwhite
			\ nextgroup=ttValueBlock

syntax region ttFormatVarBlock
			\ matchgroup=ttBraces start=/{/ end=/}/
			\ contained
			\ contains=ttVarIndex
			\ skipwhite skipempty
			\ nextgroup=ttFormatBlock

syntax match ttFormatVar "[\[\]0-9A-Za-z_]\+"
			\ contained
			\ contains=ttVarIndex
			\ skipwhite
			\ nextgroup=ttFormatBlock

syntax region ttMathVarBlock
			\ matchgroup=ttBraces start=/{/ end=/}/
			\ contained
			\ contains=ttVarIndex
			\ skipwhite skipempty
			\ nextgroup=ttExpressionBlock

syntax match ttMathVar "[\[\]0-9A-Za-z_]\+"
			\ contained
			\ contains=ttVarIndex
			\ skipwhite
			\ nextgroup=ttExpressionBlock

syntax region ttRegexVarBlock
			\ matchgroup=ttBraces start=/{/ end=/}/
			\ contained
			\ contains=ttVarIndex
			\ skipwhite skipempty
			\ nextgroup=ttPatternBlock

syntax match ttMRegexVar "[\[\]0-9A-Za-z_]\+"
			\ contained
			\ contains=ttVarIndex
			\ skipwhite
			\ nextgroup=ttFormatBlock

syntax region ttReplaceVarBlock
			\ matchgroup=ttBraces start=/{/ end=/}/
			\ contained
			\ contains=ttVarIndex
			\ skipwhite skipempty
			\ nextgroup=ttReplaceFormatBlock

syntax match ttReplaceVar "[\[\]0-9A-Za-z_]\+"
			\ contained
			\ contains=ttVarIndex
			\ skipwhite
			\ nextgroup=ttReplaceFormatBlock

syntax region ttListVarBlock
			\ matchgroup=ttBraces start=/{/ end=/}/
			\ contained
			\ contains=ttVarIndex
			\ skipwhite skipempty
			\ nextgroup=ttListSub

syntax match ttListVar "[\[\]0-9A-Za-z_]\+"
			\ contained
			\ contains=ttVarIndex
			\ skipwhite
			\ nextgroup=ttListSub

syntax region ttPathVarBlock
			\ matchgroup=ttBraces start=/{/ end=/}/
			\ contained
			\ contains=ttVarIndex
			\ skipwhite skipempty
			\ nextgroup=ttListSub

syntax match ttPathVar "[\[\]0-9A-Za-z_]\+"
			\ contained
			\ contains=ttVarIndex
			\ skipwhite
			\ nextgroup=ttListSub
" }}}
" Ticker/Delay Name {{{
syntax region ttTimeNameBlock
			\ matchgroup=ttBraces start=/{/ end=/}/
			\ contained
" }}}
" Class Blocks {{{
syntax region ttClassNameBlock
			\ matchgroup=ttBraces start=/{/ end=/}/
			\ contained
			\ skipwhite
			\ nextgroup=ttClassSub1,ttClassSub2

syntax match ttClassName "\<\S\+\>"
			\ contained
			\ skipwhite
			\ nextgroup=ttClassSub1,ttClassSub2

syntax match ttClassSub1 "\%[{]\(open\|close\|kill\)\%[}]"
			\ contained
			\ contains=ttSubBrace

syntax match ttClassSub2 "\%[{]\(read\|write\)\%[}]"
			\ contained
			\ contains=ttSubBrace
			\ skipwhite
			\ nextgroup=ttFileNameBlock,ttFileName
" }}}
" List Block {{{ 
syntax match ttListSub "\%[{]\(add\|cl\%[ear]\|create\|del\%[ete]\|ins\%[ert]\|get\|set\|size\|sort\)\%[}]"
			\ contained
			\ contains=ttSubBrace
" }}}
" Path Block {{{ 
syntax match ttPathSub1 "\%[{]\(end\|del\|new\|run\|show\|walk\|zip\|unzip\)\%[}]"
			\ contained
			\ contains=ttSubBrace

syntax match ttPathSub2 "\%[{]\(load\|save\)\%[}]"
			\ contained
			\ contains=ttSubBrace
			\ skipwhite
			\ nextgroup=ttPathVarBlock,ttPathVar

syntax match ttPathSub3 "\%[{]\(ins\%[ert]\)\%[}]"
			\ contained
			\ contains=ttSubBrace
			\ skipwhite
			\ nextgroup=ttValueBlock
" }}}
" Log Block {{{ 
syntax match ttLogSub "\%[{]\(a\%[ppend]\|ov\%[erwrite]\|of\%[f]\)\%[}]"
			\ contained
			\ contains=ttSubBrace
			\ skipwhite
			\ nextgroup=ttFileNameBlock,ttFileName
" }}}
" Buffer Block {{{ 
syntax match ttBufferSub1 "\%[{]\(clear\|down\|end\|find\|home\|info\|lock\|up\)\%[}]"
			\ contained
			\ contains=ttSubBrace

syntax match ttBufferSub2 "\%[{]write\%[}]"
			\ contained
			\ contains=ttSubBrace
			\ skipwhite
			\ nextgroup=ttFileNameBlock,ttFileName

syntax match ttBufferSub3 "\%[{]get\%[}]"
			\ contained
			\ contains=ttSubBrace
			\ skipwhite
" }}}
" Event Name {{{
syntax region ttEventBlock
			\ matchgroup=ttBraces start=/{/ end=/}/
			\ contained
" }}}
" Cursor Option {{{
syntax region ttCursorBlock
			\ matchgroup=ttBraces start=/{/ end=/}/
			\ contained
			\ skipwhite skipempty
			\ nextgroup=ttKeyBlock
" }}}
"Session/Run Name Blocks {{{
syntax region ttSessionNameBlock
			\ matchgroup=ttBraces start=/{/ end=/}/
			\ contained
			\ skipwhite
			\ nextgroup=ttSessionURIBlock,ttSessionURI

syntax match ttSessionName "\<\S\+\>"
			\ contained
			\ skipwhite
			\ nextgroup=ttSessionURIBlock,ttSessionURI

syntax region ttRunSessionNameBlock
			\ matchgroup=ttBraces start=/{/ end=/}/
			\ contained
			\ skipwhite
			\ nextgroup=ttShellCmd

syntax match ttRunSessionName "\<\S\+\>"
			\ contained
			\ skipwhite
			\ nextgroup=ttShellCmd

syntax region ttSessionURIBlock
			\ matchgroup=ttBraces start=/{/ end=/}/
			\ contained
			\ skipwhite
			\ nextgroup=ttSessionPortBlock,ttSessionPort

syntax match ttSessionURI "\<\S\+\>"
			\ contained
			\ skipwhite
			\ nextgroup=ttSessionPortBlock,ttSessionPort

syntax region ttSessionPortBlock
			\ matchgroup=ttBraces start=/{/ end=/}/
			\ contained

syntax match ttSessionPort "\<\S\+\>"
			\ contained
" }}}
" History Block {{{ 
syntax match ttHistSub1 "\%[{]\(delete\|list\)\%[}]"
			\ contained
			\ contains=ttSubBrace

syntax match ttHistSub2 "\%[{]insert\%[}]"
			\ contained
			\ contains=ttSubBrace
			\ skipwhite
			\ nextgroup=ttValueBlock

syntax match ttHistSub3 "\%[{]\(write\|read\)\%[}]"
			\ contained
			\ contains=ttSubBrace
			\ skipwhite
			\ nextgroup=ttFileNameBlock,ttFileName
" }}}
" Echo Block {{{ 
syntax region ttEchoBlock
			\ matchgroup=ttBraces start=/{/ end=/}/
			\ contained
			\ contains=ttFormatBlock,ttEchoNumberBlock

syntax match ttEchoNumberBlock "{\d\+}"
			\ contained
			\ contains=ttCodeBlock
" }}}
" RegEx Matching Block {{{
syntax region ttRegExBlock
			\ matchgroup=ttRegExBraces start=/{/ end=/}/
			\ contained
			\ contains=ttRegExBlock
			\ containedin=ttPatternBlock,ttPatternBlockSub,ttPatternBlockHigh
" }}}
" String Block {{{
syntax region ttString
			\ matchgroup=ttBraces start=/"/ skip=/\\"/ end=/"/
			\ contained
			\ contains=ttRegExBlock
			\ containedin=ttExpressionBlock
" }}}
" Config Block {{{
syntax region ttConfigBlock
			\ matchgroup=ttBraces start=/{/ end=/}/
			\ contained
" }}}
" Script Block: {{{
syntax match ttScriptVarName /\S\+\_s*{/
			\ contained
			\ keepend
			\ contains=ttScriptVarNameVar,ttSubBrace
			\ skipempty skipwhite
			\ nextgroup=ttScriptShell

syntax match ttScriptVarNameVar /[A-Za-z_0-9]\+/
			\ contained

syntax region ttScriptShell start=// skip=/$/ end=/}$\|};$/
			\ contained
			\ contains=ttSubBrace,ttShellCmd
" }}}
" Line Block {{{ 
syntax match ttLineSub1 "\%[{]\(gag\)\%[}]"
			\ contained
			\ contains=ttSubBrace

syntax match ttLineSub2 "\%[{]\(strip\|ignore\|verbose\)\%[}]"
			\ contained
			\ contains=ttSubBrace

syntax match ttLineSub3 "\%[{]\(sub\%[titute]\)\%[}]"
			\ contained
			\ contains=ttSubBrace
			\ skipwhite
			\ nextgroup=ttLineSubSub

syntax match ttLineSub4 "\%[{]\(log\%[verbatim]\)\%[}]"
			\ contained
			\ contains=ttSubBrace
			\ skipwhite
			\ nextgroup=ttFileNameBlock,ttFileName

syntax match ttLineSubSub "\%[{]\(var\%[iables]\|functions\|colors\|escapes\|secure\|eol\|lnf\)\%[}]"
			\ contained
			\ contains=ttSubBrace
" }}}
" Un* Block {{{
syntax region ttUnBlock
			\ matchgroup=ttBraces start=/{/ end=/}/
			\ contained

syntax match ttUn "[^;{} ]\+"
			\ contained
" }}}
" Generic Block:
" Falls Back To Generic Code Block {{{
syntax region ttCodeBlock
			\ matchgroup=ttBraces start=/{/ end=/}/
			\ contains=ttCodeBlock,ttCmdSep,@ttCmds,ttNopComment
" }}}

" Error Block: {{{
syntax region ttErrorBlock
			\ start=/\S\+/ end=/$\|;/
			\ keepend
			\ contains=ttCmdSep
			\ contained
" }}}
" }}}

" Syntax Elements {{{
" Optional SubCommand Braces {{{
syntax match ttSubBrace "{\|}"
			\ contained
" }}}
" Command Terminator {{{
syntax match ttCmdSep /;/
			\ containedin=ttCodeBlock,ttFuncBlock,ttForAllBlock,ttForEachBlock
" }}}
" Numbers {{{
syntax match ttInt "\d\+"
			\ containedin=ttCodeBlock,ttValueBlock,ttTimeNameBlock,ttExpressionBlock,ttVarIndex,ttLoopLowerBlock,ttLoopUpperBlock,ttFuncBlock,ttSessionPort,ttSessionPortBlock
syntax match ttFloat "\d\+.\d\+"
			\ containedin=ttCodeBlock,ttValueBlock,ttTimeNameBlock,ttExpressionBlock,ttVarIndex,ttLoopLowerBlock,ttLoopUpperBlock,ttFuncBlock,ttSessionPort,ttSessionPortBlock
" }}}
" Lazy Match Patterns {{{
syntax match ttMatchLazy "%[wWdDsS?.+*]"
			\ contained
			\ containedin=ttPatternBlock,ttPatternBlockHigh,ttPatternBlockSub,ttUn,ttUnBlock,ttReplaceFormatBlock,ttString
" }}}
" Match Special Regex Chars {{{
syntax match ttMatchSpecial "\^\|\~\|\$" 
			\ contained
			\ containedin=ttPatternBlock,ttPatternBlockHigh,ttPatternBlockSub,ttReplaceFormatBlock
" }}}
" Format specifiers {{{
syntax match ttFormat "%\%[.+-][0-9]\{-}[acdghlmnprstuwACLRTU]"
			\ contained
			\ containedin=ttFormatBlock,ttEchoBlock
" }}}
" RexEx {{{
syntax match ttRegEx "\(\.\|+\|?\|*\||\)" 
			\ contained
			\ containedin=ttRegExBlock
syntax match ttRegExBraces "\()\|(\|\]\|\[\)"
			\ contained
			\ containedin=ttRegExBlock
" }}}
" Math and Bitwise Operators {{{
syntax match ttOperators "\(<<\|>>\|==\|!=\|^^\|||\|&&\|[-+*%&/^|<>!=]\)"
			\ contained
			\ containedin=ttExpressionBlock
syntax match ttOperatorsParen "[)(]"
			\ contained
			\ containedin=ttExpressionBlock
" }}}
" Color codes {{{
syntax match ttColor "<\d\d\d>"
			\ containedin=ttFormatBlock,ttValueBlock,ttEchoBlock
syntax match ttColor "<[a-fA-F][a-fA-F][a-fA-F]>"
			\ containedin=ttFormatBlock,ttValueBlock,ttEchoBlock
syntax match ttColor "<[gG]\d\{2}>"
			\ containedin=ttFormatBlock,ttValueBlock,ttEchoBlock
" }}}
" Dynamic Variables {{{
syntax match ttArgRef "%\d\{1,2}"
			\ containedin=ALLBUT,ttComment,ttNopComment

syntax match ttRegExRef "&\d\{1,2}"
			\ containedin=ALLBUT,ttComment,ttNopComment
" }}}
" Character Escapes {{{ 
syntax match ttEsc "\\[0abcenrt\\]"
			\ containedin=ALLBUT,ttComment,ttNopComment
syntax match ttEsc "\\x\x\{2}"
			\ containedin=ALLBUT,ttComment,ttNopComment
syntax match ttEsc "\\\d\d\d"
			\ containedin=ALLBUT,ttComment,ttNopComment
" }}}
" ANSI Escape/Control Codes {{{
syntax match ttAnsiEsc /\\e\[[0-9;\\]\{-}m/
			\ containedin=ALLBUT,ttComment,ttNopComment
" }}}
" tintin Variables {{{
syntax match ttVar "\$\%[{][a-zA-Z_]\+"
			\ nextgroup=ttVarIndex
			\ containedin=ALLBUT,ttComment,ttNopComment

syntax match ttVar "&\%[{][a-zA-Z_]\+" 
			\ nextgroup=ttVarIndex
			\ containedin=ALLBUT,ttComment,ttNopComment
" }}}
" Variable Blocks {{{
syntax region ttVarBlock
			\ matchgroup=ttVarBraces start=/${/ end=/}/ 
			\ contains=ttVarIndex
			\ containedin=ALLBUT,ttComment,ttNopComment

syntax region ttVarBlock 
			\ matchgroup=ttVarBraces start=/&{/ end=/}/
			\ contains=ttVarIndex
			\ containedin=ALLBUT,ttComment,ttNopComment
" }}}
" Variable Index {{{
syntax region ttVarIndex
			\ matchgroup=ttVarIndexBracket start=/\[/ end=/\]/ 
			\ contained
			\ containedin=ttVarBlock
			\ nextgroup=ttVarIndex
" }}}
" @function calls and the obligatory braces around the arguments {{{
syntax region ttFuncBlock 
			\ matchgroup=ttBracesFunction start=/{/ skip=/$/ end=/}/
			\ contains=ttCodeBlock
			\ contained

syntax match ttFunction "@[A-Za-z_0-9]\+" 
			\ containedin=ALLBUT,ttComment,ttNopComment
			\ nextgroup=ttFuncBlock
" }}}
" }}}

" Comments {{{
" #nop comments
syntax region ttNopComment
			\ matchgroup=ttNop start="#nop" end=/\;\|$/

" C-style multi-line comments
syntax region ttComment start="/\*" end="\*/"

syntax region ttCommentError start="/\*" end="\*/"
			\ contained
			\ containedin=ttCodeBlock

" Special notes in Comments
syntax keyword ttTodo TODO FIXME XXX BUG DEBUG
			\ contained
			\ containedin=ttComment,ttNopComment
" }}}

" Internal Highlink Linking {{{

" Link ttCmd* to ttCmd Group {{{
hi link ttCmdBranch               ttCmd
hi link ttCmdDebug                ttCmd
hi link ttCmdInput                ttCmd
hi link ttCmdLoop                 ttCmd
hi link ttCmdRep                  ttCmd
hi link ttCmdSwitch               ttCmd
hi link ttCmdTime                 ttCmd
hi link ttCmdTrigger              ttCmd
hi link ttCmdUseless              ttCmd
hi link ttCmdVar                  ttCmd
hi link ttCmdUn                   ttCmd
hi link ttCmdScript               ttCmd
"}}}

" Link Syntax Elements {{{
hi link ttMatchLazy               ttMacro
hi link ttMatchSpecial            ttMacro
hi link ttFormat                  ttMacro
hi link ttRegEx                   ttMacro
hi link ttRegExBraces             ttMacro
hi link ttColor                   ttMacro
hi link ttEsc                     ttMacro
hi link ttAnsiEsc                 ttMacro

hi link ttArgRef                  ttReference
hi link ttRegExRef                ttReference
" }}}

" tintin Lists and Sub commands are keywords {{{
hi link ttListNameKill            ttKeyword
hi link ttListName                ttKeyword
hi link ttConfigBlock             ttKeyword
hi link ttListSub                 ttKeyword
hi link ttPathSub1                ttKeyword
hi link ttPathSub2                ttKeyword
hi link ttPathSub3                ttKeyword
hi link ttLogSub                  ttKeyword
hi link ttClassSub1               ttKeyword
hi link ttClassSub2               ttKeyword
hi link ttHistSub1                ttKeyword
hi link ttHistSub2                ttKeyword
hi link ttHistSub3                ttKeyword
hi link ttEventBlock              ttKeyword
hi link ttCursorBlock             ttKeyword
hi link ttBufferSub1              ttKeyword
hi link ttBufferSub2              ttKeyword
hi link ttBufferSub3              ttKeyword
hi link ttLineSub1                ttKeyword
hi link ttLineSub2                ttKeyword
hi link ttLineSub3                ttKeyword
hi link ttLineSub4                ttKeyword
hi link ttLineSubSub              ttKeyword
" }}}

hi link ttSessionURIBlock         ttSessionURI
hi link ttSessionURI              ttString

" Link all Braces together {{{
hi link ttBracesMatch             ttBraces
hi link ttBracesFormat            ttBraces
hi link ttBracesValue             ttBraces
hi link ttBracesExpression        ttBraces
hi link ttVarIndexBracket         ttBraces
hi link ttRegExBraces             ttBraces
hi link ttOperatorsParen          ttBraces
hi link ttSubBrace                ttBraces
" }}}
hi link ttBracesFunction          ttFunction

" Link Various Variable Names to ttVarName {{{
hi link ttLoopVarBlock            ttVarName
hi link ttMathVarBlock            ttVarName
hi link ttFormatVarBlock          ttVarName
hi link ttRegexVarBlock           ttVarName
hi link ttReplaceVarBlock         ttVarName
hi link ttVarVarBlock             ttVarName
hi link ttListVarBlock            ttVarName
hi link ttPathVarBlock            ttVarName
hi link ttVarVar                  ttVarName
hi link ttMathVar                 ttVarName
hi link ttFormatVar               ttVarName
hi link ttRegexVar                ttVarName
hi link ttReplaceVar              ttVarName
hi link ttListVar                 ttVarName
hi link ttPathVar                 ttVarName
hi link ttScriptVarNameVar        ttVarName
" }}}

" Link all pattern blocks together {{{
hi link ttPatternBlockHigh        ttPatternBlock
hi link ttPatternBlockSub         ttPatternBlock
" }}}

" Link all names to ttIdentifier {{{
hi link ttClassName               ttIdentifier
hi link ttClassNameBlock          ttIdentifier
hi link ttTimeNameBlock           ttIdentifier
hi link ttSessionNameBlock        ttIdentifier
hi link ttSessionName             ttIdentifier
hi link ttRunSessionNameBlock     ttIdentifier
hi link ttRunSessionName          ttIdentifier
hi link ttUnBlock                 ttIdentifier
hi link ttUn                      ttIdentifier
" }}}

" Link various number types to ttNumber {{{
hi link ttInt                     ttNumber
hi link ttFloat                   ttNumber
" }}}

hi link ttFunctionNameBlock       ttFunction

hi link ttFileNameBlock           ttFileName

hi link ttScriptShell             ttShellCmd

hi link ttVarBlock                ttVar
hi link ttVarBraces               ttVar

hi link ttNopComment              ttComment
hi link ttNop                     ttCmd
hi link ttCommentError            ttError

hi link ttErrorBlock              ttError
" }}}

" Link tt Highlighting Groups to Default Groups {{{
hi default link ttVar                     Special
hi default link ttCmd                     Statement
hi default link ttBraces                  Delimiter
hi default link ttCmdSep                  Delimiter
hi default link ttFileName                Character
hi default link ttReference               Special
hi default link ttMacro                   Macro
hi default link ttKeyword                 Keyword
hi default link ttFunction                Function
hi default link ttShellCmd                Character
hi default link ttVarName                 Identifier
hi default link ttIdentifier              Identifier
hi default link ttNumber                  Number
hi default link ttString                  String
hi default link ttOperators               Operator
hi default link ttCodeBlock               Structure
hi default link ttTodo                    Todo
hi default link ttComment                 Comment
hi default link ttError                   Error
" }}}

let b:current_syntax = "tt"
