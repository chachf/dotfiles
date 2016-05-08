colorscheme vitamins 

"colorscheme desert 

"set cursorline
"highlight CursorLine ctermfg=red

"Para fixar a cor do texto
"highlight Normal ctermfg=red

" GENERAL:

"remapper esc:
inoremap kj <esc>

"syntax on

"Pour voir la ligne du curseur:
set cursorline
"set cursorcolumn

set wrapmargin=10

nnoremap :W :w

"NAVIGATION:

nnoremap k gk
nnoremap j gj
nnoremap OA {
nnoremap OB }
nnoremap OD 5h
nnoremap OC 5l

"SEARCH:

nnoremap <SPACE> /
nnoremap <SPACE><SPACE> ?

set incsearch
"set hlsearch
map  <F12> :set hls!<CR>

"NAVIGATION ENTRE BUFFERS:

nnoremap [ :w:bprev
nnoremap ] :w:bnext

"Enable MOUSE
set mouse=a

"NUMBERING LINES:
set number
"numerotation relative a ma position actuelle:
"set relativenumber

set wrapscan

"Bien pour python:
set autoindent

" OPTIONAL: This enables automatic indentation as you type.
"filetype indent on

"---------MAPPINGS GLOBAUX---------

let mapleader = "-"

"resourcer en mode normal
nnoremap <leader>sv :source ~/.vimrc<ENTER>
"editer mon vimrc:
nnoremap <leader>ev :split ~/.vimrc<ENTER>

nnoremap [1;5A :resize +5
nnoremap [1;5B :resize -5


"effacer un mot en appuyant sur delete (meme si je ne suis qu'au milieu)
nnoremap [3~ bdw 

"---- COMMENTAIRES -----:

"em bash,
autocmd filetype bash nnoremap OR :s/^/#/<c-m>
autocmd filetype bash vnoremap OR :s/^/#/<c-m>gv

"em vimrc, MARCHE PAS
"em vimrc,
autocmd filetype vim nnoremap OR :s/^/"/<c-m>
autocmd filetype vim nnoremap OS :s/^"//<c-m>
autocmd filetype vim vnoremap OR :s/^/"/<c-m>gv
autocmd filetype vim vnoremap OS :s/^"//<c-m>gv

"en latex, 
autocmd filetype tex vnoremap OR :s/^/%/<c-m>gv
autocmd filetype tex vnoremap OS :s/^%//<c-m>gv
autocmd filetype tex nnoremap OR :s/^/%/<c-m>
autocmd filetype tex nnoremap OS :s/^%//<c-m>

"En Python, 
autocmd FileType python vnoremap OR :s/^/#/<C-M>gv
autocmd FileType python vnoremap OS :s/^#//<C-M>gv
autocmd FileType python nnoremap OR :s/^/#/<C-M>
autocmd FileType python nnoremap OS :s/^#//<C-M>

"---- PASTE -----
nnoremap [15~ :set paste
nnoremap [17~ :set nopaste

" ----------------------------
"----- Mappings LATEX --------
"-----------------------------

"CA SERAIT BIEN DE CREER DES GROUPES pour les autocommands

"Pour configurer la compilation:
" un truc qui commencait a marcher, en ligne de commande:
" :execute "nnoremap <C-L> :nnoremap h D<enter>"
" para SMbook:
nnoremap <C-L> :w<ENTER>:!pdflatex --shell-escape SM-book.tex <ENTER>
" para Apostila:
"nnoremap <C-L> :w<ENTER>:!pdflatex Apostila.tex <ENTER>
" para fichier actuel:
"nnoremap <C-L> :w<ENTER>:!pdflatex % <ENTER>

"copier ce qui se trouve dans le $...$ le plus proche:
autocmd filetype tex nnoremap Y mof$lyt$`o

"commencer un environnement
autocmd filetype tex nnoremap <C-B> i\begin{


"EMPHASIZER en mode VISUEL
vnoremap e <ESC>`>a}<ESC>`<i\emph{<ESC>

"COPIER-COLLER
"copier ce qui se trouve dans le $...$ le plus proche:
autocmd filetype tex nnoremap Y mof$lyt$`o

"copier ce qui se trouve dans le \label{...} de la ligne courante, 
"et le placer dans le registre o:
autocmd filetype tex nnoremap  mo/label<ENTER>e2l"oyi{`o
"coller le contenu du registre o dans un \eqref{...}:
autocmd filetype tex inoremap  {}<ESC>"oP  

" EQUATIONS:
" En mode inserer: je suis genre a \begin{equation_, et je 
" veux completer:
autocmd filetype tex inoremap <C-E> }yT{oo\end{pa}2kAji
" En mode normal, je veux juste fermer un ambiente:
autocmd filetype tex nnoremap <C-E> i\end<ESC>mz?\\begin<ENTER>2wy%`zp 

"EQUATIONS:

"commencer un environnement
autocmd filetype tex nnoremap <C-B> i\begin{
autocmd filetype tex inoremap $$ \(\)<ESC>hi

"iabbrev $$ \(\)<ESC>hi
iabbrev eqn \[<ENTER><ENTER>\]<ESC>ki<BS>
iabbrev Eqn \begin{equation}\label{}<ENTER><ENTER>\end{equation}<ESC>kk$i<BS>
iabbrev algn \begin{align*}\end{align*}ki

"Para trocar um ambiente \[... em \begin{equation}...
" (faut se mettre quelque part a l'interieur des \[...\])
nnoremap ** /\\]<enter>2xa\end{equation}<esc>?\\[<enter>2xi\begin{equation}\label{}<esc>i

"Para trocar um $...$ por um \[...\] en mode normal:
nnoremap && F$xi<ENTER>\[<ENTER><ESC>f$s<ENTER>\]<ESC>k

"pour mettre un emph
nnoremap <leader>em mybi\emph{ea}`yw

"pour mettre un grasA
nnoremap <leader>gr bi\grasA{ea}

"pour creer un label
nnoremap <leader>l a\label{}<esc>i

"pour ouvrir un align:
nnoremap <leader>a O\begin{align*}\end{align*}ki

"pour ouvrir un exercice
nnoremap <leader>ex i\begin{exercise}\end{exercise}<esc>ki

"pour ouvrir une solution
nnoremap <leader>so i\begin{sol}\end{sol}ki

"pour ouvrir un enumerate
nnoremap <leader>en i\begin{enumerate}\end{enumerate}ki\item

"pour mettre un item
nnoremap <leader>it i\item 

"Trocar um \[...\] por \begin{equation}...\end{equation}:
autocmd filetype tex nnoremap ** /\\]<enter>2xa\end{equation}<esc>?\\[<enter>2xi\begin{equation}\label{}<esc>i
"Trocar um \[...\] por um \begin{align*}...\end{align*}
autocmd filetype tex nnoremap ## mp?\\[<enter>2xi\begin{align*}<esc>/\\]<enter>2xi\end{align*}<esc>`p
"Trocar um $...$ por um \[...\]:
autocmd filetype tex nnoremap && F$xi<ENTER>\[<ENTER><ESC>f$s<ENTER>\]<ESC>k

" Les fonctions qui me stockent la session quand je ferme vim:
function! SaveSession()
  execute 'mksession! $HOME/.vim/sessions/session.vim'
endfunction

function! LoadSession()
  if argc() == 0
  	execute 'source $HOME/.vim/sessions/session.vim'
  endif
endfunction

autocmd VimEnter * call LoadSession()
autocmd VimLeave * call SaveSession()

