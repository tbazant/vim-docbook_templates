" Vim plugin for easy inserting DocBook5 snippets
" Maintainer: Tomáš Bažant <tbazant@suse.cz>
" License:This file is placed in the public domain.
"

" set the 'cpoptions' option to its Vim default value and restore it later
let s:save_cpo = &cpo
set cpo&vim

" check if this plugin was loaded before
if exists("g:loaded_docbook_templates")
  "finish
endif
let g:loaded_docbook_templates = 1

map! <unique> <localleader>ap <appendix <localleader>id>><localleader>tt<ESC>o<localleader>pa<ESC>[]i
map! <unique> <localleader>bk <book xmlns="http://docbook.org/ns/docbook" xmlns:xi="http://www.w3.org/2001/XInclude" xmlns:xlink="http://www.w3.org/1999/xlink" version="5.0" <localleader>id><CR><ESC>O<localleader>tt<ESC>o<localleader>pt<ESC>[][]i
map! <unique> <localleader>cl <calloutlist>><localleader>ct
map! <unique> <localleader>co <co <localleader>id/><ESC>F"i
map! <unique> <localleader>ct <callout arearefs="">><localleader>pa<ESC>[[[[f"a
map! <unique> <localleader>cm <command>
map! <unique> <localleader>ch <chapter xmlns="http://docbook.org/ns/docbook" xmlns:xi="http://www.w3.org/2001/XInclude" xmlns:xlink="http://www.w3.org/1999/xlink" version="5.0" <localleader>id><CR><ESC>O<localleader>tt<ESC>o<localleader>pa<ESC>[]i
map! <unique> <localleader>emb <emphasis role="bold">
map! <unique> <localleader>em <emphasis>
map! <unique> <localleader>ex <example>><localleader>tt<ESC>o<localleader>pa
map! <unique> <localleader>fn <filename>
map! <unique> <localleader>fg <figure>><localleader>tt<ESC>o<mediaobject>><imageobject role="fo">><imagedata fileref="" width="70%" format="PNG"/><ESC>jo<imageobject role="html">><imagedata fileref="" width="70%" format="PNG"/><ESC>[][]i
map! <unique> <localleader>ge <glossentry>><localleader>gt<ESC>o<localleader>gd
map! <unique> <localleader>gd <glossdef>><localleader>pa
map! <unique> <localleader>gl <glossary>><localleader>tt<ESC>o<localleader>ge<ESC>?title<CR>F<i
map! <unique> <localleader>gt <glossterm <localleader>id>
map! <unique> <localleader>gm <guimenu>
map! <unique> <localleader>id xml:id=""
map! <unique> <localleader>il <itemizedlist>><localleader>li
map! <unique> <localleader>im <important>><localleader>tt<ESC>o<localleader>pa<ESC>[]i
map! <unique> <localleader>in <indexterm>><primary><ESC>o<secondary><ESC>[]i
map! <unique> <localleader>kc <keycap>
map! <unique> <localleader>kcf <keycap function=""/><ESC>F"i
map! <unique> <localleader>kca <localleader>kcfalt<ESC>f>A
map! <unique> <localleader>kcc <localleader>kcfcontrol<ESC>f>A
map! <unique> <localleader>kcd <localleader>kcfdelete<ESC>f>A
map! <unique> <localleader>kcs <localleader>kcfshift<ESC>f>A
map! <unique> <localleader>kce <localleader>kcfescape<ESC>f>A
map! <unique> <localleader>km <keycombo>><localleader>kc<ESC>O<localleader>kcf
map! <unique> <localleader>li <listitem>><localleader>pa
map! <unique> <localleader>ll <literal>
map! <unique> <localleader>ln <link xlink:href=""/><ESC>F"i
map! <unique> <localleader>nt <note>><localleader>tt<ESC>o<localleader>pa<ESC>[]i
map! <unique> <localleader>ol <orderedlist>><localleader>li
map! <unique> <localleader>op <option>
map! <unique> <localleader>pa <para>>
map! <unique> <localleader>ph <phrase>
map! <unique> <localleader>php <phrase role="productname">
map! <unique> <localleader>pk <package>
map! <unique> <localleader>pr <procedure>><localleader>st
map! <unique> <localleader>pt <part <localleader>id>><localleader>tt<ESC>o
map! <unique> <localleader>qt <quote>
map! <unique> <localleader>rp <replaceable>
map! <unique> <localleader>s1 <sect1 <localleader>id>><localleader>tt<ESC>o<localleader>pa<ESC>[]i
map! <unique> <localleader>s2 <sect2 <localleader>id>><localleader>tt<ESC>o<localleader>pa<ESC>[]i
map! <unique> <localleader>s3 <sect3>><localleader>tt<ESC>o<localleader>pa<ESC>[]i
map! <unique> <localleader>sc <screen>><ESC>kVjj:le<CR>ji
map! <unique> <localleader>si <systemitem>
map! <unique> <localleader>sid <systemitem class="daemon">
map! <unique> <localleader>siip <systemitem class="ipaddress">
map! <unique> <localleader>siu <systemitem class="username">
map! <unique> <localleader>sir <systemitem class="resource">
map! <unique> <localleader>st <step>><localleader>pa
map! <unique> <localleader>tp <tip>><localleader>tt<ESC>o<localleader>pa
map! <unique> <localleader>tt <title>
map! <unique> <localleader>va <varname>
map! <unique> <localleader>ve <varlistentry>><term><ESC>o<localleader>li<ESC>[]i
map! <unique> <localleader>vl <variablelist>><localleader>ve
map! <unique> <localleader>wn <warning>><localleader>tt<ESC>o<localleader>pa<ESC>[]i
map! <unique> <localleader>xr <xref linkend=""/><ESC>F"i

let &cpo = s:save_cpo
