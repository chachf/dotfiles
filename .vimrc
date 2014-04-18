" GENERAL:

colorscheme vitamins 
"colorscheme desert 

"set cursorline
"highlight CursorLine ctermfg=red

"Para fixar a cor do texto
"highlight Normal ctermfg=red

" GENERAL:

"syntax on
colorscheme vitamins 
"colorscheme desert 

"Pour que le curseur soit toujours au milieu de la page:
"set scrolloff=30

"Pour voir la ligne du curseur:
set cursorline
"set cursorcolumn

set wrapmargin=10

nnoremap :W :w

"me coupe une ligne trop longue a 80 caracteres:
"nnoremap g 75\|Bi

"NAVIGATION:


"NAVIGATION:

nnoremap k gk
nnoremap j gj
nnoremap OA 5k
nnoremap OB 5j
nnoremap OD 5h
nnoremap OC 5l

"NAVIGATION ENTRE BUFFERS:

nnoremap [ :w:bprev
nnoremap ] :w:bnext

"Enable MOUSE
set mouse=a

"NUMBERING LINES:
set number
"numerotation relative a ma position actuelle:
"set relativenumber

"Pour que le curseur soit toujours au milieu de la page:
set scrolloff=10

set incsearch
"set hlsearch
map  <F12> :set hls!<CR>
" SEARCH:
set incsearch
"set hlsearch
map  <F12> :set hls!<CR>
nnoremap <SPACE> /
nnoremap <SPACE><SPACE> ?

set wrapscan

"Bien pour python:
set autoindent

" OPTIONAL: This enables automatic indentation as you type.
"filetype indent on

"---------MAPPINGS GLOBAUX---------

let mapleader = "-"

"resourcer en mode normal
nnoremap <leader>sv :source $MYVIMRC
"resourcer en mode normal:
nnoremap <leader>sv :source ~/.vimrc<ENTER>
"editer mon vimrc:
nnoremap <leader>ev :split ~/.vimrc<ENTER>

nnoremap [1;5A :resize +5
nnoremap [1;5B :resize -5

"remapper esc:
inoremap kj <esc>

"remapper enter pour le mode normal:
nnoremap  eBi

"remapper space pour le mode normal:
nnoremap <space> i<space><esc>h  

"effacer un mot en appuyant sur delete (meme si je ne suis qu'au milieu)
nnoremap [3~ bdw 

"effacer le dernier caractere de la ligne
nnoremap <leader>d ml$x`l

vnoremap > >gv
vnoremap < <gv


"effacer un mot en appuyant sur delete (meme si je ne suis qu'au milieu)
nnoremap [3~ bdw 

"pour commenter en mode visuel mais en gardant la selection:
vnoremap > >gv
vnoremap < <gv

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

"----- Mappings LATEX --------

"CA SERAIT BIEN DE CREER DES GROUPES pour les autocommands

"nnoremap <C-L> :w<ENTER>:!pdflatex % <ENTER>

"copier ce qui se trouve dans le $...$ le plus proche:
autocmd filetype tex nnoremap Y mof$lyt$`o

"commencer un environnement
autocmd filetype tex nnoremap <C-B> i\begin{
"----- LATEX --------

"Compiler SM-book.tex:
nnoremap <C-L> :w<ENTER>:!pdflatex --shell-escape SM-book.tex <ENTER>
"Compiler le fichier actuel:
"nnoremap <C-L> :w<ENTER>:!pdflatex % <ENTER>

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

"Para completar um ambiente (tipo fechar \begin{equation}):
" En mode inserer: je suis genre a \begin{equation_, et je 
" veux completer:
autocmd filetype tex inoremap <C-E> }yT{oo\end{pa}2kA\label{}i
" En mode normal, je veux juste fermer un ambiente:
autocmd filetype tex nnoremap <C-E> i\end<ESC>mz?\\begin<ENTER>2wy%`zp 

" EQUATIONS:
autocmd filetype tex inoremap <C-E> }yT{oo\end{pa}2kAji
" En mode normal, je veux juste fermer un ambiente:
autocmd filetype tex nnoremap <C-E> i\end<ESC>mz?\\begin<ENTER>2wy%`zp 

"EQUATIONS:

"commencer un environnement
autocmd filetype tex nnoremap <C-B> i\begin{

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

"Para fazer um FOLD com a imagem na qual o cursor esta:
nnoremap [20~ ?begin{tikzpicture}zf/end{tikzpicture}
"OBS: le defaut est que le /end{tikzpicture} est enregistre comme
" le "search" courant, et donc si ensuite 
"jútilise les touches n et N, il me
"recherche un "end{tikzpicture}"...
"Trocar um \[...\] por \begin{equation}...\end{equation}:
autocmd filetype tex nnoremap ** /\\]<enter>2xa\end{equation}<esc>?\\[<enter>2xi\begin{equation}\label{}<esc>i
"Trocar um $...$ por um \[...\]:
autocmd filetype tex nnoremap && F$xi<ENTER>\[<ENTER><ESC>f$s<ENTER>\]<ESC>k

" Les fonctions qui me stockent la session quand je ferme vim:
autocmd VimEnter * call LoadSession()
autocmd VimLeave * call SaveSession()

function! SaveSession()
  execute 'mksession! $HOME/.vim/sessions/session.vim'
endfunction

function! LoadSession()
  if argc() == 0
  	execute 'source $HOME/.vim/sessions/session.vim'
  endif
endfunction

"ma recherche des intervales ouverts et fermes:
":%s_\]\(.*\),\(.*\)\[_(\1,\2)_
"mieux:
"%s_[\]\[][^\$]*,[^\$]*[\]\[]_ff_c
"et qui marche:

":%s_\]\([^\$]*\),\([^\$]*\)\[_(\1,\2)_gc

" Le script qui insere la date au debut du fichier:
autocmd FileWritePre *.tex mark s|call MyLastMod()|'s
"il faudrait que l'action de MyLastMod soit pas undoable...
"(on s'en rend compte a mesure qu'on sauve, compile, corrige, etc.)
fun! MyLastMod()
let currenttime = strftime("%c")
"exe "1Gisalut"
exe "1,10s/modification: .*/modification: " . currenttime
exe "1,10s/modification:/modification: " . currenttime
"ici faudrait inserer un teste qui regarde si cette ligne existe.
"si elle n'existe pas, la creer.
"1GiLast Modification
endfun

