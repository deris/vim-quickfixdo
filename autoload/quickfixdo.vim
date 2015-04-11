" quickfixdo - execute Vim command for each file in quickfix list
" Version: 0.1.0
" Copyright (C) 2015 deris <deris0126@gmail.com>
" License: MIT license  {{{
"     Permission is hereby granted, free of charge, to any person obtaining
"     a copy of this software and associated documentation files (the
"     "Software"), to deal in the Software without restriction, including
"     without limitation the rights to use, copy, modify, merge, publish,
"     distribute, sublicense, and/or sell copies of the Software, and to
"     permit persons to whom the Software is furnished to do so, subject to
"     the following conditions:
"
"     The above copyright notice and this permission notice shall be included
"     in all copies or substantial portions of the Software.
"
"     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
"     OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
"     MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
"     IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
"     CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
"     TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
"     SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
" }}}

let s:save_cpo = &cpo
set cpo&vim

" Public API {{{1

function! quickfixdo#do(command)
  let qflist = getqflist()
  let bufnrs = map(copy(qflist), "v:val['bufnr']")
  let bufnrs = uniq(sort(bufnrs))
  let bufnames = filter(map(bufnrs, 'bufname(v:val)'), "v:val != ''")

  execute 'arglocal ' join(bufnames, ' ')
  execute 'argdo ' a:command
endfunction

"}}}

let &cpo = s:save_cpo
unlet s:save_cpo

" __END__ "{{{1
" vim: foldmethod=marker
