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

" tag dictionary
let s:tags = {}
let s:tags.cm = { 'tag': 'command', 'type': 'inline' }
let s:tags.ppt = { 'tag': 'prompt', 'type': 'inline' }
let s:tags.em = { 'tag': 'emphasis', 'type': 'inline' }
let s:tags.emb = { 'tag': 'emphasis', 'type': 'inline', 'param': 'role="bold"' }
let s:tags.fn = { 'tag': 'filename', 'type': 'inline' }
let s:tags.gm = { 'tag': 'guimenu', 'type': 'inline' }
let s:tags.kc = { 'tag': 'keycap', 'type': 'inline' }
let s:tags.kcf = { 'tag': 'keycap', 'type': 'inline', 'param': 'function=""', 'cursor': '""' }
let s:tags.kca = { 'tag': 'keycap', 'type': 'inline', 'param': 'function="alt"' }
let s:tags.kcc = { 'tag': 'keycap', 'type': 'inline', 'param': 'function="control"' }
let s:tags.kcd = { 'tag': 'keycap', 'type': 'inline', 'param': 'function="delete"' }
let s:tags.kcs = { 'tag': 'keycap', 'type': 'inline', 'param': 'function="shift"' }
let s:tags.kce = { 'tag': 'keycap', 'type': 'inline', 'param': 'function="enter"' }
let s:tags.kces = { 'tag': 'keycap', 'type': 'inline', 'param': 'function="escape"' }
let s:tags.tt = { 'tag': 'title', 'type': 'lonely' }
let s:tags.pa = { 'tag': 'para', 'type': 'outline' }
let s:tags.te = { 'tag': 'entry', 'type': 'inline' }
let s:tags.va = { 'tag': 'varname', 'type': 'inline' }
let s:tags.si = { 'tag': 'systemitem', 'type': 'inline' }
let s:tags.sid = { 'tag': 'systemitem', 'type': 'inline', 'param': 'class="daemon"' }
let s:tags.siu = { 'tag': 'systemitem', 'type': 'inline', 'param': 'class="username"' }
let s:tags.sir = { 'tag': 'systemitem', 'type': 'inline', 'param': 'class="resource"' }
let s:tags.qt = { 'tag': 'quote', 'type': 'inline' }
let s:tags.rm = { 'tag': 'remark', 'type': 'inline' }
let s:tags.rp = { 'tag': 'replaceable', 'type': 'inline' }
let s:tags.ph = { 'tag': 'phrase', 'type': 'inline' }
let s:tags.php = { 'tag': 'phrase', 'type': 'inline', 'param': 'role="productname"' }
let s:tags.pk = { 'tag': 'package', 'type': 'inline' }
let s:tags.op = { 'tag': 'option', 'type': 'inline' }
let s:tags.ll = { 'tag': 'literal', 'type': 'inline' }
let s:tags.ln = { 'tag': 'link', 'type': 'inline', 'param': 'xlink:href=""', 'nopair': 1, 'cursor': '""' }
let s:tags.xr = { 'tag': 'xref', 'type': 'inline', 'param': 'linkend=""', 'nopair': 1, 'cursor': '""' }
let s:tags.tm = { 'tag': 'term', 'type': 'lonely' }
let s:tags.li = { 'tag': 'listitem', 'type': 'outline' }
let s:tags.lip = { 'tag': 'listitem', 'type': 'outline', 'include': ['pa'] }
let s:tags.im = { 'tag': 'important', 'type': 'outline', 'include': ['tt','pa'], 'cursor': 'tt' }
let s:tags.il = { 'tag': 'itemizedlist', 'type': 'outline', 'include': ['lip'] }
let s:tags.km = { 'tag': 'keycombo', 'type': 'inline', 'include': ['kc'] }
let s:tags.ap = { 'tag': 'appendix', 'type': 'outline', 'param': 'xml:id=""', 'include': ['tt', 'pa'], 'cursor': '""' }
let s:tags.ct = { 'tag': 'callout', 'type': 'outline', 'param': 'arearefs=""', 'include': [ 'pa'], 'cursor': '""' }
let s:tags.cl = { 'tag': 'calloutlist', 'type': 'outline', 'include': [ 'ct'], 'cursor': '""' }
let s:tags.co = { 'tag': 'co', 'type': 'inline', 'param': 'xml:id=""', 'cursor': '""' }
let s:tags.ex = { 'tag': 'example', 'type': 'outline', 'include': [ 'tt' ], 'cursor': 'tt' }
let s:tags.nt = { 'tag': 'note', 'type': 'outline', 'include': [ 'tt', 'pa' ], 'cursor': 'tt' }
let s:tags.mn = { 'tag': 'menuchoice', 'type': 'inline', 'include': [ 'gm' ] }
let s:tags.ol = { 'tag': 'orderedlist', 'type': 'outline', 'include': [ 'lip' ] }
let s:tags.pr = { 'tag': 'procedure', 'type': 'outline', 'include': [ 'st' ] }
let s:tags.st = { 'tag': 'step', 'type': 'outline', 'include': [ 'pa' ] }
let s:tags.s1 = { 'tag': 'sect1', 'type': 'outline', 'param': 'xml:id=""', 'include': [ 'tt', 'pa' ], 'cursor': '""' }
let s:tags.s2 = { 'tag': 'sect2', 'type': 'outline', 'param': 'xml:id=""', 'include': [ 'tt', 'pa' ], 'cursor': '""' }
let s:tags.s3 = { 'tag': 'sect3', 'type': 'outline', 'param': 'xml:id=""', 'include': [ 'tt', 'pa' ], 'cursor': '""' }
let s:tags.sc = { 'tag': 'screen', 'type': 'inline' }
let s:tags.tp = { 'tag': 'tip', 'type': 'outline', 'include': [ 'tt', 'pa' ], 'cursor': 'tt' }
let s:tags.wn = { 'tag': 'warning', 'type': 'outline', 'include': [ 'tt', 'pa' ], 'cursor': 'tt' }
let s:tags.ve = { 'tag': 'varlistentry', 'type': 'outline', 'include': [ 'tm', 'lip' ], 'cursor': 'tm' }
let s:tags.vl = { 'tag': 'variablelist', 'type': 'outline', 'include': [ 've' ], 'cursor': 'tm' }
let s:tags.qu = { 'tag': 'question', 'type': 'outline', 'include': [ 'pa' ] }
let s:tags.an = { 'tag': 'answer', 'type': 'outline', 'include': [ 'pa' ] }
let s:tags.qe = { 'tag': 'qandaentry', 'type': 'outline', 'include': [ 'qu', 'an' ] }
let s:tags.qs = { 'tag': 'qandaset', 'type': 'outline', 'include': [ 'qe'  ] }
let s:tags.imd = { 'tag': 'imagedata', 'type': 'lonely', 'param': 'fileref="" width="75%"', 'nopair': 1 }
let s:tags.imof = { 'tag': 'imageobject', 'type': 'outline', 'param': 'role="fo"', 'include': ['imd'] }
let s:tags.imoh = { 'tag': 'imageobject', 'type': 'outline', 'param': 'role="html"', 'include': ['imd'] }
let s:tags.mo = { 'tag': 'mediaobject', 'type': 'outline', 'include': ['imof', 'imoh'] }
let s:tags.fg = { 'tag': 'figure', 'type': 'outline', 'include': ['tt', 'mo'], 'cursor': 'tt' }
"noremap! <unique> <localleader>ge <glossentry>><localleader>gt<ESC>o<localleader>gd
"noremap! <unique> <localleader>gd <glossdef>><localleader>pa
"noremap! <unique> <localleader>gl <glossary>><localleader>tt<ESC>o<localleader>ge<ESC>?title<CR>F<i
"noremap! <unique> <localleader>gt <glossterm <localleader>id>
"noremap! <unique> <localleader>in <indexterm>><primary><ESC>o<secondary><ESC>[]i
"noremap! <unique> <localleader>pt <part <localleader>id>><localleader>tt<ESC>o
"noremap! <unique> <localleader>bk <book xmlns="http://docbook.org/ns/docbook" xmlns:xi="http://www.w3.org/2001/XInclude" xmlns:xlink="http://www.w3.org/1999/xlink" version="5.0" <localleader>id><CR><ESC>O<localleader>tt<ESC>o<localleader>pt<ESC>[][]i
"noremap! <unique> <localleader>ch <chapter xmlns="http://docbook.org/ns/docbook" xmlns:xi="http://www.w3.org/2001/XInclude" xmlns:xlink="http://www.w3.org/1999/xlink" version="5.0" <localleader>id><CR><ESC>O<localleader>tt<ESC>o<localleader>pa<ESC>[]i

