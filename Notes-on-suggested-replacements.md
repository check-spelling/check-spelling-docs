# Notes on suggested replacements

## Simple script

- [Input description](#input-description)
- [Observations](#observations)
- [Command run](#command-run)

### Input description

`/tmp/input` is based on the output for an actual repository.
I haven't created a PR for the repository yet because the list was so large.
`/tmp/words` is the standard dictionary

### Observations

This output is a good argument in favor of a smaller dictionary along with [Area dictionaries](./Feature:-Area-dictionaries).

### Command run

```sh
root@docker-desktop:/github/workspace# for a in $(cat /tmp/input |egrep '.....' |tr "'" '_'|xargs -n 10 echo |tr ' ' '|'); do
>   tre-agrep -i -1 -e '^('$a')$' /tmp/words > /tmp/input2;
>   if [ ! -s /tmp/input2 ]; then
>     echo "skipped $a"
>   else
>     for b in $(echo $a | tr '|' ' '|tr '_' "'"); do
>       maybe=$(tre-agrep -i -2 -e '"^'$(echo $b | tr A-Z a-z)'$' /tmp/input2)
>       if [ -n "$maybe" ]; then
>         count=$(echo "$maybe"|wc -l);
>         if [ $count -eq 1 ]; then
>           echo "$b --> $maybe"
>         else
>           echo "$b .> $(echo $maybe)"
>         fi
>       fi
>     done
>   fi
> done
accending .> acceding accenting ascending
accomadate --> accomodate
accomodated .> accommodated accomodate
accumlate --> accumulate
accumlated --> accumulated
accumuated --> accumulated
accumuluate --> accumulate
Actualy .> actual actually actuals actuary
Additionallly --> additionally
addop .> ADDCP adrop
algorihm .> algorism algorithm
alikes .> alike Alikee alines alives Alkes alsikes likes
alise .> Alice alice Alie alife alike Aline aline Alis Alisa alish aliso alisp alist alite alive Aloise alose alwise Alyse anise arise Calise Elise Ilise Lalise Lise valise
alism .> agism Alis Alisa alish aliso alisp alist apism malism
alisse .> Alissa Blisse palisse plisse
aliti .> alibi alii ALIT alit Alita alite ality baliti liti
alize .> Alice alice Alie alife alike Aline aline alite alive Aliza balize
alloc .> allo allo- Alloa allod alloo allot allow alloy
alloca .> Alloa Allock Alpoca
allocats .> allocate allocates
Alnum .> album algum Alnus alnus alum annum
ALTERTABLE --> alterable
altform --> aliform
antipenultimate --> antepenultimate
anylist --> Anglist
APICALL .> apical apicals
appaise .> apaise appraise apprise
appendf .> append appends
appliation .> ampliation application
arglist --> Anglist
Arithemetic --> arithmetic
Atempted .> adempted attempted tempted
atime .> abime AIME Aime anime atame atimy stime Time time
ation .> action adion aion aition anion Arion atimon -ation Aton avion axion cation dation kation lation nation ration sation stion -tion
ational .> actional atonal National national rational
ative .> active alive -ative dative lative native sative stive
ATOMI .> atom ATOMS atoms atomy Otomi Tomi
ATTAC .> Atta atta Attah attal attar ATTC Attic attic
attemmpt --> attempt
attempeted .> attempered attempted
autoinc --> autoing
skipped AUTOINIT|autolock|automerge|AUTOPROXY|AUTORESET|Autovac|autovacuum|autovacuuming|auxdata|AUXDELETE
auxilliary .> auxiliary auxillary
backend .> backbend backed backen back-end backened
backtracing --> backtracking
Badkey .> barkey bedkey
BBBBA .> Bubba bubba
BIGENDIAN .> Big-endian big-endian
biliti .> baliti Bilati bilith
BITAND --> biland
BITNOT .> BITNET bitnet
BITOR .> Bator biter bito Biton bittor
bitset .> biset Bisset BITNET bitnet bitser
blockid --> blocked
Bloggs .> Boggs gloggs
Borland .> bogland Boland Bolland Forland Morland norland Orland Worland
bsize .> baize bize Brize BSIE isize psize size
bstate .> astate bistate estate State state
bswap --> swap
btree .> boree Bree bree stree Tree tree
Buider .> bider budder builder bulder Bunder bunder guider
BULKLOAD --> bunkload
butoindex --> autoindex
bytea .> batea Butea byte bytes
Bytef .> byte bytes
CACHESPILL --> cachespell
cantains .> captains contains
capget .> Capet caplet
capset .> Capet caplet
carglist .> Carlist carlist
CArray .> array Carnay carrat Carry carry warray
cbegin .> Begin begin
CCHECK .> acheck check Scheck
ccons .> cions clons CONS Cons cons coons icons
cctype .> cotype ectype
cdate .> Cate cate crate date
CDEBUG --> debug
cdecl --> decl
cerod .> cered cero cero- ceroid ceros Herod
cerrno --> Cerro
CERROR .> Cerro error terror
CFATAL --> fatal
characgter --> character
Charlen .> Carlen CHARGEN Charlean Charlee Charleen Charles charles Charlet charlet Charley charley Charlyn Harlen
charset .> charet Charlet charlet charoset charvet
CHARX .> Char char char- CHARA Chara chara Chard chard chare Chari chark charm Charo charr chars chart chary
chdir .> chair cheir choir
checkpointer --> checkpointed
choosen .> choose chooser chooses choosey Chosen chosen
chown .> chawn Chon chon Chosn Chow chow chowk chows clown Cown Crown crown shown
chracters --> characters
chrono .> Chromo chromo Chron Chron. chron chron- chron.
chroot --> cheroot
CINFO .> cuinfo info
CInst .> canst cinct cist Const const Inst inst yinst
CKLOCK --> clock
cksum --> Aksum
CKVERS .> cavers covers
cluase --> clumse
cmake .> cake clake comake crake make
cmdline --> codline
cmode .> code Mode mode
cname .> Came came clame fname name
collist .> cellist Collis collis pollist
colset .> Colet colet collet corset coset cosset cotset
columnlist --> columnist
columnsize --> columnize
comand .> Coman command conand tomand
COMDB .> comb comd comdg Comdr comdr Comdt comdt
comparision .> comparison comparition
compat .> combat compaa COMPACT compact compar compart compot compt COMSAT Comsat comsat cowpat
compatiable .> companiable compatable compatible
compenents --> components
compount --> compound
concat --> Concan
concatentated --> concatenated
conceptally --> conceptually
condidtions --> conditions
conent .> cogent colent Conant concent consent content convent covent nonent ponent
config .> confit confix
configuations --> configurations
configurationt .> configuration configurations
configuraton --> configuration
confstr --> constr
connetion .> connation connection connexion
conslist --> consist
consonent --> consonant
constains .> constrains contains
constaints .> constants constraints
constrution --> construction
contaning --> containing
continguous .> contiguous continuous
contraint --> constraint
Converst .> Converse converse conversi converso convert
coord .> chord cooed Coorg Coors Cord cord Koord loord oord soord
correcct --> correct
correponding --> corresponding
coverate .> coverage overate
Covidx .> covid covido
cpack .> cack chack clack crack Pack pack spack
CPLOG .> clog colog
creater .> cheater Crater crater creaker Creamer creamer creaser create created creates Creator creator Greater greater treater
CResult --> result
csignal --> signal
Csrid .> carid CSRI
cstring --> string
CTest .> cest chest crest cutest Test test
ctime .> chime clime crime ctimo stime Time time
ctimestamp --> timestamp
CTRACE .> curace Trace trace
ctype .> clype cotype ectype -type type
currect .> correct current
CURRUPT --> corrupt
CVERBOSE --> verbose
CVLOG .> clog colog
CWARNING --> warning
cwchar --> cichar
databaes --> databases
datam .> DATA data datum
DATAW .> DATA data datsw
datestamp --> date-stamp
datrabase --> database
Dbase .> abase Base base dase DBAS debase dibase
DBMOD --> dmod
dbname .> dcbname ddname dename dsname
dbread .> bread DBRAD dread
dbsize --> desize
dcache .> cache Dache
DCHECK .> acheck check Scheck
DCLOG .> clog DILOG
dcookie .> Cookie cookie
debian .> cebian Decian Delian delian Derian
decendents .> decedents dependents descendents
defaut .> Defant defat default
Deffered --> differed
defragment .> defrayment refragment
deinitialize --> reinitialize
DELPP .> Delp delph
delwin .> Delwin Delwyn Derwin Elwin Kelwin Selwin
demang .> defang demand Deming Semang semang
demangle --> bemangle
demonstrat --> demonstrant
deque .> Dehue Depue
dequote .> bequote requote
dequoted --> requoted
dequoting --> requoting
Descr .> desc desc. DESPR
DFUNCTION .> afunction defunction function
DHAVE .> Bhave chave Dave dave deave dhava djave Drave drave have shave thave
diabled .> diable dialed dialled dibbled disabled
DIAGS .> dags diag diag. dials DIAS Dias dias Diggs digs dings drags
Differnt --> different
dirent .> direct direst drent virent
dirfd --> dird
DISKIO .> Diskin Disko
DISTINCTBY --> distinctly
distingishing --> distinguishing
docid --> Docia
docsize --> dockize
doctotal --> doctoral
documnent --> document
dotnet .> Donet donet dotlet
downsides .> downside downsizes
DPLOG --> DILOG
DValue .> devalue evalue lvalue value
DVLOG --> DILOG
dword .> sword Word word
EAGAIN .> again Eagan
EAUTH .> auth Earth earth eath
EBUSY .> bebusy busy embusy rebusy
ECursor --> cursor
EEXIST .> exist Rexist sexist
EINTR .> Einar entr intr
elist .> alist blist delist elint Eliot Elis Elisa Elise Elish enlist Epist epist exist glist LIST List list relist
Ellips .> Ellis ellops
ement .> ament Bement cement dement emend EMet enent event -ment Ment ment sement
EMERG .> emer Emera Emery emery
ENCMASK --> enmask
encounted .> encounter uncounted
encouragment --> encouragement
encrouch --> encroach
endfor --> Endor
endian .> Andian endia Indian indian
endiate .> endgate endite
endif .> EDIF endia Enif
Endof .> Endo endo- Endor endow
endwin .> Edwin Eldwin endrin
ENOENT .> endent enent enoint
enterances --> entrances
entiries .> entires entiris entities entries
envforce --> enforce
EOVERFLOW .> overflow reoverflow
EPERM .> deperm Perm perm sperm
ephem .> Ephes Ephrem
ephermeral --> ephemeral
epoll .> Poll poll repoll
Eqivalent .> equivalent equvalent
escarg .> escar escarp escars
esign .> design Ensign ensign resign sign
etaci .> ETACC ETSACI Staci
EType .> ectype etape retype -type type
evalutes .> evaluates evolutes
evita .> Edita Elita Elvita Evita evite VITA Vita vita
Excesss .> excess excesses
exectable .> ejectable electable erectable exactable execrable executable expectable
Executables --> executable
exfat --> exeat
existance .> existence exitance
expresion --> expression
expresssion --> expression
ezila .> eila zila
facter .> facer facier Factor factor falter faster fatter
fadvise .> advise fadaise
fallocate --> allocate
fbase .> abase Base base fease frase
fclose .> Close close filose
ffast .> FAST Fast fast Feast feast
fflush .> aflush flush
fgets .> fets frets gets
fibonacci --> Fibonacci
fileno --> Gileno
finalised --> finalized
finalizer .> finalize finalized finalizes
Finially .> filially finally finically
finit .> binit fanit Fini fini finis Finist fixit init
fireb .> fire fire- fired firer fires
Firefox --> firebox
FIXME .> Fiume fixe
flage .> Alage fage flag Flagg flags flake flame flane flange flare fuage plage
flused .> flued fluked flumed flushed fluted fluxed fused
follwed .> follied followed
follwing .> following follying
fopen .> copen open
foreach --> foreact
FOREGUARD .> fireguard fore-uard
fputs --> puts
frams .> crams drams flams foams forams frags FRAM Fram Frame frame frames Frans fraps frass frats Fraus fraus frays grams prams rams trams
fread .> aread bread cread dread freak fream Frear FRED Fred fred Freed freed fremd Freud freud oread Read read tread
Freeable .> feeable freezable
freepage .> creepage freelage
fsanitize --> sanitize
fseek --> seek
fstat .> -stat stat
fstream .> astream stream
fsync .> async sync
ftell .> fell stell Tell tell
FToken --> token
ftruncate --> truncate
FULLSIZE --> full-size
funtions --> functions
futex .> frutex fute
futher .> Father father fluther fother further futter Huther Luther luther outher puther ruther suther Uther uther wuther
fwrite .> cwrite write
geopoly --> geopony
getgid --> getid
Getint --> retint
getline .> getling setline
getnerate --> generate
getpid --> getid
getres .> genres Gerres metres
getsid .> geosid getid
gettid --> getid
getuid .> getid setuid
gibabyte --> gigabyte
glibc --> glib
Globbing .> blobbing globing gobbing lobbing
Google .> goggle googly Goole goozle
Gosub --> Golub
Groupid .> grouped groupie groupoid
guranteed --> guaranteed
gutman .> gunman Guzman outman tutman
Habibi .> Habib Habiri
hardhit .> hardhat hard-hit
Hewardt --> Hewart
HIBIT --> habit
Highlite .> highlife highline
highwater --> high-water
hinst .> hins hint Hirst hirst hist Inst inst yinst
HINSTANCE --> instance
historcal .> historial historical
Hitmap --> bitmap
HLOCAL --> local
HMODULE --> module
HOMEPATH --> homeopath
hostid .> hosted hostie
icate .> acate Cate cate irate micate OCATE Ocate
idendified --> identified
idenified --> identified
idlist .> ideist Idist idlest idlish Idoist idolist idylist
ifdef --> indef
ifndef --> indef
IFREG .> ifree irreg
iltne .> Ilene Iline Ilone
incrmental .> incremental incruental
indentify --> identify
infop .> info infos
initalize --> initialize
initialising --> initializing
initing .> igniting inciting inditing inviting uniting
initone --> intone
inlined .> inclined inline unlined
inode .> anode binode enode IndE inde inone Inoue iode ISODE node unode
inotify --> notify
Insance .> inhance insane insanie instance
Intead .> instead intend
intecepted --> intercepted
interation .> inceration integration interaction internation iteration
Interator .> integrator iterator
interruptx .> interrupt interrupts
intialize --> initialize
Intint .> intent intinct intine
intrin .> antrin intron
IOCAP --> LOCAP
ioprio --> Iorio
IPHONE .> -phone phone
iplan .> Ilan IPLAN PLAN plan
IPrintable --> printable
IROTH .> broth froth liroth Roth Troth troth wroth
IRUSR --> Irus
ISADMIN --> isamin
isisi .> ISIS Isis isis ISSI Issi sisi
ISLNK --> Islek
ismatch .> mismatch smatch
isnan .> Ishan Isman isnad
ISNOOP --> snoop
ISNOT .> islot isn't isnt snot
ISPAGE --> mispage
isprint .> imprint misprint sprint
Isquote --> misquote
ISREG .> irreg ISRG
issisi .> Assisi assisi
isspace --> misspace
IStorage --> storage
ITelemetry --> telemetry
itila .> Atila Iila Itala Otila Stila Tila
ITracer --> tracer
iveness --> liveness
iviti --> Viti
IWorker --> worker
IWOTH --> iworth
ization --> -ization
Javid .> avid David david Jarid Javed pavid Ravid
JContent --> content
JEACH .> Beach beach Deach each keach Leach leach meach peach reach Teach teach
JNODE .> anode enode node unode
JSize .> isize psize size
JSYNC .> async sync
kcache --> cache
kexec .> DEXEC exec kexes
ktime .> stime Time time
langid .> langi languid
languageid --> languaged
lanoita --> Lanita
lastest .> fastest latest vastest
lexer .> hexer laxer leer Leger leger Leler leper Lever lever lexes Rexer vexer
libelf .> libel libels
libkern --> libken
lineno .> linen Linene linens lineny
linux .> Linum linum Linus
lised .> ised lased lesed lied liked limed lined Lise lisped listed lived lysed vised wised
LITTLEENDIAN --> Little-endian
lockd .> Lock lock Locke locked locks Locky locky
lockingv .> locking lockings
loggable --> floggable
LOGMAX .> logman Lomax
Longf .> Long long long- longa longe Longo Longs longs
lpanel --> panel
skipped LPCREATEFILE|LPCSTR|LPCVOID|LPCWSTR|LPDIR|LPDIRENT|LPDWORD|LPFILETIME|LPHANDLE|LPOSVERSIONINFOA
skipped LPOSVERSIONINFOW|LPOVERLAPPED|LPSECURITY|LPSTR|LPSYSTEM|LPSYSTEMTIME|LPUINT|LPVOID|LPWSTR|lremovexattr
lseek .> leek seek
LSHIFT --> shift
LSlot .> islot slot
lstat .> -stat stat
LTerm .> CTERM TERM term
ltrim --> trim
MADEBY --> madefy
madvise --> advise
mailto --> Malto
malloc .> Mallon mallow Malloy
manditory --> mandatory
manpage --> manage
MAXCELLS --> maxwells
maxlen .> Madlen Mallen Marlen
mbind .> BIND bind embind Mind mind
Mcafee .> McAfee McFee
Meeus .> Medeus meeds Meeks Meers meets menus meous metus
memfd --> mmfd
memmove --> emmove
memset --> messet
memsys --> Metsys
MEMUSED --> bemused
MEVENT .> event movent revent
milli .> Billi dilli Gilli Jilli Lilli Melli Mill mill Milla milla mille Milli Mills mills Milly milly Molli Tilli villi Willi willi
mimimum --> minimum
MINCELLS --> micells
mingw .> Ming ming minge Mingo mingy minow
minmax --> minimax
Minset .> inset mindset minuet misset
minux .> minum minus MINX minx
misdeclared --> misdeclare
mkdir --> mudir
mlock .> Block block clock flock -lock Lock lock mock Mulock plock slock
mmapped --> mapped
modifed --> modified
mprotect --> protect
mremap --> remap
msdos --> MSDOS
msgget --> mugget
msila .> Mila mila
msize .> isize Maize maize Mize mize MSIE psize size vmsize
msleep .> asleep Sleep sleep
msync .> async sync
mtime .> MIME Mime mime stime Time time
multimap --> multigap
multipled .> multiped multiple multiples multiplet multiplex multiplied
multiset .> multijet multisect
munlock .> Gunlock gunlock mullock Mulock murlock unlock
mutex .> murex mute muted Muter muter mutes
mutexes --> murexes
mysql --> mysel
nabble .> babble cabble dabble gabble gnabble habble jabble knabble mabble nable nibble nobble nubble nybble pabble rabble snabble wabble yabble
naidx .> naid Naida
ncell .> Ancell cell encell Nell Noell
NCHANGE .> change unchange
NCounter .> acounter counter encounter
ncurses .> curses nurses
ndata .> DATA data Nata niata
NDEBUG --> debug
NDeep .> adeep deep neep undeep
NDELAY --> delay
NDUMMY --> dummy
nearset .> gearset NEARNET
needd .> need needed needn needs needy neeld
NELEM .> Belem elem neem
newmask --> Newmark
Newrow --> Nedrow
newwin --> Newlin
NFILE .> enfile file infile Neile Nile nile nofile unfile
nitems .> items niters
nlink .> blink clink enlink glink Link link plink slink unlink
NLOCK .> Block block clock enlock flock -lock Lock lock nock plock slock unlock
NLOOKAHEAD --> lookahead
NLOOP .> bloop cloop loop noop sloop unloop
nname .> fname name unname
nocase --> nocake
NOCONTENT --> noncontent
NOENT .> nocent noint nonent
NOHAVE --> Mohave
NOIDX --> noix
noita .> Nita nokta Nolita Norita nota Oita
NOLFS .> golfs nolos wolfs
nomatch .> nobatch nomarch
nomem .> Nome nome nomen nomes nomnem novem
Nonleaf --> nondeaf
NOSYNC --> nonsync
notindexed --> nonindexed
NPAGE .> NAGE Page page
NPHRASE --> phrase
NPREFIX --> prefix
NProfile --> profile
NQuery --> query
NREADER .> dreader Reader reader treader
nscan .> ascan Nascan Oscan oscan SCAN scan
NSLOT .> islot Nilot nilot slot unslot
nsort .> isort Niort sort ssort TSORT unsort
nstep .> instep step unstep
NTDDI --> noddi
ntile .> Neile Nile nile stile tile untile utile
NTimes .> Nimes stimes times
NULLEQ --> nulled
numberic --> numeric
nvertex --> vertex
NVISIT --> visit
objecct --> object
objiter --> obiter
occuring --> occurring
oflags --> flags
onerow --> onehow
ONETERM --> one-term
onoff --> gnoff
OPENX .> open opens
opflag --> pflag
optimiation --> optimization
optimisation --> optimization
orderby --> orderly
Ostar .> COSTAR costar osar OSCAR Oscar oscar Oskar Ostap Oster ottar Star star
OSTRACE .> ostraca outrace postrace
ostream .> astream Ostrea stream
Otherwse --> otherwise
Othewise --> otherwise
ousness --> outness
outfile .> outfire outwile
outta .> Butta gutta Jutta kutta Oueta sutta Utta
Overwritting --> overwriting
pagelist --> panelist
PAGERID --> pagurid
paramater --> parameter
params .> param paramo paramos Paramus paras prams
paramter --> parameter
passwd --> passed
Pathto .> Pashto pashto
pcache .> cache piache
PCHECK .> acheck check Scheck
pclose .> Close close pilose upclose
PDECL --> decl
peformed .> deformed performed preformed Reformed reformed
pendig .> Fendig pending
pentium --> gentium
peristent --> persistent
perror .> error pernor Perron perron terror
PGOUT .> gout pigout plout pout Prout
PGroup --> group
pgsize --> psize
PLARGE .> alarge large parge plage
PLONG .> along clong elong flong klong -long Long long plang plonk pong prong uplong
poiner .> coiner Joiner joiner piner Pliner poinder Poine pointer Poirer poiser Posner
popen .> copen open Papen Pope pope Popean popes Posen Poyen
posix .> BOSIX POSI posit POSIX
poslist --> pollist
postgre --> posture
PPAGE .> Page page peage phage pipage plage
ppoll .> Poll poll
pragma --> phragma
pread .> aread bread cread dread oread plead prad pred preed prepd Read read spread tread
preceeds --> proceeds
prefetch --> refetch
prerequesites --> prerequisites
prevcode --> precode
printf .> print prints
prlimit --> prelimit
procmon .> Procyon procyon
progres --> progress
provde .> proode prove provide
PSample --> sample
pselect .> prelect select
pseudocode .> pseudo-code pseudocone pseudopode
Ptest .> aptest Pest pest piest prest Test test
pthread --> thread
ptrace .> Trace trace uptrace
PTtype --> p-type
PType .> p-type -type type
pwait .> await plait twait Wait wait
pwent .> Gwent Pent pent Prent upwent went
pwrite .> cwrite perite porite pyrite write
QByte --> byte
QChar .> achar Bchar Char char echar fchar
QHash .> hash quash
QLatin .> Latin latin
QLinked .> blinked clinked linked plinked slinked
QList .> alist blist glist LIST List list quist
QMulti --> multi
QPair .> apair pair spair
QQueue --> queue
qsort .> isort sort ssort TSORT
QStack --> stack
QString --> string
QVector .> evector vector
Rahmaan .> Rahman Rahmann
rbegin .> Begin begin rebegin Regin regin
rchar .> achar Bchar Char char echar fchar rechar
RDLOCK --> relock
readdb .> readd readds
readline .> breadline deadline headline leadline redline
readlock .> deadlock headlock
READMARK --> headmark
readme --> Reade
readpoint --> reappoint
Readr .> Read read readd Reade Reader reader readl reads Ready ready rear
readv .> Read read readd Reade readl reads Ready ready
Realify --> reality
realloc .> reallot reallow
REALTIME .> mealtime real-time
rebased .> debased rebaked rebaled rebase rebated rebused
rebaser .> debaser rebase rebater
rebasing .> debasing rebaking rebaling rebating rebusing
recommeded --> recommended
refact .> arefact re-act react redact reface refait refect refract
refcount .> re-count recount
refman .> Redman refan reman
regex .> regel Regen Reger reges reget remex resex
registeries --> registries
regnew .> regrew renew
reimagining --> preimagining
reinit --> reknit
Reiniter .> reinter reuniter
relavant .> relaxant relevant
reparse --> beparse
reparsed .> reparked repassed
reparsing --> repassing
requries --> reburies
requrired --> required
resuls .> result results
retval .> retal retial retral Reval
rootpage --> rootage
ROWEST .> lowest prowest rawest rowet
rowid .> Roid roid rorid rowed
rowis .> browis Lowis Rois Roris rows
Rowkey .> Rockey rokey Rowley Rowney
rowset .> dowset roset rowet rowlet
RSHIFT .> reshift shift
rtree .> reree retree rfree stree Tree tree
rtrim .> retrim trim
runstate --> unstate
rusage .> rumage usage
santize .> rantize sanitize
scannning --> scanning
scanpt --> scant
sched .> ached eched SCED Scheld shed
scopy .> copy scop scopa scope Scopp scops -scopy scovy slopy
SDECL --> decl
seach .> Beach beach Deach each keach Leach leach meach peach reach seah sealch search sech seech Teach teach
SEEKEQ --> seeker
segement .> segment serement
segid --> Seid
segiter --> Seiter
SELECTID --> selected
semget --> semmet
semop .> remop SMOP
sendfile --> endfile
sensative --> sensitive
sentinals --> sentinels
seperate .> separate severate sperate superate
seperated --> separated
seperator --> separator
seqno .> secno segno
SETFD .> ETFD getfd
setgid --> setuid
setns .> setons sets setts
setsid .> sepsid setuid
setterm .> setter Settera setters
LITTLEENDIAN --> Little-endiansettime .> septime settima settimo
SFinder .> finder sinder spinder
shess .> chess ghess Hess sess sheas Sheds sheds shes shews Thess
shmat .> shat sheat shoat
SHMLOCK .> shlock Shulock Shylock shylock
shmpage --> sumpage
SIGIO .> sigil sitio
SIGKILL --> sigill
signalfd --> signaled
signalmap --> signalman
skipped signalname|sigpending|SIGPIPE|sigprocmask|SIGPROF|SIGPWR|sigqueueinfo|SIGQUIT|sigreturn|SIGSEGV
skipped SIGSTKFLT|SIGSTOP|sigsuspend|SIGSYS|SIGTERM|sigtimedwait|SIGTRAP|SIGTSTP|SIGTTIN|SIGTTOU
SIGURG .> Sigurd sigurd simurg
slowely .> slopely slowly
sname .> dsname fname name same SCAME shame snake snape snare
SOLARIS .> Polaris polaris solari- solaria souaris
soundex .> sounded sounder
sourcing .> souring sourling
sparc .> PARC parc SPAR Spar spar SPARC spare Spark spark sparm Sparr SPARS Spars spars spart spary
speedtest --> speediest
sqiite .> Shiite shiite
sqlar .> Salar salar Sclar Sklar SLAR solar
sqlit .> slit Split split squit
sqlite .> salite slite splite
SRVAL .> Arval arval Saval serval
ssize .> assize isize psize seize size
sstream .> astream stream
stackid --> stacked
standin .> standi stand-in Stanwin
startline --> startling
stateno --> Staten
statfs .> Staffs staffs States states Statis stats status
statment --> statement
statx .> stat stat. State state stats
stdin .> stain Stein stein
stdint --> stint
stdio .> SDIO sodio staio studio
stdout .> Stout stout strout
STOREP .> stoep store stored Storer storer stores Storey storey Strep strep
stoull .> Stoll stull
strcmp --> stramp
strcoll --> stroll
strcpy --> stripy
strdup .> Stroup stroup
STREQ .> stre stree Strep strep stret strew strey
stringify --> stringily
strlen .> stolen streen
strlike .> starlike straike strike
Strndup --> standup
STRNE .> stane Sterne Stine stine Stone stone strae stre stree Strine strone strue
strtok --> strook
Stucture --> structure
subpage .> subage sumpage suppage
Subplan .> subclan subplat
subsiduary --> subsidiary
subsitute --> substitute
subsitution --> substitution
substr --> subst
subterm --> subter-
SUCCEDED .> succeed succeeded
suported .> sported supported
supplated --> supplanted
supplimental --> supplemental
Sycalls --> scalls
symetric --> symmetric
syncfs .> synchs syncs
skipped syscall|sysconf|syscr|sysctl|sysctlbyname|syscw|sysfs|sysinfo|sysinternals|syslog
skipped sysnum|Syspage|SYSTEMTIME|SZALLOC|SZCOMPRESSED|SZELEM|SZLEAF|tablename|Tabname|takeconch
targetting .> pargetting targeting
TCHARs --> chars
tcons .> CONS Cons cons icons tons toons
technet --> techne
TELEM .> Belem elem teem tele tele- teleg Telei teles telesm TELEX Telex telex
tellg .> teleg Tell tell Tella Tello tells tellt telly
templ .> Temp temp temp. Tempa Tempe tempe Tempel tempi TEMPO tempo temps tempt
termid .> termed termin
termnal .> termal terminal ternal
terrno --> terreno
TFile .> file tile tofile toile
tflags --> flags
theaded .> headed T-headed threaded treaded
threadid --> threaded
TILDA .> Gilda Hilda Milda Rilda Silda Thilda Tila Tilda tilde Tildi Tildy Tilia Tilla Wilda
tional .> Tiona tonal Trional trional
tkill .> kill Skill skill Thill thill Till till Trill trill twill
tmask .> mask task Trask
tmout .> mout smout tout Trout trout
TName .> fname name Tame tame trame
tneme .> mneme theme toneme
tokenized --> tokenize
tokenizer --> tokenize
toobig --> too-big
Toplevel --> top-level
toupper .> Topper topper
trancations --> truncations
transfering --> transferring
trucated --> truncated
TRUEFALSE --> true-false
trunc .> tronc Truc trun trunk
turnning .> tunning turning
typeid --> typed
typeof --> typesof
UAUTH --> auth
UBool --> bool
UBreak .> break upbreak
UBSAN --> USAN
UChar .> achar Bchar Char char echar fchar UCAR
UCollation --> collation
UCollator --> collator
UError .> error terror
ULARGE .> alarge large unlarge
ulong .> along clong elong flong klong -long Long long uplong
umask .> mask unmask
UMINUS --> minus
umode .> Mode mode unode
umount .> amount Mount mount Umont unmount upmount
uname .> fname name Unami unamo unare unlame unname unsame untame
Uncached .> uncashed uncoached
uncompresses --> uncompressed
undef .> indef unde undeaf undee unden under UNEF
undefining --> unrefining
UNDELETABLE --> undelectable
underfull .> underfall underfill underpull
unfamilar --> unfamiliar
UNINIT --> unknit
unistd --> unist
unitialized .> initialized unintialized
UNLCK .> unlock unluck
unmap .> uncap unhap unlap UNMA unmad unman untap
unmapping --> uncapping
Unqual .> unequal ungual
unref .> UNEF unred
unregister .> enregister inregister
Unreset .> unbeset unrest
unshare .> unshade unshale unshape unsharp unshave unshore unsnare
UNSPEC --> unsped
upated .> pated pupated spated updated
UPLUS .> plus ulus
uppercasing --> upper-casing
upsert .> upsent upset
urandom .> random unrandom
URegular .> regular unregular
usabled .> unsabled usable
useing --> using
Userid --> guserid
ushort .> Short short unshort
USIZE .> isize psize size usine
usleep .> asleep Sleep sleep
ustat .> -stat stat
ustring .> lustring string unstring
utils .> tils util utile
utime .> stime Time time ultime untime uptime utile
utypes --> types
Varin .> Arin Carin Darin Garin Karin larin Marin ovarin sarin tarin vain varan vari vari- varia Varian Varien vario Varion varix
varint .> variant Varina varing Varini varmint
varioius --> various
VARNUM --> Barnum
VBegin .> Begin begin
vcolumn --> column
VComment --> comment
VCreate .> create ocreate
VDestroy --> destroy
verfication --> verification
veritical .> veridical vertical
VFilter --> filter
vfork --> fork
vformat --> format
VFUNCTION .> afunction function
vhangup --> hangup
vinto .> into Minto Pinto pinto Sinto Vento vino vint vinta visto Vito
vlevel --> level
VList .> alist blist glist LIST List list
vmodule --> module
VNext .> NEXT next vext
VNODE .> anode enode node unode
VNULL --> null
volumn .> column volume volumen
VOpen .> copen open
VPrev --> prev
VRegistry --> registry
VRename .> prename rename
vserver .> Server server verver
vtable .> stable table viable votable
VTrans --> trans
VUpdate --> update
WAGGREGATE --> aggregate
waitid --> waited
WALTRACE --> Wartrace
wargv --> Warga
warnning .> wanning warning
wattron .> waltron Watton
wchar .> achar Bchar Char char echar fchar whar
wcout .> Scout scout
wctrl --> ctrl
werase --> erase
WFUNCTION .> afunction function
wgetch --> wretch
wherease --> whereas
whereever .> whereover wherever
whereinfo --> whereinto
Widnows .> widows winnows
wildcards --> wildcard
Willmann --> Willman
windirent --> wind-rent
WINFILE --> infile
WInfo .> info Wingo wino
WINNT .> Winn Winna winna Winne Winni Winny wint
WINRT --> wint
winsock .> windock windsock Winlock winnock
WLoop .> bloop cloop loop sloop whoop
wmain .> amain Main main Wain wain
wmove .> amove emove move wove
worring .> Warring warring wording working worming worrying
wrefresh --> refresh
wresize --> resize
writej .> write writee writer writes
writev .> write writee writer writes
WRLCK .> wrack wreck wrick
wstring --> string
wunlink --> unlink
xamarin .> amarin camarin tamarin
xauth --> auth
XCheck .> acheck check Scheck
XClose .> Close close xylose
Xcommit --> commit
xform .> -form FORM Form form
xinfo --> info
xleft .> aleft cleft left
XList .> alist blist glist LIST List list
XLock .> Block block clock flock -lock Lock lock plock slock
XNext .> NEXT next
XOPEN .> copen open
XPROFILE --> profile
xright .> aright Bright bright fright -right right Wright wright
xterm .> CTERM TERM term
Xtract .> extract stract Tract tract
xtype .> -type type
XUnlock .> Gunlock gunlock unlock
skipped yycoverage|YYDEBUG|yyendofinput|yyerrcnt|yyerrorhit|YYERRORSYMBOL|YYFALLBACK|yygoto|yyhwm|yyinit
skipped yylhsminor|yymajor|YYMALLOCARGTYPE|yyminor|YYMINORTYPE|yyminorunion|yymsp|YYNFTS|YYNOCODE|YYNOERRORRECOVERY
skipped YYNRULE|YYNSTATE|YYNTOKEN|YYPARSEFREENEVERNULL|YYPARSEFREENOTNULL|yypminor|yyruleno|yysize|yystack|YYSTACKDEPTH
ZDUMMY --> dummy
zplan .> IPLAN PLAN plan
ZRANK .> arank brank crank drank Frank frank grank prank Rank rank trank
```

---
[FAQ](FAQ) | [Showcase](Showcase) | [Event descriptions](Event-descriptions) | [Configuration information](Configuration-information) | [Known Issues](Known-Issues) | [Possible features](Possible-features) | [Deprecations](Deprecations) | [Release notes](Release-notes) | [Helpful scripts](Helpful-scripts)
