" Vim plugin for easy inserting DocBook5 snippets
" Maintainer: Tomáš Bažant <tbazant@suse.cz>
" License:	This file is placed in the public domain.
"

" set the 'cpoptions' option to its Vim default value and restore it later
let s:save_cpo = &cpo
set cpo&vim

" check if this plugin was loaded before
if exists("g:loaded_docbook_templates")
  "finish
endif
let g:loaded_docbook_templates = 1


map! <unique> <Leader>c <command>
map! <unique> <Leader>em <emphasis>
map! <unique> <Leader>ex <example>><Leader>tt
map! <unique> <Leader>f <filename>
map! <unique> <Leader>fg <figure>><Leader>tt<ESC>A<CR><mediaobject>><imageobject role="fo">><imagedata fileref="" width="70%" format="PNG"/><ESC>jA<CR><imageobject role="html">><imagedata fileref="" width="70%" format="PNG"/><ESC>6k7hi
map! <unique> <Leader>g <guimenu>
map! <unique> <Leader>id xml:id=""
map! <unique> <Leader>il <itemizedlist>><Leader>li
map! <unique> <Leader>im <important>><Leader>tt<ESC>A<CR><Leader>pa<ESC>2k7li
map! <unique> <Leader>li <listitem>><Leader>pa
map! <unique> <Leader>ll <literal>
map! <unique> <Leader>ln <link xlink:href=""/><ESC>2hi
map! <unique> <Leader>nt <note>><Leader>tt<ESC>A<CR><Leader>pa<ESC>2k7li
map! <unique> <Leader>op <option>
map! <unique> <Leader>pa <para>>
map! <unique> <Leader>pr <procedure>><Leader>st
map! <unique> <Leader>q <quote>
map! <unique> <Leader>r <replaceable>
map! <unique> <Leader>s1 <sect1 <Leader>id>><Leader>tt<ESC>A<CR><Leader>pa<ESC>2k7li
map! <unique> <Leader>s2 <sect2 <Leader>id>><Leader>tt<ESC>A<CR><Leader>pa<ESC>2k7li
map! <unique> <Leader>s3 <sect3>><Leader>tt<ESC>A<CR><Leader>pa<ESC>2k7li
map! <unique> <Leader>sc <screen>><ESC>kVjj:le<CR>ji
map! <unique> <Leader>si <systemitem>
map! <unique> <Leader>sid <systemitem class="daemon">
map! <unique> <Leader>siip <systemitem class="ipaddress">
map! <unique> <Leader>siu <systemitem class="username">
map! <unique> <Leader>sir <systemitem class="resource">
map! <unique> <Leader>st <step>><Leader>pa
map! <unique> <Leader>tp <tip>><Leader>tt<ESC>A<CR><Leader>pa
map! <unique> <Leader>tt <title>
map! <unique> <Leader>ve <varlistentry>><Leader>li<ESC>3kA<CR><term>
map! <unique> <Leader>vl <variablelist>><Leader>ve
map! <unique> <Leader>w <warning>><Leader>tt<ESC>A<CR><Leader>pa<ESC>2k6li
map! <unique> <Leader>x <xref linkend=""/><ESC>2hi

let &cpo = s:save_cpo