" tables
"noremap! <unique> <localleader>tr <row>><localleader>te
"noremap! <unique> <localleader>th <thead>><localleader>tr
"noremap! <unique> <localleader>td <tbody>><localleader>tr
"noremap! <unique> <localleader>tb <table>><localleader>tt<ESC>o<?dbhtml table-width="%" ?><ESC>o<?dbfo table-width="%" ?><CR><tgroup cols="">><localleader>th<ESC>2jo<localleader>td<ESC>?<title><CR>f>a


""""""" generally render a given DB tag
if !exists(":DocbkPrintTag")
  command -nargs=1 -range DocbkPrintTag :call s:DocbkPrintTag(<f-args>)
endif

function s:DocbkPrintTag(tag)
  " remember initial cursor position
  let curpos = getcurpos()
  " repeat the outer tag as specified
  let result = repeat(s:DocbkRenderTag(a:tag), v:count1)
  if !empty(result)
    " use 'z' register to put the text into buffer
    let @z = result
    " depending on the tag type, decide whether p or P put mode
    let type = get(get(s:tags, a:tag), 'type')
    if type == 'inline'
      " paste inline and indent (fixes #6)
      execute 'normal! "zp1=='
    else
      " paste outlined, count number of pasted lines and delete last line (\n)
      " (fixes #7)
      execute 'normal! "zP' . len(split(@z, "\n")) . 'jdd'
    endif
    " restore cursor position
    call setpos(".", curpos)
    " do indentation for outline blocks
    if type != 'inline'
      let line_count = count(@z,"\n")
      execute "normal!" line_count . "=="
    endif

    " find the right cursor insert position and possibly free 1 line
    let cursor = get(get(s:tags, a:tag), 'cursor')
    if !empty(cursor)
      " 'cursor' parameter is not empty
      if cursor == '""'
        " If 'cursor' is "", then check if 'param' is set to'xml:id' and try to
        " copy previous xmld:id value
        let param = get(get(s:tags, a:tag), 'param')
        if param == 'xml:id=""'
          " get the line number of the previous xml:id="" parameter and
          " continue if it is > 0
          let lnum = search('xml:id="\(\S\+\)"', 'Wbn')
          if lnum > 0
            " copy the value of xml:id="" into "z register
            let @z = matchstr(getline(lnum), '\c xml:id=\([''"]\)\zs.\{-}\ze\1') . '-'
            call search('""', 'zW')
            execute 'normal! "zpl'
          else
            call search('""', 'zW')
            normal! l
          endif
        endif
        startinsert
      else
        " 'cursor' is a tag; find its next occurence and put cursor inside
        let tag = get(get(s:tags, cursor), 'tag')
        if !empty(tag)
          call search("<\/" . tag, 'zW')
          startinsert
        else
          echoerr "Cursor tag '" . tag . "' not defined"
        endif
      endif
    else
      " 'cursor' parameter is empty; find next closing tag and place cursor inside
      call search("<\/", 'zW')
      if type == 'outline'
        " for outline tags, place cursor at the end of opening tag
        normal! k
        startinsert!
      else
        " for inline tags, place cursor inside the current tag
        startinsert
      endif
    endif
  endif
