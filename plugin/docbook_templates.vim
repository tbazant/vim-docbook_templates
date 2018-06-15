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


map! <unique> <Leader>ap <appendix <Leader>id>><Leader>tt<ESC>o<Leader>pa<ESC>[]i
map! <unique> <Leader>bk <book xmlns="http://docbook.org/ns/docbook" xmlns:xi="http://www.w3.org/2001/XInclude" xmlns:xlink="http://www.w3.org/1999/xlink" version="5.0" <Leader>id><CR><ESC>O<Leader>tt<ESC>o<Leader>pt<ESC>[][]i
map! <unique> <Leader>cl <calloutlist>><Leader>ct
map! <unique> <Leader>co <co <Leader>id/><ESC>F"i
map! <unique> <Leader>ct <callout arearefs="">><Leader>pa<ESC>[[[[f"a
map! <unique> <Leader>cm <command>
map! <unique> <Leader>ch <chapter xmlns="http://docbook.org/ns/docbook" xmlns:xi="http://www.w3.org/2001/XInclude" xmlns:xlink="http://www.w3.org/1999/xlink" version="5.0" <Leader>id><CR><ESC>O<Leader>tt<ESC>o<Leader>pa<ESC>[]i
map! <unique> <Leader>emb <emphasis role="bold">
map! <unique> <Leader>em <emphasis>
map! <unique> <Leader>ex <example>><Leader>tt<ESC>o<Leader>pa
map! <unique> <Leader>fn <filename>
map! <unique> <Leader>fg <figure>><Leader>tt<ESC>o<mediaobject>><imageobject role="fo">><imagedata fileref="" width="70%" format="PNG"/><ESC>jo<imageobject role="html">><imagedata fileref="" width="70%" format="PNG"/><ESC>[][]i
map! <unique> <Leader>ge <glossentry>><Leader>gt<ESC>o<Leader>gd
map! <unique> <Leader>gd <glossdef>><Leader>pa
map! <unique> <Leader>gl <glossary>><Leader>tt<ESC>o<Leader>ge<ESC>?title<CR>F<i
map! <unique> <Leader>gt <glossterm <Leader>id>
map! <unique> <Leader>gm <guimenu>
map! <unique> <Leader>id xml:id=""
map! <unique> <Leader>il <itemizedlist>><Leader>li
map! <unique> <Leader>im <important>><Leader>tt<ESC>o<Leader>pa<ESC>[]i
map! <unique> <Leader>in <indexterm>><primary><ESC>o<secondary><ESC>[]i
map! <unique> <Leader>kc <keycap>
map! <unique> <Leader>kcf <keycap function=""/><ESC>F"i
map! <unique> <Leader>kca <Leader>kcfalt<ESC>f>A
map! <unique> <Leader>kcc <Leader>kcfcontrol<ESC>f>A
map! <unique> <Leader>kcd <Leader>kcfdelete<ESC>f>A
map! <unique> <Leader>kcs <Leader>kcfshift<ESC>f>A
map! <unique> <Leader>kce <Leader>kcfescape<ESC>f>A
map! <unique> <Leader>km <keycombo>><Leader>kc<ESC>O<Leader>kcf
map! <unique> <Leader>li <listitem>><Leader>pa
map! <unique> <Leader>ll <literal>
map! <unique> <Leader>ln <link xlink:href=""/><ESC>F"i
map! <unique> <Leader>nt <note>><Leader>tt<ESC>o<Leader>pa<ESC>[]i
map! <unique> <Leader>ol <orderedlist>><Leader>li
map! <unique> <Leader>op <option>
map! <unique> <Leader>pa <para>>
map! <unique> <Leader>ph <phrase>
map! <unique> <Leader>php <phrase role="productname">
map! <unique> <Leader>pk <package>
map! <unique> <Leader>pr <procedure>><Leader>st
map! <unique> <Leader>pt <part <Leader>id>><Leader>tt<ESC>o
map! <unique> <Leader>qt <quote>
map! <unique> <Leader>rp <replaceable>
map! <unique> <Leader>s1 <sect1 <Leader>id>><Leader>tt<ESC>o<Leader>pa<ESC>[]i
map! <unique> <Leader>s2 <sect2 <Leader>id>><Leader>tt<ESC>o<Leader>pa<ESC>[]i
map! <unique> <Leader>s3 <sect3>><Leader>tt<ESC>o<Leader>pa<ESC>[]i
map! <unique> <Leader>sc <screen>><ESC>kVjj:le<CR>ji
map! <unique> <Leader>si <systemitem>
map! <unique> <Leader>sid <systemitem class="daemon">
map! <unique> <Leader>siip <systemitem class="ipaddress">
map! <unique> <Leader>siu <systemitem class="username">
map! <unique> <Leader>sir <systemitem class="resource">
map! <unique> <Leader>st <step>><Leader>pa
map! <unique> <Leader>tp <tip>><Leader>tt<ESC>o<Leader>pa
map! <unique> <Leader>tt <title>
map! <unique> <Leader>va <varname>
map! <unique> <Leader>ve <varlistentry>><term><ESC>o<Leader>li<ESC>[]i
map! <unique> <Leader>vl <variablelist>><Leader>ve
map! <unique> <Leader>wn <warning>><Leader>tt<ESC>o<Leader>pa<ESC>[]i
map! <unique> <Leader>xr <xref linkend=""/><ESC>F"i

let &cpo = s:save_cpo