endfunction

function s:DocbkRenderTag(tag)
  " do i know the tag?
  if has_key(s:tags, a:tag)
    let type = get(get(s:tags, a:tag), 'type')
    let tag = get(get(s:tags, a:tag), 'tag')
    let param = get(get(s:tags, a:tag), 'param')
    let nopair = get(get(s:tags, a:tag), 'nopair')
    let include = get(get(s:tags, a:tag), 'include')
    let starttag = tag
    let endtag = tag
    let result = ''
    " add optional param if set
    if !empty(param)
      let starttag .= ' ' . param
    endif
    let incl_result = ''
    if !empty(include)
      for incl_tag in include
        let incl_result .= s:DocbkRenderTag(incl_tag)
      endfor
    endif
    if type == 'inline'
      if nopair
        " nopair tags are closed straight away
        let markup = "<" . starttag . "/>"
      elseif !empty(incl_result)
        let markup = "<" . starttag . ">" . incl_result . "</" . endtag . ">"
      else
        let markup = "<" . starttag . "></" . endtag . ">"
      endif
    elseif type == 'lonely'
      if nopair
        let markup = "<" . starttag . "/>\n"
      else
        if !empty(incl_result)
          let markup = "<" . starttag . ">" . incl_result . "</" . endtag . ">\n"
        else
          let markup = "<" . starttag . "></" . endtag . ">\n"
        endif
      endif
    elseif type == 'outline'
      if !empty(incl_result)
        let markup = "<" . starttag . ">\n" . incl_result . "</" . endtag . ">\n"
      else
        let markup = "<" . starttag . ">\n</" . endtag . ">\n"
      endif
    endif
    let result .= markup
    return result
  else
    echoerr "Unknown tag '" . a:tag . "'"
  endif
endfunction

" create <itemizedlist> out of lines with text
if !exists(":DocbkSurroundListitems")
  command -nargs=* -range  DocbkSurroundListitems :<line1>,<line2>call s:DocbkSurroundListitems(<f-args>)
endif
" turn <itemizedlist> into <procedure>
if !exists(":DocbkIlist2Proc")
  command -nargs=* -range  DocbkIlist2Proc :<line1>,<line2>call s:DocbkIlist2Proc(<f-args>)
endif
" turn <procedure> into <itemizedlist>
if !exists(":DocbkProc2Ilist")
  command -nargs=* -range  DocbkProc2Ilist :<line1>,<line2>call s:DocbkProc2Ilist(<f-args>)
endif
"-------------------------------------------------------------------"
function s:DocbkIlist2Proc(...)
  s/<itemizedlist>/<procedure>/e
  s/<\/itemizedlist>/<\/procedure>/e
  s/<listitem>/<step>/e
  s/<\/listitem>/<\/step>/e
endfunction

function s:DocbkProc2Ilist(...)
  s/<procedure>/<itemizedlist>/e
  s/<\/procedure>/<\/itemizedlist>/e
  s/<step>/<listitem>/e
  s/<\/step>/<\/listitem>/e
  s/<substeps>/<\itemizedlist>/e
  s/<\/substeps>/<\/itemizedlist>/e
endfunction

function s:DocbkSurroundListitems(il, trim, ...) range
  " save the range to a list
  let lines = getline(a:firstline, a:lastline)
  " delete the lines from current buffer
  execute a:firstline . ',' . a:lastline . 'd'
  " jump into insert mode
  execute 'normal' 'ki'
  if a:il == 'il'
    " insert start of <itemizedlist>
    put='<itemizedlist>'
  endif
  " iterate over each line in the selected range
  for line in lines
    if a:trim == 'trim'
      " remove white spaces from the beginning of the line
      let line = substitute(line, '^\s*', '', '')
      " remove white spaces from the end of the line
      let line = substitute(line, '\s*$', '', '')
    endif
    " append <lititems>
    let line = "<listitem><para>" . line . "</para></listitem>"
    put=line
  endfor
  if a:il == 'il'
    " insert end of </itemizedlist>
    put='</itemizedlist>'
  endif
endfunction
"-----------------------------------------------------------------"
for short_tag in keys(s:tags)
  execute "inoremap <unique> <localleader>" . short_tag . " \<ESC>:DocbkPrintTag " . short_tag . "<CR>"
  execute "nnoremap <unique> <localleader>" . short_tag . " :<C-U>DocbkPrintTag " . short_tag . "<CR>"
endfor

let &cpo = s:save_cpo
